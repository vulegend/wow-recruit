<?php

require_once("database.php");

session_start();

if(!empty($_POST))
{
    $googleID = $_POST["googleID"];
    $email = $_POST["email"];

    Database::getInstance()->insertUser($email,$googleID);
    $_SESSION["userID"] = $googleID;
    $_SESSION["userObject"] = serialize(Database::getInstance()->getUser($googleID));

    echo 1;
    return;
}

echo 0;

?>