<?php
function modifyAccountWallet($awName , $awType , $awAmount , $awUserID){
    include "../../connect.php";
    $name = $awName;
    $amount = $awAmount;
    $userID = $awUserID;
    $stmt = $con->prepare("UPDATE `bankaccounts_wallets` SET `Amount` = `Amount` + $amount WHERE `Name` = '$name' AND `Type` = '$awType' AND `User_ID` = '$userID'");
    $stmt->execute();
    if($stmt->rowCount() > 0){
        echo json_encode(array("status" => "success"));
    }
    else {
        printFail();
    }
}
?>