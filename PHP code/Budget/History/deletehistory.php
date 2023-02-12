<?php
include "../../connect.php";
include "../../functions.php";
$userID = filterRequest("User_ID");
$transID = filterRequest("TransactionID");
$quantity = filterRequest("Quantity");
$type = filterRequest("Type");
$delstmt = $con->prepare("DELETE FROM `history` WHERE `TransactionID` = ?");
$delstmt->execute(array($transID));
if($delstmt->rowCount() > 0){
    if ($type == "Income"){
        $updstmt = $con->prepare("UPDATE `users` SET `User_TotalBudget` = `User_TotalBudget` - ? WHERE `User_ID` = ?");
        $updstmt->execute(array($quantity, $userID));
        if($updstmt->rowCount() > 0){
            echo json_encode(array("status" => "success"));
        }
        else{
            printFail();
        }
    }
    else{
        $updstmt = $con->prepare("UPDATE `users` SET `User_TotalBudget` = `User_TotalBudget` + ? WHERE `User_ID` = ?");
        $updstmt->execute(array($quantity, $userID));
        if($updstmt->rowCount() > 0){
            echo json_encode(array("status" => "success"));
        }
        else{
            printFail();
        }
    }
}
else{
    printFail();
}

?>