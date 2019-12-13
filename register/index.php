<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
include '../conn.php';

$inputJSON = file_get_contents('php://input');

// $inputJSON = '
//     {
//         "email": "admin1@menro.com",
//         "password": "12345678",
//         "name": "r",
//         "number": "11111111112",
//         "usertype": 1,
//         "latitude": 10.5,
//         "longitude": 10.5
//     }
// ';

$input = json_decode($inputJSON, false);

$output = array();

$stmtnumber = $conn->prepare("SELECT mobile FROM users WHERE mobile = ?");
$stmtnumber->bind_param("s",$input->number);
$stmtnumber->execute();
$mobilen = $stmtnumber->fetch();
$stmtnumber->close();

$stmtemail = $conn->prepare("SELECT users.email FROM users WHERE users.email = ?");
$stmtemail->bind_param("s",$input->email);
$stmtemail->execute();
$emailn = $stmtemail->fetch();
$stmtemail->close();

if($mobilen){
    $output = array("status" => 67, "message" => "Mobile Number already exist!");
}else if($emailn){
    $output = array("status" => 68, "message" => "Email Address already exist!");
}else{
    $stmt = $conn->prepare("INSERT INTO users VALUES(NULL,?,MD5(?),?,?,?,?,?);");
    $stmt->bind_param("ssssidd",
        $input->email,
        $input->password,
        $input->name,
        $input->number,
        $input->usertype,
        $input->latitude,
        $input->longitude
    );
    if(!$stmt->execute()){
        $output = array("status" => 69, "message" => "Error Inserting New Record");
        echo($stmt->error);
    }else{
        $output = array("status" => 200, "message" => "Registered Successfully");
    }
    //$output = array("status" => 200, "message" => "Registered Successfully");
    $stmt->close();
}

echo json_encode($output);
$conn->close();
?>