<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
include '../conn.php';

// if (strtoupper($_SERVER['REQUEST_METHOD']) != 'POST'){
//     echo '{"POST": "NOT OK"}';
// }else{
//     echo '{"POST": "OK"}';
// } 
$inputJSON = file_get_contents('php://input');

// $inputJSON = '{
//     "email": "admin@menro.com",
//     "password": "admin123"
// }';

//echo $inputJSON;

$input = json_decode($inputJSON, FALSE); //convert JSON into array

// echo '{
//     "email": '.$input->email.',
//     "password": '.$input->password.'
// }';

$output = array();

$stmt = $conn->prepare("SELECT id, name, TYPE FROM users WHERE email = ? AND password = MD5(?);");
$stmt->bind_param("ss", $input->email, $input->password);
$stmt->execute();
$stmt->bind_result($id, $name, $type);
$tmp = array();

while($stmt->fetch()) {
    // $tmp["id"] = $id;
    // $tmp["type"] = $type;
    // array_push($output, $tmp);
    $output = array("id" => $id,"name" => $name, "type" => $type);
}
//$output = array("result" => $output);
if(empty($output)){
    // $tmp["status"] = 0;
    // $tmp["message"] = "No Data";
    // array_push($output, $tmp);
    $output = array("status" => 0, "message" => "No Data");
    echo json_encode($output);
}else{
    echo json_encode($output);
}

$stmt->close();
$conn->close();
?>