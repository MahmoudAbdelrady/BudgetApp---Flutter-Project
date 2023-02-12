<?php
    include "../../connect.php";
    include "../../functions.php";
    $userid = filterRequest("User_ID");
    $stmt = $con->prepare("SELECT `User_TotalBudget` FROM `users` WHERE `User_ID` = ?");
    $stmt->execute(array($userid));
    $count = $stmt->rowCount();
    if($count > 0){
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        printSuccess($data);
    }
    else {
        printFail();
    }
?>