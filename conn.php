<?php

define('DB_USER', "root"); // db user
define('DB_PASSWORD', ""); // db password
define('DB_DATABASE', "zerowaste"); // database name
define('DB_SERVER', "localhost"); // db server
 
$conn = mysqli_connect(DB_SERVER,DB_USER,DB_PASSWORD,DB_DATABASE);

date_default_timezone_set('Asia/Manila');
$datenow = date('Y-m-d H:i:s');
 
// Check connection
if(mysqli_connect_errno())
{
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

?>