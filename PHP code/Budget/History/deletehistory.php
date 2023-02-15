<?php
include "../../connect.php";
include "../../functions.php";
$userID = filterRequest("User_ID");
$awName = filterRequest("AW_Name");
$awType = filterRequest("AW_Type");
$transID = filterRequest("TransactionID");
$quantity = filterRequest("Quantity");
$type = filterRequest("Type");
$delstmt = $con->prepare("DELETE FROM `history` WHERE `TransactionID` = ?");
$delstmt->execute(array($transID));
if($delstmt->rowCount() > 0){
    $chkStmt = $con->prepare("SELECT * FROM `bankaccounts_wallets` WHERE `User_ID` = ? AND `Name` = ? AND `Type` = ?");
    $chkStmt->execute(array($userID,$awName,$awType));
    if($chkStmt->rowCount() > 0){
        if ($type == "Income"){
            $updstmt = $con->prepare("UPDATE `bankaccounts_wallets` SET `Amount` = `Amount` - ? WHERE `User_ID` = ? AND `Name` = ? AND `Type` = ?");
            $updstmt->execute(array($quantity, $userID,$awName,$awType));
            if($updstmt->rowCount() > 0){
                echo json_encode(array("status" => "success"));
            }
            else{
                printFail();
            }
        }
        else{
            $updstmt = $con->prepare("UPDATE `bankaccounts_wallets` SET `Amount` = `Amount` + ? WHERE `User_ID` = ? AND `Name` = ? AND `Type` = ?");
            $updstmt->execute(array($quantity, $userID,$awName,$awType));
            if($updstmt->rowCount() > 0){
                echo json_encode(array("status" => "success"));
            }
            else{
                printFail();
            }
        }
    }
    else{
        echo json_encode(array("status" => "success"));
    }
}
else{
    printFail();
}

?>