<?php
include "../../connect.php";
include "../../functions.php";
include "modifyaccount-wallet.php";
$name = filterRequest("Name");
$amount = filterRequest("Amount");
$type = filterRequest("Type");
$userID = filterRequest("User_ID");
$stmt = $con->prepare("SELECT * from `bankaccounts_wallets` WHERE `Name` = ? AND `Type` = ? AND `User_ID` = ?");
$stmt->execute(array($name,$type,$userID));
if($stmt->rowCount() > 0){
    modifyAccountWallet($name,$type,$amount,$userID);
}
else {
    $anstmt = $con->prepare("INSERT INTO `bankaccounts_wallets`(`Name`,`Amount`,`Type`,`User_ID`) VALUES (?,?,?,?)");
    $anstmt->execute(array($name, $amount, $type, $userID));
    echo json_encode(array("status" => "success"));
}
?>