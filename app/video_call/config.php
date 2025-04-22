<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');

// Cấu hình VNPay Sandbox
$vnp_TmnCode = "EDEIUMAF"; // Mã định danh Merchant
$vnp_HashSecret = "8TL0QL450XNEQDQYLLMYL0HMQ339OYUI"; // Secret Key
$vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
$vnp_Returnurl = "http://192.168.56.1:8080/Do_an_tot_nghiep_lph/api/app/video_call/vnpay_return.php"; // Đường dẫn trả về sau thanh toán
$vnp_apiUrl = "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction";

// Thời gian giao dịch
$startTime = date("YmdHis");
$expire = date('YmdHis', strtotime('+30 minutes', strtotime($startTime)));

// Cấu hình CSDL
define("DB_HOST", "localhost");
define("DB_NAME", "do_an");
define("DB_USER", "root");
define("DB_PASS", "");
define("DB_ENCODING", "utf8");
?>
