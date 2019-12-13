<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
include '../conn.php';

$inputJSON = file_get_contents('php://input');

// $inputJSON = '
//     {
//         "userid": 30,
//         "broadcasttype": 1,
//         "subbroadcasttype": 1,
//         "quantity": 1,
//         "uom": "1",
//         "usertype": 1,
//         "latitude": 10.5,
//         "longitude": 10.5,
//         "status": 1
//     }
// ';

$input = json_decode($inputJSON, false);

$output = array();

    $stmt = $conn->prepare("INSERT INTO record VALUES(NULL,?,?,?,?,?,?,?,?,?);");
    $stmt->bind_param("iiiiiddsi",
        $input->userid,
        $input->broadcasttype,
        $input->subbroadcasttype,
        $input->quantity,
        $input->uom,
        $input->latitude,
        $input->longitude,
        $datenow,
        $input->status
    );
    if(!$stmt->execute()){
        $output = array("status" => 79, "message" => "Error Inserting New Record");
        echo($stmt->error);
    }else{
        $output = array("status" => 200, "message" => "Registered Successfully");
    }
    //$output = array("status" => 200, "message" => "Registered Successfully");
    $stmt->close();


echo json_encode($output);
$conn->close();
?>