<?php
// --- Headers ---

header('Content-Type: application/json');

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');


if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200); // OK
    exit(0);
}

// --- Cấu hình kết nối cơ sở dữ liệu ---
$host = 'localhost';
$dbname = 'do_an';     
$username = 'root';
$password_db = '';      

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password_db); // Thêm charset=utf8
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
} catch (PDOException $e) {
    
    http_response_code(500); // Internal Server Error
    echo json_encode(['result' => 0, 'msg' => 'Database connection failed: ' . $e->getMessage()]);
    exit;
}

// --- Lấy dữ liệu JSON thô từ yêu cầu POST ---
$json_data = file_get_contents('php://input');


$data = json_decode($json_data); 


if ($data === null || !isset($data->email) || !isset($data->password)) {
     http_response_code(400); // Bad Request
     echo json_encode(['result' => 0, 'msg' => 'Invalid or missing email/password in JSON body']);
     exit;
}


$email = $data->email;
$password_input = $data->password; 


$sql = "SELECT id, name, email FROM tn_doctors WHERE email = ? AND password = ?"; // Lấy thêm id, name, email nếu cần
$stmt = $pdo->prepare($sql);

try {
    $stmt->execute([$email, $password_input]);

    // Lấy dữ liệu người dùng
    $user = $stmt->fetch(PDO::FETCH_ASSOC); // Lấy dòng kết quả dưới dạng mảng kết hợp

    // --- Kiểm tra kết quả ---
    if ($user) {
        
        $simple_token = base64_encode($user['id'] . '|' . time());

        $response = [
            "result" => 1, // Thành công
            "msg" => "Đăng nhập thành công",
            "accessToken" => $simple_token, 

            "user_info" => [
                "id" => $user['id'],
                "name" => $user['name'],
                "email" => $user['email']
            ]
        ];
        http_response_code(200); // OK
    } else {
        $response = [
            "result" => 0, 
            "msg" => "Email hoặc mật khẩu không đúng"
        ];
         http_response_code(401); // Unauthorized
    }
} catch (PDOException $e) {
    // Lỗi thực thi câu lệnh SQL
    http_response_code(500); // Internal Server Error
    $response = [
        "result" => 0,
        "msg" => "Database query error: " . $e->getMessage()
    ];
}
echo json_encode($response);

?>