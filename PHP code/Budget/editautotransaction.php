<?php
    include "../connect.php";
    include "../functions.php";
    $autoTransID = filterRequest("Auto_TransID");
    $userID = filterRequest("User_ID");
    $awName = filterRequest("AW_Name");
    $awType = filterRequest("AW_Type");
    $title = filterRequest("Title");
    $amount = filterRequest("Amount");
    $type = filterRequest("Type");
    $actionRate = filterRequest("ActionRate");
    $chkstmt = $con->prepare("SELECT * FROM `auto_transactions` WHERE `AW_Name` = ? AND `AW_Type` = ? AND `Title` = ?  AND `Amount` = ? AND `Type` = ? AND `ActionRate` = ? AND `User_ID` = ?");
    $chkstmt->execute(array($awName,$awType,$title,$amount,$type,$actionRate,$userID));
    if($chkstmt->rowCount() > 0){
        echo json_encode(array("status" => "success"));
    }
    else{
        $upstmt = $con->prepare("UPDATE `auto_transactions` SET `AW_Name` = ? ,`AW_Type`, `Title` = ? , `Amount` = ? , `Type` = ? , `ActionRate` = ? WHERE `User_ID` = ?");
        $upstmt->execute(array($awName,$awType,$title,$amount,$type,$actionRate,$userID));
        if($upstmt->rowCount() > 0){
            echo json_encode(array("status" => "success"));
        }
        else{
            printFail();
        }
    }
?>