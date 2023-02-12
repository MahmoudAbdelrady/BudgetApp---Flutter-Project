<?php
include "../connect.php";
include "../functions.php";
$userID = filterRequest("User_ID");
$userVerifyCode = filterRequest("User_VerifyCode");
$stmt = $con->prepare("SELECT * FROM `users` WHERE `User_ID` = ? AND `User_VerifyCode` = ?");
$stmt->execute(array($userID, $userVerifyCode));
if($stmt->rowCount() > 0){
    echo json_encode(array("status" => "success"));
}
else{
    printFail();
}
?>