<?php
include "../../connect.php";
include "../../functions.php";
$name = filterRequest("Name");
$amount = filterRequest("Amount");
$type = filterRequest("Type");
$userID = filterRequest("User_ID");
$awID = filterRequest("ID");
$stmt = $con->prepare("UPDATE `bankaccounts_wallets` SET `Name` = ?,`Amount` = ?,`Type`=? WHERE `User_ID` = ? AND `ID` = ?");
$stmt->execute(array($name,$amount,$type,$userID,$awID));
if($stmt->rowCount() > 0){
    echo json_encode(array("status" => "success"));
}
else {
    printFail();
}
?>