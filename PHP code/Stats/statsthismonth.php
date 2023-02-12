<?php
include "../connect.php";
include "../functions.php";
$userID = filterRequest("User_ID");
$query = "SELECT t1.month , t1.week , t1.Total_Expence , t2.Total_Income FROM\n"

    . "(SELECT MONTH(`Date`) as month, WEEK(`Date`) as week, SUM(`Quantity`) as 'Total_Expence' from `history` WHERE `Type` = 'Expence' AND `User_ID` = $userID AND MONTH(`Date`) = MONTH(curdate()) \n"

    . "GROUP BY week ORDER BY week) as t1\n"

    . "LEFT JOIN\n"

    . "(SELECT MONTH(`Date`) as month, WEEK(`Date`) as week, SUM(`Quantity`) as 'Total_Income' from `history` WHERE `Type` = 'Income' AND `User_ID` = $userID AND MONTH(`Date`) = MONTH(curdate()) \n"

    . "GROUP BY week ORDER BY week) as t2\n"

    . "ON t1.month = t2.month AND t1.week = t2.week\n"

    . "UNION\n"

    . "SELECT t2.month , t2.week , t1.Total_Expence , t2.Total_Income FROM\n"

    . "(SELECT MONTH(`Date`) as month ,WEEK(`Date`) as week, SUM(`Quantity`) as 'Total_Expence' from `history` WHERE `Type` = 'Expence' AND `User_ID` = $userID AND MONTH(`Date`) = MONTH(curdate()) \n"

    . "GROUP BY week ORDER BY week) as t1\n"

    . "RIGHT JOIN\n"

    . "(SELECT MONTH(`Date`) as month ,WEEK(`Date`) as week, SUM(`Quantity`) as 'Total_Income' from `history` WHERE `Type` = 'Income' AND `User_ID` = $userID AND MONTH(`Date`) = MONTH(curdate()) \n"

    . "GROUP BY week ORDER BY week) as t2\n"

    . "ON t1.month = t2.month AND t1.week = t2.week";
$stmt = $con->prepare($query);
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$monthData= array();
for ($i = 0; $i < count($data); $i++){
    $monthData[$data[$i]['week']] = $data[$i]; 
}
$totalIncQuery = $con->prepare("SELECT SUM(`Quantity`) as 'Total_Income' FROM `history` WHERE `Type` = 'Income' AND MONTH(`Date`) = MONTH(curdate()) AND `User_ID` = $userID");
$totalIncQuery->execute();
$totalInc = $totalIncQuery->fetch(PDO::FETCH_ASSOC);
$totalExpQuery = $con->prepare("SELECT SUM(`Quantity`) as 'Total_Expence' FROM `history` WHERE `Type` = 'Expence' AND MONTH(`Date`) = MONTH(curdate()) AND `User_ID` = $userID");
$totalExpQuery->execute();
$totalExp = $totalExpQuery->fetch(PDO::FETCH_ASSOC);
echo json_encode(array("status" => "success", "total_income" => $totalInc['Total_Income'], "total_expence" => $totalExp['Total_Expence'], "data" => $monthData));
// For last month
// WHERE MONTH(`Date`) = MONTH(NOW() - INTERVAL 1 month)
// Every month
// week 1 = 1 + (4*(current month - 1))
// week 2 = 2 + (4*(current month - 1))
// week 3 = 3 + (4*(current month - 1))
// week 4 = 4 + (4*(current month - 1))
// 1 -> 1
// 2 -> 2
// 3 -> 3
// 4 -> 4
// 5 -> 1
// 6 -> 2
// 7 -> 3
// 8 -> 4
// 9 -> 1
// 10 -> 2
// 11 -> 3
// 12 -> 4
?>