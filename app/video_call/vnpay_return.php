<?php
include("connection.php");  // Bao gồm tệp kết nối cơ sở dữ liệu

// Kiểm tra nếu có tham số vnp_TxnRef và vnp_ResponseCode trong GET
if (isset($_GET['vnp_TxnRef']) && isset($_GET['vnp_ResponseCode'])) {
    // Cố định vnp_TxnRef là 1 hoặc 4
    $vnp_TxnRef = ($_GET['vnp_TxnRef'] == '1' || $_GET['vnp_TxnRef'] == '4') ? (int)$_GET['vnp_TxnRef'] : 1;  // Mặc định bằng 1 nếu không phải 1 hoặc 4
    $vnp_ResponseCode = $_GET['vnp_ResponseCode'];  // Kiểm tra mã giao dịch từ VNPay

    // Kiểm tra kết nối cơ sở dữ liệu
    if ($conn->connect_error) {
        die("Kết nối cơ sở dữ liệu thất bại: " . $conn->connect_error);
    }

    // Chỉ khi giao dịch thành công (vnp_ResponseCode == '00'), cập nhật cột 'paid' thành 1
    if ($vnp_ResponseCode == '00') {  // Giao dịch thành công

        // Kiểm tra dữ liệu nhận được (log ra file)
        error_log("vnp_TxnRef: " . $vnp_TxnRef);
        error_log("vnp_ResponseCode: " . $vnp_ResponseCode);

        // Câu lệnh SQL để cập nhật cột 'paid' thành 1 cho bác sĩ có ID = vnp_TxnRef
        $update_sql = "UPDATE tn_doctors SET paid = 1 WHERE id = ?";

        // Chuẩn bị câu lệnh SQL
        $stmt = $conn->prepare($update_sql);

        // Kiểm tra nếu câu lệnh chuẩn bị thành công
        if ($stmt === false) {
            die("Lỗi chuẩn bị câu lệnh SQL: " . $conn->error);
        }

        // Liên kết tham số và thực thi câu lệnh SQL
        $stmt->bind_param("i", $vnp_TxnRef); // "i" nghĩa là kiểu integer
        $stmt->execute();

        // Kiểm tra kết quả thực thi câu lệnh
        if ($stmt->affected_rows > 0) {
            echo "Thanh toán thành công!";
        } else {
            echo "Không tìm thấy bác sĩ hoặc đã cập nhật thanh toán.";
        }

        // Đóng câu lệnh sau khi sử dụng
        $stmt->close();
    } else {
        echo "Giao dịch không thành công.";
    }
} else {
    echo "Lỗi: Thiếu tham số vnp_TxnRef hoặc vnp_ResponseCode.";
}

// Đóng kết nối cơ sở dữ liệu
$conn->close();
?>
