<?php

require_once("database.php");

session_start();

if(!empty($_POST))
{
    $googleID = $_POST["googleID"];
    $email = $_POST["email"];

    $_SESSION["userID"] = $googleID;

    echo 1;
}

echo 0;

?>