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

// Lấy dữ liệu từ request body
$json_data = file_get_contents('php://input');
$data = json_decode($json_data); 

if ($data === null || !isset($data->email) || !isset($data->password)) {
    http_response_code(400); // Bad Request
    echo json_encode(['result' => 0, 'msg' => 'Invalid or missing email/password in JSON body']);
    exit;
}

$email = $data->email;
$password_input = $data->password; 

// --- SQL Query to find doctor ---
$sql = "SELECT id, name, email, password, token, active FROM tn_doctors WHERE email = ? AND active = 1"; 

$stmt = $pdo->prepare($sql);

try {
    $stmt->execute([$email]);

    // Lấy dữ liệu bác sĩ
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Kiểm tra nếu bác sĩ tồn tại và mật khẩu đúng
    if ($user && password_verify($password_input, $user['password'])) {
        // Tạo access token
        $access_token = base64_encode($user['id'] . '|' . time());

        // Trả về kết quả login thành công
        $response = [
            "result" => 1,
            "msg" => "Đăng nhập thành công",
            "accessToken" => $access_token, 
            "token" => $user['token'], // Trả về token Stringee của bác sĩ
            "user_info" => [
                "id" => $user['id'],
                "name" => $user['name'],
                "email" => $user['email']
            ]
        ];
        http_response_code(200); // OK
    } else {
        // Nếu email hoặc mật khẩu sai hoặc tài khoản không hoạt động
        $response = [
            "result" => 0,
            "msg" => "Email hoặc mật khẩu không đúng hoặc tài khoản không hoạt động"
        ];
        http_response_code(401); // Unauthorized
    }
} catch (PDOException $e) {
    // Nếu có lỗi khi truy vấn cơ sở dữ liệu
    http_response_code(500); // Internal Server Error
    $response = [
        "result" => 0,
        "msg" => "Database query error: " . $e->getMessage()
    ];
}

echo json_encode($response);
?>
