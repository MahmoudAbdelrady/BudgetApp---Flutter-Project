<?php
    include "../../connect.php";
    include "../../functions.php";
    $email = filterRequest("Email");
    $verifycode = rand(10000,99999);
    $stmt = $con->prepare("SELECT * FROM `users` WHERE `Email` = ? AND `User_ApproveStatus` = 1");
    $stmt->execute(array($email));
    $count = $stmt->rowCount();
    if($count > 0){
        $data = array("User_VerifyCode" => $verifycode);
        $stmt = $con->prepare("UPDATE `users` SET `User_VerifyCode` = ? WHERE `Email` = ?");
        $stmt->execute(array($verifycode,$email));
        $count = $stmt->rowCount();
        if($count > 0) {
            echo json_encode(array("status" => "success"));
            // mail function here
        }
        else {
            printFail();
        }
    }
    else{
        printFail();
    }
?>