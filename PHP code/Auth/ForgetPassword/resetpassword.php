<?php
    include "../../connect.php";
    include "../../functions.php";
    $email = filterRequest("Email");
    $pass = sha1($_POST["Password"]);
    $data = array("Password" => $pass);
    $stmt = $con->prepare("UPDATE `users` SET `Password` = ? WHERE `Email` = ?");
    $stmt->execute(array($pass,$email));
    $count = $stmt->rowCount();
    if($count > 0){
        echo json_encode(array("status" => "success"));
    }
    else {
        printFail();
    }
?>