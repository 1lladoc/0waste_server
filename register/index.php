<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
include '../conn.php';

$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON);

$output = array();

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
}else{
    $output = array("status" => 70, "message" => "Registered Successfully");
}

echo json_encode($output);

$stmt->close();
$conn->close();
?>