<?php
include "../connect.php";
include "../functions.php";
$userID = filterRequest("User_ID");
$type = filterRequest("Type");
if($type == "All"){
    $allstmt = $con->prepare("SELECT * FROM `auto_transactions` WHERE `USER_ID` = ?");
    $allstmt->execute(array($userID));
    if($allstmt->rowCount() > 0){
        $alldata = $allstmt->fetchAll(PDO::FETCH_ASSOC);
        printSuccess($alldata);
    }
    else{
        printFail();
    }
}
else{
    $stmt = $con->prepare("SELECT * FROM `auto_transactions` WHERE `User_ID` = ? AND `Type` = ?");
    $stmt->execute(array($userID, $type));
    if($stmt->rowCount() > 0){
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        printSuccess($data);
    }
    else{
        printFail();
    }
}
?>