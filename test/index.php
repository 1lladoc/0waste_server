<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
include '../conn.php';

$output = array("status" => 100, "message" => "Test");
echo json_encode($output);
?>