<?php
include "../connect.php";
include "../functions.php";
$autoID = filterRequest("Auto_TransID");
$delstmt = $con->prepare("DELETE FROM `auto_transactions` WHERE `Auto_TransID` = ?");
$delstmt->execute(array($autoID));
if($delstmt->rowCount() > 0){
    echo json_encode(array("status" => "success"));
}
else{
    printFail();
}
?>