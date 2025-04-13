<?php
// --- Headers ---
// Báo cho client biết nội dung trả về là JSON
header('Content-Type: application/json');
// Cho phép truy cập từ mọi nguồn (CORS) - Chỉ dùng cho phát triển
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Xử lý yêu cầu OPTIONS (preflight request của CORS)
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200); // OK
    exit(0);
}

// --- Cấu hình kết nối cơ sở dữ liệu ---
$host = 'localhost';
$dbname = 'do_an';     // Đảm bảo đây là tên DB chính xác
$username = 'root';
$password_db = '';      // Mật khẩu DB của bạn (để trống nếu không có)

// --- Tạo kết nối PDO ---
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password_db); // Thêm charset=utf8
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // Không cần thiết phải đặt PDO::ATTR_DEFAULT_FETCH_MODE ở đây
} catch (PDOException $e) {
    // Trả về lỗi nếu không kết nối được DB
    http_response_code(500); // Internal Server Error
    echo json_encode(['result' => 0, 'msg' => 'Database connection failed: ' . $e->getMessage()]);
    exit;
}

// --- Lấy dữ liệu JSON thô từ yêu cầu POST ---
$json_data = file_get_contents('php://input');

// --- Giải mã dữ liệu JSON ---
$data = json_decode($json_data); // Chuyển thành object PHP

// --- Kiểm tra dữ liệu đầu vào ---
// Kiểm tra xem JSON có hợp lệ và chứa email, password không
if ($data === null || !isset($data->email) || !isset($data->password)) {
     http_response_code(400); // Bad Request
     echo json_encode(['result' => 0, 'msg' => 'Invalid or missing email/password in JSON body']);
     exit;
}

// Lấy email và password từ object đã giải mã
$email = $data->email;
$password_input = $data->password; // Mật khẩu plain text người dùng gửi

// --- Câu lệnh SQL kiểm tra email và mật khẩu (vẫn là plain text) ---
$sql = "SELECT id, name, email FROM tn_doctors WHERE email = ? AND password = ?"; // Lấy thêm id, name, email nếu cần
$stmt = $pdo->prepare($sql);

try {
    $stmt->execute([$email, $password_input]);

    // Lấy dữ liệu người dùng
    $user = $stmt->fetch(PDO::FETCH_ASSOC); // Lấy dòng kết quả dưới dạng mảng kết hợp

    // --- Kiểm tra kết quả ---
    if ($user) {
        // --- Đăng nhập thành công ---
        // Tạo một token giả (hoặc bạn có thể tạo token thực tế ở đây nếu muốn)
        // Ví dụ tạo token đơn giản dựa trên id và thời gian (KHÔNG AN TOÀN CHO PRODUCTION)
        $simple_token = base64_encode($user['id'] . '|' . time());

        $response = [
            "result" => 1, // Thành công
            "msg" => "Đăng nhập thành công",
            "accessToken" => $simple_token, // Sử dụng token vừa tạo
            // Bạn có thể thêm thông tin user khác nếu cần
            "user_info" => [
                "id" => $user['id'],
                "name" => $user['name'],
                "email" => $user['email']
            ]
        ];
        http_response_code(200); // OK
    } else {
        // --- Đăng nhập thất bại ---
        $response = [
            "result" => 0, // Thất bại
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

// --- Trả về kết quả dưới dạng JSON ---
echo json_encode($response);

// Không cần đóng kết nối PDO một cách tường minh, nó sẽ tự đóng khi script kết thúc
?>