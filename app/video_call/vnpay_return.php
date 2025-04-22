<?php
require_once("./config.php");

// Lấy dữ liệu từ VNPay trả về
$vnp_SecureHash = $_GET['vnp_SecureHash'] ?? '';
$inputData = [];
foreach ($_GET as $key => $value) {
    if (substr($key, 0, 4) === "vnp_") {
        $inputData[$key] = $value;
    }
}

$amount = isset($_GET['vnp_Amount']) ? (float) $_GET['vnp_Amount'] : 0;
$order_info = $_GET['vnp_OrderInfo'] ?? '';
$array = explode(" ", $order_info);
$content = $array[0] ?? '';
$pid = isset($array[1]) ? (int) $array[1] : 0;
$scheduleid = isset($array[2]) ? (int) $array[2] : 0;

// Xác thực chữ ký
unset($inputData['vnp_SecureHash']);
ksort($inputData);
$hashData = "";
$i = 0;
foreach ($inputData as $key => $value) {
    $hashData .= ($i++ ? '&' : '') . urlencode($key) . "=" . urlencode($value);
}
$secureHash = hash_hmac('sha512', $hashData, $vnp_HashSecret);

// So sánh chữ ký và xử lý
if ($secureHash === $vnp_SecureHash) {
    if ($_GET['vnp_ResponseCode'] === '00') {
        echo "<span style='color:blue'>Giao dịch thành công</span>";

        // Kết nối CSDL
        $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
        if ($conn->connect_error) {
            die("<span style='color:red'>Lỗi kết nối DB: " . $conn->connect_error . "</span>");
        }
        $conn->set_charset(DB_ENCODING);

        if ($content === "book") {
            // Đặt lịch khám
            $stmt = $conn->prepare("INSERT INTO appointment(pid, hasDone, docid, scheduledate, starttime, endtime)
                                    SELECT ?, 0, docid, scheduledate, starttime, endtime FROM schedule WHERE scheduleid = ?");
            $stmt->bind_param("ii", $pid, $scheduleid);
            $stmt->execute();

            // Lấy clinic_id
            $stmt = $conn->prepare("SELECT C.clinic_id FROM clinic C JOIN doctor D ON D.chief_id = C.chief_id JOIN schedule S ON S.docid = D.docid WHERE S.scheduleid = ?");
            $stmt->bind_param("i", $scheduleid);
            $stmt->execute();
            $result = $stmt->get_result();
            $clinic_id = $result->fetch_assoc()['clinic_id'] ?? null;

            if ($clinic_id) {
                $curr_month = (int) date("m");

                // Lấy thu nhập hiện tại
                $stmt = $conn->prepare("SELECT amount FROM income WHERE clinic_id = ? AND month = ?");
                $stmt->bind_param("ii", $clinic_id, $curr_month);
                $stmt->execute();
                $currAmount = $stmt->get_result()->fetch_assoc()['amount'] ?? 0;

                $newAmount = $currAmount + $amount / (100 * 1000000);

                // Cập nhật thu nhập
                $stmt = $conn->prepare("UPDATE income SET amount = ? WHERE clinic_id = ? AND month = ?");
                $stmt->bind_param("dii", $newAmount, $clinic_id, $curr_month);
                $stmt->execute();

                // Đánh dấu lịch đã được đặt
                $stmt = $conn->prepare("UPDATE schedule SET booked = 1 WHERE scheduleid = ?");
                $stmt->bind_param("i", $scheduleid);
                $stmt->execute();
            }

        } else {
            // Thanh toán cho videocall
            $stmt = $conn->prepare("UPDATE videocall SET paid = 1 WHERE pid = ? AND docid = ?");
            $stmt->bind_param("ii", $pid, $scheduleid);
            $stmt->execute();
        }

        $conn->close();
    } else {
        echo "<span style='color:red'>Giao dịch không thành công</span>";
    }
} else {
    echo "<span style='color:red'>Chữ ký không hợp lệ</span>";
}
?>
