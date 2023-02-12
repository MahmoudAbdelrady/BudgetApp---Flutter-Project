<?php
include "../connect.php";
include "../functions.php";
$email = filterRequest("Email");
$userID = filterRequest("User_ID");
$stmt = $con->prepare("UPDATE `users` SET `Email` = ? WHERE `User_ID` = ?");
$stmt->execute(array($email, $userID));
if($stmt->rowCount() > 0){
    $newStmt = $con->prepare("SELECT `Email` from `users` WHERE `User_ID` = $userID");
    $newStmt->execute();
    $data = $newStmt->fetch(PDO::FETCH_ASSOC);
    printSuccess($data);
}
else{
    printFail();
}
?>