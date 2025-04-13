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

// Truy vấn dữ liệu theo đúng model CallDoctor
$stmt = $conn->prepare("
    SELECT id, email, phone, name, description, price, role, avatar, speciality_id
    FROM tn_doctors
    WHERE active = 1
");
$stmt->execute();
$stmt->bind_result($id, $email, $phone, $name, $description, $price, $role, $avatar, $speciality_id);

// Mảng kết quả
$doctor_array = array();
while ($stmt->fetch()) {
    $temp = array(
        "id" => $id,
        "email" => $email,
        "phone" => $phone,
        "name" => strip_tags($name),
        "description" => strip_tags($description),
        "price" => $price,
        "role" => $role,
        "avatar" => "http://192.168.56.1:8080/Do_an_tot_nghiep_lph/api/assets/uploads/" . $avatar,
        "speciality_id" => $speciality_id
    );
    $doctor_array[] = $temp;
}

// Trả về JSON
header('Content-Type: application/json');
echo json_encode($doctor_array);

// Đóng kết nối
$conn->close();
?>
