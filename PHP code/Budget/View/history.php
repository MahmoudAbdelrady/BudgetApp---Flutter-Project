<?php
    include "../../connect.php";
    include "../../functions.php";
    $UID = filterRequest("User_ID");
    $Type = filterRequest("Type");
    // $Date = filterRequest("Date");
    if($Type == "All"){
        $stmt = $con->prepare("SELECT * FROM `history` WHERE `User_ID` = ? ORDER BY `Date` DESC");
        $stmt->execute(array($UID));
        $count = $stmt->rowCount();
        if($count > 0){
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
            printSuccess($data);
        } else
        printFail();
    }
    else {
        $stmt = $con->prepare("SELECT * FROM `history` WHERE `User_ID` = ? AND `Type` = ? ORDER BY `Date` DESC");
        $stmt->execute(array($UID,$Type));
        $count = $stmt->rowCount();
        if($count > 0){
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
            printSuccess($data);
        } else
        printFail();
    }
?>