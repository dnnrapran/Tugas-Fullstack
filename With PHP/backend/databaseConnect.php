<?php

$host = "localhost"; // if the variable is found then return the variable host else returns the other key
$dbUsername = "root";
$dbPassword = "";
$dbname = "apotek";

    //create connection
    $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);
    if (mysqli_connect_error()) 
    {
        die('Connection Error('. mysqli_connect_errno().')'. mysqli_connect_error());
    }
?>