<?php
include "../connect.php";
include "../functions.php";
$userID = filterRequest("User_ID");
$query = "SELECT t1.week , t1.dayname,t1.daynum , t1.Total_Expence , t2.Total_Income FROM\n"

    . "(SELECT WEEK(`Date`) as week, DAYNAME(`Date`) as dayname,DAYOFWEEK(`Date`) as daynum, SUM(`Quantity`) as 'Total_Expence' from `history` WHERE `Type` = 'Expence' AND `User_ID` = $userID AND WEEK(`Date`) = WEEK(curdate()) \n"

    . "GROUP BY DAYOFWEEK(`Date`) ORDER BY DAYOFWEEK(`Date`)) as t1\n"

    . "LEFT JOIN\n"

    . "(SELECT WEEK(`Date`) as week, DAYNAME(`Date`) as dayname,DAYOFWEEK(`Date`) as daynum, SUM(`Quantity`) as 'Total_Income' from `history` WHERE `Type` = 'Income' AND `User_ID` = $userID AND WEEK(`Date`) = WEEK(curdate()) \n"

    . "GROUP BY DAYOFWEEK(`Date`) ORDER BY DAYOFWEEK(`Date`)) as t2\n"

    . "ON t1.week = t2.week AND t1.daynum = t2.daynum\n"

    . "UNION\n"

    . "SELECT t2.week , t2.dayname,t2.daynum , t1.Total_Expence , t2.Total_Income FROM\n"

    . "(SELECT WEEK(`Date`) as week ,DAYNAME(`Date`) as dayname,DAYOFWEEK(`Date`) as daynum, SUM(`Quantity`) as 'Total_Expence' from `history` WHERE `Type` = 'Expence' AND `User_ID` = $userID AND WEEK(`Date`) = WEEK(curdate()) \n"

    . "GROUP BY DAYOFWEEK(`Date`) ORDER BY DAYOFWEEK(`Date`)) as t1\n"

    . "RIGHT JOIN\n"

    . "(SELECT WEEK(`Date`) as week ,DAYNAME(`Date`) as dayname,DAYOFWEEK(`Date`) as daynum, SUM(`Quantity`) as 'Total_Income' from `history` WHERE `Type` = 'Income' AND `User_ID` = $userID AND WEEK(`Date`) = WEEK(curdate()) \n"

    . "GROUP BY DAYOFWEEK(`Date`) ORDER BY DAYOFWEEK(`Date`)) as t2\n"

    . "ON t1.week = t2.week AND t1.daynum = t2.daynum";
$stmt = $con->prepare($query);
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$weekData= array();
for ($i = 0; $i < count($data); $i++){
    $weekData[$data[$i]['daynum']] = $data[$i]; 
}
$totalIncQuery = $con->prepare("SELECT SUM(`Quantity`) as 'Total_Income' FROM `history` WHERE `Type` = 'Income' AND WEEK(`Date`) = WEEK(curdate()) AND `User_ID` = $userID");
$totalIncQuery->execute();
$totalInc = $totalIncQuery->fetch(PDO::FETCH_ASSOC);
$totalExpQuery = $con->prepare("SELECT SUM(`Quantity`) as 'Total_Expence' FROM `history` WHERE `Type` = 'Expence' AND WEEK(`Date`) = WEEK(curdate()) AND `User_ID` = $userID");
$totalExpQuery->execute();
$totalExp = $totalExpQuery->fetch(PDO::FETCH_ASSOC);
echo json_encode(array("status" => "success", "total_income" => $totalInc['Total_Income'], "total_expence" => $totalExp['Total_Expence'], "data" => $weekData));
?>