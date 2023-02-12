<?php
// not finished
include "../../connect.php";
include "../../functions.php";
$userID = filterRequest("User_ID");
$title = filterRequest("Title");
$titleType = filterRequest("Title_Type");
$quantity = filterRequest("Quantity");
$type = filterRequest("Type");
$date = filterRequest("Date");
$transID = filterRequest("TransactionID");
$editstmt = $con->prepare("UPDATE `history` SET `Title` = ?, `Title_Type` = ?,`Quantity` = ?,`Date` = ? WHERE `User_ID` = ? AND `TransactionID` = ?");
$editstmt->execute(array($title,$titleType,$quantity,$date,$userID,$transID));
if($editstmt->rowCount() > 0){
    echo json_encode(array("status" => "success"));
}
else{
    printFail();
}
?>