<?php
include "../connect.php";
include "../functions.php";
$userID = filterRequest("User_ID");
$query = "SELECT t1.year , t1.month , t1.Total_Expence , t2.Total_Income FROM\n"

    . "(SELECT YEAR(`Date`) as year , MONTH(`Date`) as month , SUM(`Quantity`) as 'Total_Expence' from `history` WHERE `Type` = 'Expence' AND `User_ID` = $userID AND YEAR(`Date`) = YEAR(curdate()) \n"

    . "GROUP BY year , month ORDER BY month) as t1\n"

    . "LEFT JOIN\n"

    . "(SELECT YEAR(`Date`) as year , MONTH(`Date`) as month , SUM(`Quantity`) as 'Total_Income' from `history` WHERE `Type` = 'Income' AND `User_ID` = $userID AND YEAR(`Date`) = YEAR(curdate()) \n"

    . "GROUP BY year , month ORDER BY month) as t2\n"

    . "ON t1.year = t2.year AND t1.month = t2.month\n"

    . "UNION\n"

    . "SELECT t2.year , t2.month , t1.Total_Expence , t2.Total_Income FROM\n"

    . "(SELECT YEAR(`Date`) as year , MONTH(`Date`) as month , SUM(`Quantity`) as 'Total_Expence' from `history` WHERE `Type` = 'Expence' AND `User_ID` = $userID AND YEAR(`Date`) = YEAR(curdate()) \n"

    . "GROUP BY year , month ORDER BY month) as t1\n"

    . "RIGHT JOIN\n"

    . "(SELECT YEAR(`Date`) as year , MONTH(`Date`) as month , SUM(`Quantity`) as 'Total_Income' from `history` WHERE `Type` = 'Income' AND `User_ID` = $userID AND YEAR(`Date`) = YEAR(curdate()) \n"

    . "GROUP BY year , month ORDER BY month) as t2\n"

    . "ON t1.year = t2.year AND t1.month = t2.month";
$stmt = $con->prepare($query);
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$yearData= array();
for ($i = 0; $i < count($data); $i++){
    $yearData[$data[$i]['month']] = $data[$i]; 
}
$totalIncQuery = $con->prepare("SELECT SUM(`Quantity`) as 'Total_Income' FROM `history` WHERE `Type` = 'Income' AND YEAR(`Date`) = YEAR(curdate()) AND `User_ID` = $userID");
$totalIncQuery->execute();
$totalInc = $totalIncQuery->fetch(PDO::FETCH_ASSOC);
$totalExpQuery = $con->prepare("SELECT SUM(`Quantity`) as 'Total_Expence' FROM `history` WHERE `Type` = 'Expence' AND YEAR(`Date`) = YEAR(curdate()) AND `User_ID` = $userID");
$totalExpQuery->execute();
$totalExp = $totalExpQuery->fetch(PDO::FETCH_ASSOC);
echo json_encode(array("status" => "success", "total_income" => $totalInc['Total_Income'], "total_expence" => $totalExp['Total_Expence'], "data" => $yearData));
?>