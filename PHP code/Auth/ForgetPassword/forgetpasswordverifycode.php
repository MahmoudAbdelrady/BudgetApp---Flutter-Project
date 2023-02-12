<?php
    include "../../connect.php";
    include "../../functions.php";
    $email = filterRequest("Email");
    $vcode = filterRequest("User_VerifyCode");
    $stmt = $con->prepare("SELECT * FROM `users` WHERE `Email` = ? AND `User_VerifyCode` = ?");
    $stmt->execute(array($email,$vcode));
    $count = $stmt->rowCount();
    if($count > 0){
        echo json_encode(array("status" => "success"));
    }
    else {
        printFail();
    }
?>