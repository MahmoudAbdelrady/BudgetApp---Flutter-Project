<?php
include "../connect.php";
include "../functions.php";
$userID = filterRequest("User_ID");
$awName = filterRequest("AW_Name");
$awType = filterRequest("AW_Type");
$title = filterRequest("Title");
$amount = filterRequest("Amount");
$type = filterRequest("Type");
$actionRate = filterRequest("ActionRate");
$actionDate = filterRequest("ActionDate");
$chkstmt = $con->prepare("SELECT * FROM `auto_transactions` WHERE `Title` = ? AND `User_ID` = ?");
$chkstmt->execute(array($title, $userID));
if($chkstmt->rowCount() > 0){
    $updtstmt = $con->prepare("UPDATE `auto_transaction` SET `Amount` = `Amount` + ? WHERE `Title` = ? AND `User_ID` = ?");
    $updtstmt->execute(array($amount, $title, $userID));
    if($updtstmt->rowCount() > 0){
        echo json_encode(array("status" => "success"));
    }
    else{
        printFail();
    }
}
else{
    $insrtstmt = $con->prepare("INSERT INTO `auto_transactions`(`User_ID`,`AW_Name`,`AW_Type`,`Title`,`Amount`,`Type`,`ActionRate`,`ActionDate`) VALUES(?,?,?,?,?,?,?,?)");
    $insrtstmt->execute(array($userID,$awName,$awType,$title,$amount,$type,$actionRate,$actionDate));
    if($insrtstmt->rowCount() > 0){
        echo json_encode(array("status" => "success"));
    }
    else{
        printFail();
    }
}
?>