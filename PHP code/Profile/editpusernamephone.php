<?php
include "../connect.php";
include "../functions.php";
$username = filterRequest("Username");
$phone = filterRequest("Phone");
$userID = filterRequest("User_ID");
$stmt = $con->prepare("SELECT `Username`,`Phone` from `users` WHERE `Username` = ? AND `Phone` = ? AND `User_ID` = ?");
$stmt->execute(array($username,$phone,$userID));
if ($stmt->rowCount() > 0) {
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    printSuccess($data);
} else {
    $stmt = $con->prepare("UPDATE `users` SET `Username` = ?, `Phone` = ? WHERE `User_ID` = ?");
    $stmt->execute(array($username, $phone, $userID));
    if ($stmt->rowCount() > 0) {
        $newStmt = $con->prepare("SELECT `Username`,`Phone` from `users` WHERE `User_ID` = $userID");
        $newStmt->execute();
        $data = $newStmt->fetch(PDO::FETCH_ASSOC);
        printSuccess($data);
    } else {
        printFail();
    }
}
?>