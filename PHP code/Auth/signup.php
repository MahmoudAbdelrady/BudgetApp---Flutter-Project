<?php
    include "../connect.php";
    include "../functions.php";
    $username = filterRequest("Username");
    $email = filterRequest("Email");
    $phone = filterRequest("Phone");
    $password = sha1($_POST["Password"]);
    $verifycode = rand(10000,99999);
    $stmt = $con->prepare("SELECT * FROM `users` WHERE `Email` = '$email' OR `Phone` = '$phone'");
    $stmt->execute();
    $count = $stmt->rowCount();
    if($count > 0){
        printFail();
    }
    else{
        $stmt = $con->prepare("INSERT INTO `users`(`Username`,`Email`,`Phone`,`Password`,`User_VerifyCode`) VALUES (?,?,?,?,?)");
        $stmt->execute(array($username,$email,$phone,$password,$verifycode));
        $count = $stmt->rowCount();
        if($count > 0){
            echo json_encode(array("status" => "success"));
            // mail function here
        }
        else {
            printFail();
        }
    }

?>