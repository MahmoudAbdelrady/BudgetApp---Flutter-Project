<?php
include "../connect.php";
include "../functions.php";
$verifycode = rand(10000, 99999);
$userID = filterRequest("User_ID");
$stmt = $con->prepare("UPDATE `users` SET `User_VerifyCode` = ? WHERE `User_ID` = ?");
$stmt->execute(array($verifycode, $userID));
if($stmt->rowCount() > 0){
    // mail function here
    echo json_encode(array("status" => "success"));
}
else{
    printFail();
}
?>