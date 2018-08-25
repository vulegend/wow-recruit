<?php

require_once("database.php");
ini_set("allow_url_fopen", 1);

class APIHandler {

    private static $instance = NULL;
    private $API_KEY = "6dmjbx6u5gb64zpbssjydvzrxmscmug4";

    public static function getInstance() {
        if(is_null(self::$instance)) {
            self::$instance = new self();
        }

        return self::$instance;
    }

    public function getCharacterInformation($userID,$region,$realm,$character)
    {
        $url = "https://".$region.".api.battle.net/wow/character/".$realm."/".$character."?fields=items%2Cguild&locale=en_GB&apikey=".$this->API_KEY;
        Database::getInstance()->insertAPICall($url);
        $json = file_get_contents($url);
        $obj = json_decode($json);
        Database::getInstance()->insertUnconfirmedCharacter($userID,$obj->name,$obj->class,$obj->race,$obj->faction,$obj->guild->name,0,$obj->items->averageItemLevelEquipped,$realm,$region,$obj->level);
        echo $obj->name;
    }

}


?>