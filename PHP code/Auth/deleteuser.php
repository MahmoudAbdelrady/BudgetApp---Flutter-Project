<?php
    include "../connect.php";
    include "../functions.php";
    $email = filterRequest("Email");
    $stmt = $con->prepare("DELETE FROM `users` WHERE `Email` = ?");
    $stmt->execute(array($email));
    if($stmt->rowCount()){
        echo json_encode(array("status" => "success"));
    }
    else{
        printFail();
    }
?>