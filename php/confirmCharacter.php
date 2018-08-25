<?php

session_start();

require_once("apiHandler.php");

if(!empty($_POST))
{
    $region = $_POST["region"];
    $realm = $_POST["realm"];
    $character = $_POST["character"];

    APIHandler::getInstance()->getCharacterInformation($_SESSION["userID"],$region,$realm,$character);
}

?>