<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
include '../conn.php';

$output = array();

$stmt = $conn->prepare("SELECT * FROM broadcast_type");

$stmt->execute();

$stmt->bind_result($id, $title, $desc);

$tmp = array();
$data = array();

while($stmt->fetch()) {
    $tmp["id"] = $id;
    $tmp["title"] = $title;
    $tmp["description"] = $desc;
    array_push($data, $tmp);
}
//$data = array("id" => $id,"title" => $title, "description" => $desc);
$output = array("status" => 200, "message" => "Success", "data" => $data);
//$output = array("result" => $output);
if(empty($output)){
    // $tmp["status"] = 0;
    // $tmp["message"] = "No Data";
    // array_push($output, $tmp);
    $output = array("status" => 16, "message" => "No Data");
    echo json_encode($output);
}else{
    echo json_encode($output);
}

$stmt->close();
$conn->close();
?>