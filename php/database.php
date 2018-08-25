<?php

require_once("user.php");
require_once("character.php");

class Database {

    private $hostname = "localhost";
    private $db = "wowrecruit";
    private $username = "root";
    private $password = "";

    private static $instance = NULL;

    public static function getInstance() {
        if(is_null(self::$instance)) {
            self::$instance = new self();
        }

        return self::$instance;
    }

    public function getUser($googleID)
    {
        $conn = new mysqli($this->hostname,$this->username,$this->password,$this->db);
        $stmt = $conn->prepare("SELECT * FROM user WHERE google_id = ?");
        $stmt->bind_param("s", $googleID);
        $stmt->execute();
        $result = $stmt->get_result();
        $stmt->close();
        $conn->close();
        if($result && $result->num_rows === 0) exit ('No rows');

        while($row = $result->fetch_assoc()) {
            return new User($row);
        }

        return null;
    }

    public function insertUser($userMail,$userGoogleID)
    {
        $conn = new mysqli($this->hostname,$this->username,$this->password,$this->db);
        $stmt = $conn->prepare("INSERT INTO user (is_confirmed,email,google_id) VALUES (false,?,?)");
        $stmt->bind_param("ss", $userMail, $userGoogleID);
        $stmt->execute();
        $stmt->close();
        $conn->close();
    }

    public function insertAPICall($apiURL)
    {
        $conn = new mysqli($this->hostname,$this->username,$this->password,$this->db);
        $stmt = $conn->prepare("INSERT INTO api_access (target_url,call_time) VALUES (?,NOW())");
        $stmt->bind_param("s", $apiURL);
        $stmt->execute();
        $stmt->close();
        $conn->close();
    }

    public function insertUnconfirmedCharacter($userID,$name,$class,$race,$faction,$guild,$guildPosition,$itemLevel,$server,$locale,$level)
    {
        $conn = new mysqli($this->hostname,$this->username,$this->password,$this->db);
        $stmt = $conn->prepare("INSERT INTO user_character (user_id,name,class,race,faction,guild,guild_position,item_level,server,locale,level,is_confirmed) VALUES (?,?,?,?,?,?,?,?,?,?,?,0)");
        $stmt->bind_param("isiiisiissi", $userID,$name,$class,$race,$faction,$guild,$guildPosition,$itemLevel,$server,$locale,$level);
        $stmt->execute();
        $stmt->close();
        $conn->close();
    }

    public function guildExists($guildName,$guildServer)
    {
        $conn = new mysqli($this->hostname,$this->username,$this->password,$this->db);
        $stmt = $conn->prepare("SELECT * FROM guild WHERE name = ? AND realm = ?");
        $stmt->bind_param("ss", $guildName, $guildServer);
        $stmt->execute();
        $result = $stmt->get_result();
        $stmt->close();
        $conn->close();

        return ($result->num_rows > 0 ? true : false);
        
    }

    public function getUserCharacters($userID)
    {
        $arrayToReturn = array();
        $conn = new mysqli($this->hostname,$this->username,$this->password,$this->db);
        $stmt = $conn->prepare("SELECT * FROM user_character WHERE user_id = ?");
        $stmt->bind_param("i", $userID);
        $stmt->execute();
        $result = $stmt->get_result();
        $stmt->close();
        $conn->close();
        if($result && $result->num_rows === 0) return null;

        while($row = $result->fetch_assoc()) {
            array_push($arrayToReturn, new Character($row));
        }

        return arrayToReturn;
    }
}

?>