<?php
// Cấu hình kết nối DB
define("DB_HOST", "localhost"); 
define("DB_NAME", "do_an"); 
define("DB_USER", "root"); 
define("DB_PASS", ""); 
define("DB_ENCODING", "utf8");

// Tạo kết nối
$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
if ($conn->connect_error) {
    http_response_code(500);
    die(json_encode(["error" => "Kết nối thất bại: " . $conn->connect_error]));
}
$conn->set_charset(DB_ENCODING);

// Lấy patient ID từ query parameter
$pid = isset($_GET['pid']) ? intval($_GET['pid']) : 0;

if ($pid <= 0) {
    http_response_code(400);
    echo json_encode(["error" => "Invalid patient ID"]);
    $conn->close();
    exit();
}

// Chuẩn bị truy vấn để lấy thông tin bệnh nhân
$stmt = $conn->prepare("
    SELECT 
        id, email, phone, name, gender, birthday, address, avatar, create_at, update_at
    FROM tn_patients
    WHERE id = ?
");
$stmt->bind_param("i", $pid);
$stmt->execute();
$stmt->bind_result($id, $email, $phone, $name, $gender, $birthday, $address, $avatar, $create_at, $update_at);

// Mảng kết quả
$patient_array = array();
if ($stmt->fetch()) {
    $patient_array = array(
        "id" => $id,
        "email" => $email,
        "phone" => $phone,
        "name" => strip_tags($name),
        "gender" => $gender,
        "birthday" => $birthday,
        "address" => $address,
        "avatar" => $avatar ? "http://192.168.56.1:8080/Do_an_tot_nghiep_lph/api/assets/uploads/" . $avatar : null,
        "create_at" => $create_at,
        "update_at" => $update_at
    );
} else {
    http_response_code(404);
    echo json_encode(["error" => "Patient not found"]);
    $stmt->close();
    $conn->close();
    exit();
}

// Trả về JSON
header('Content-Type: application/json');
echo json_encode($patient_array);

// Đóng kết nối
$stmt->close();
$conn->close();
?>