<?php
include "../../connect.php";
include "../../functions.php";
$userID = filterRequest("User_ID");
$stmt = $con->prepare("SELECT SUM(`Amount`) as 'Total' FROM `bankaccounts_wallets` WHERE `User_ID` = ?");
$stmt->execute(array($userID));
if($stmt->rowCount() > 0){
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    printSuccess($data);
}
else{
    printFail();
}
?>