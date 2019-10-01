<?php
include '../conn.php';
header("Content-Type: application/json; charset=UTF-8");
//$inputJSON = file_get_contents('php://input');
$inputJSON = '{
    "email": "admin@menro.com",
    "password": "admin123"
}';

$input = json_decode($inputJSON, FALSE); //convert JSON into array

$output = array();

$stmt = $conn->prepare("SELECT id, TYPE FROM users WHERE email = ? AND password = MD5(?);");
$stmt->bind_param("ss", $input->email, $input->password);
$stmt->execute();
$stmt->bind_result($id, $type);
$tmp = array();

while($stmt->fetch()) {
    $tmp["id"] = $id;
    $tmp["type"] = $type;
    array_push($output, $tmp);
}

if(empty($output)){
    $tmp["status"] = 0;
    $tmp["message"] = "No Data";
    array_push($output, $tmp);
    echo json_encode($output);
}else{
    echo json_encode($output);
}

?>