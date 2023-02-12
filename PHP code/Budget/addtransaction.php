<?php
    include "../connect.php";
    include "../functions.php";
    $UID = filterRequest("User_ID");
    $Title = filterRequest("Title");
    $Title_Type = filterRequest("Title_Type");
    $Quantity = filterRequest("Quantity");
    $Type = filterRequest("Type");
    $Date = filterRequest("Date");
    $stmt = $con->prepare("INSERT INTO `history`(`User_ID`,`Title`,`Title_Type`,`Quantity`,`Type`,`Date`) VALUES (?,?,?,?,?,?)");
    $stmt->execute(array($UID,$Title,$Title_Type,$Quantity,$Type,$Date));
    $count = $stmt->rowCount();
    if($count > 0){
        if($Type == "Income"){
            $incstmt = $con->prepare("UPDATE `users` SET `User_TotalBudget` = `User_TotalBudget` + ? WHERE `User_ID` = ?");
            $incstmt->execute(array($Quantity, $UID));
            if($incstmt->rowCount() > 0){
                echo json_encode(array("status" => "success"));
            }
            else{
                printFail();
            }
        }
        else{
            $expstmt = $con->prepare("UPDATE `users` SET `User_TotalBudget` = `User_TotalBudget` - ? WHERE `User_ID` = ?");
            $expstmt->execute(array($Quantity, $UID));
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