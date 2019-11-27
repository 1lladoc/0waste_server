<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
include '../conn.php';

$output = array();

$junkshop = 2;

$stmt = $conn->prepare("SELECT users.id, users.name, users.mobile, users.usertype, users.longitude, users.latitude, 
avg(reports.rating) AS rating, COUNT(reports.rating) AS raters 
FROM users LEFT OUTER JOIN reports ON users.id <=> reports.user_id WHERE  users.usertype = $junkshop GROUP BY users.id;");

$stmt->execute();

$stmt->bind_result($id, $name, $mobile, $usertype, $longitude, $latitude, $rating, $raters);

$tmp = array();
$data = array();

while($stmt->fetch()) {
    $tmp["id"] = $id;
    $tmp["name"] = $name;
    $tmp["mobile"] = $mobile;
    $tmp["usertype"] = $usertype;
    $tmp["longitude"] = $longitude;
    $tmp["latitude"] = $latitude;

    if($rating==null){
        $tmp["rating"] = 0;
    }else{
        $tmp["rating"] = $rating;
    }

    $tmp["raters"] = $raters;
    
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