<?php
include "../../connect.php";
include "../../functions.php";
$name = filterRequest("Name");
$userID = filterRequest("User_ID");
$stmt = $con->prepare("DELETE FROM `bankaccounts_wallets` WHERE `Name` = ? AND `User_ID` = ?");
$stmt->execute(array($name,$userID));
$count = $stmt->rowCount();
if($count > 0){
    echo json_encode(array("status" => "success"));
}
else {
    printFail();
}
?>