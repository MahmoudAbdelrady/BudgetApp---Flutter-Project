<?php
include "../../connect.php";
include "../../functions.php";
$name = filterRequest("Name");
$type = filterRequest("Type");
$userID = filterRequest("User_ID");
$stmt = $con->prepare("DELETE FROM `bankaccounts_wallets` WHERE `Name` = ? AND `Type` = ? AND `User_ID` = ?");
$stmt->execute(array($name,$type,$userID));
$count = $stmt->rowCount();
if($count > 0){
    $delauto = $con->prepare("DELETE FROM `auto_transactions` WHERE `AW_Name` = ? AND `AW_Type` = ? AND `User_ID` = ?");
    $delauto->execute(array($name,$type,$userID));
    if($delauto->rowCount() > 0){
        echo json_encode(array("status" => "success"));
    }
    else{
        printFail();
    }
}
else {
    printFail();
}
?>