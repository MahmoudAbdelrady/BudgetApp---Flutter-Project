<?php
    include "../connect.php";
    include "../functions.php";
    $autoTransID = filterRequest("Auto_TransID");
    $userID = filterRequest("User_ID");
    $title = filterRequest("Title");
    $titleType = filterRequest("Title_Type");
    $amount = filterRequest("Amount");
    $type = filterRequest("Type");
    $actionRate = filterRequest("ActionRate");
    $chkstmt = $con->prepare("SELECT * FROM `auto_transactions` WHERE `Title` = ? AND `Title_Type` = ? AND `Amount` = ? AND `Type` = ? AND `ActionRate` = ? AND `User_ID` = ?");
    $chkstmt->execute(array($title,$titleType,$amount,$type,$actionRate,$userID));
    if($chkstmt->rowCount() > 0){
        echo json_encode(array("status" => "success"));
    }
    else{
        $upstmt = $con->prepare("UPDATE `auto_transactions` SET `Title` = ? , `Title_Type` = ? , `Amount` = ? , `Type` = ? , `ActionRate` = ? WHERE `User_ID` = ?");
        $upstmt->execute(array($title,$titleType,$amount,$type,$actionRate,$userID));
        if($upstmt->rowCount() > 0){
            echo json_encode(array("status" => "success"));
        }
        else{
            printFail();
        }
    }
?>