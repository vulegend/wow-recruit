<?php

require_once("database.php");

class Guild {

    public $guildID;
    public $name;
    public $realm;
    public $faction;
    public $region;
    public $memberCount;

    public function __construct($row)
    {
        $this->guildID = $row["guild_id"];
        $this->name = $row["name"];
        $this->realm = $row["realm"];
        $this->faction = $row["faction"];
        $this->region = $row["region"];
        $this->memberCount = $row["member_count"];
    }
}

?>