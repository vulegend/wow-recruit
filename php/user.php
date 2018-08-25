<?php

class User {

    public $userID;
    public $isConfirmed;
    public $email;
    public $googleID;

    public function __construct($row)
    {
        $this->userID = $row["user_id"];
        $this->isConfirmed = $row["is_confirmed"];
        $this->email = $row["email"];
        $this->googleID = $row["google_id"];
    }
}

?>