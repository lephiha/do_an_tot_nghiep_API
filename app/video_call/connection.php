<?php
// Bao gồm file config.php để lấy thông tin kết nối
include("config.php");

// Kết nối cơ sở dữ liệu MySQL với mysqli
$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Cấu hình charset cho kết nối
$conn->set_charset(DB_ENCODING);
?>
