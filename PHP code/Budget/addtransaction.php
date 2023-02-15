<?php
    include "../connect.php";
    include "../functions.php";
    $UID = filterRequest("User_ID");
    $Title = filterRequest("Title");
    $awName = filterRequest("AW_Name");
    $awType = filterRequest("AW_Type");
    $Quantity = filterRequest("Quantity");
    $Type = filterRequest("Type");
    $Date = filterRequest("Date");
    $stmt = $con->prepare("INSERT INTO `history`(`User_ID`,`AW_Name`,`AW_Type`,`Title`,`Quantity`,`Type`,`Date`) VALUES (?,?,?,?,?,?,?)");
    $stmt->execute(array($UID,$awName,$awType,$Title,$Quantity,$Type,$Date));
    $count = $stmt->rowCount();
    if($count > 0){
        if($Type == "Income"){
            $incstmt = $con->prepare("UPDATE `bankaccounts_wallets` SET `Amount` = `Amount` + ? WHERE `User_ID` = ? AND `Name` = ?");
            $incstmt->execute(array($Quantity, $UID,$awName));
            if($incstmt->rowCount() > 0){
                echo json_encode(array("status" => "success"));
            }
            else{
                printFail();
            }
        }
        else{
            $expstmt = $con->prepare("UPDATE `bankaccounts_wallets` SET `Amount` = `Amount` - ? WHERE `User_ID` = ? AND `Name` = ? and `Type` = ?");
            $expstmt->execute(array($Quantity, $UID,$awName,$awType));
            if($expstmt->rowCount() > 0){
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