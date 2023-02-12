<?php
    include "../connect.php";
    include "../functions.php";
    $username = filterRequest("Username");
    $password = sha1($_POST["Password"]);
    $stmt = $con->prepare("SELECT * FROM `users` WHERE `Username` = ? AND `Password` = ? AND `User_ApproveStatus` = 1");
    $stmt->execute(array($username,$password));
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    $count = $stmt->rowCount();
    if($count > 0){
       printSuccess($data);
    }
    else printFail();
?>