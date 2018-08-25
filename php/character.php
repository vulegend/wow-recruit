<?php

class Character {

    public $characterID;
    public $userID;
    public $name;
    public $class;
    public $race;
    public $faction;
    public $guild;
    public $guildPosition;
    public $itemLevel;
    public $server;
    public $locale;
    public $level;
    public $isConfirmed;

    public function __construct($row)
    {
        $this->characterID = $row["character_id"];
        $this->userID = $row["user_id"];
        $this->name = $row["name"];
        $this->class = $row["class"];
        $this->race = $row["race"];
        $this->faction = $row["faction"];
        $this->guild = $row["guild"];
        $this->guildPosition = $row["guild_position"];
        $this->itemLevel = $row["item_level"];
        $this->server = $row["server"];
        $this->locale = $row["locale"];
        $this->level = $row["level"];
        $this->isConfirmed = $row["is_confirmed"];
    }

}

?>