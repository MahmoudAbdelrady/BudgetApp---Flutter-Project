<?php
    include "../connect.php";
    include "../functions.php";
    $userID = filterRequest("User_ID");
    $autoTransTitle = filterRequest("Title");
    $rate = filterRequest("ActionRate");
    $actionAmount = filterRequest("ActionAmount");
    $stmt = $con->prepare("UPDATE `auto_transactions` SET `ActionDate` = ADDDATE(`ActionDate`,INTERVAL $actionAmount $rate) WHERE `User_ID` = ? AND `Title` = ?");
    $stmt->execute(array($userID,$autoTransTitle));
?>