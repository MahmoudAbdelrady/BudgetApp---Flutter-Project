<?php
include "../../connect.php";
include "../../functions.php";
$userID = filterRequest("User_ID");
$type = filterRequest("Type");
$stmt = $con->prepare("SELECT * FROM `bankaccounts_wallets` WHERE `User_ID` = ? AND `Type` = ?");
$stmt->execute(array($userID, $type));
if($stmt->rowCount() > 0){
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    printSuccess($data);
}
else {
    printFail();
}
?>