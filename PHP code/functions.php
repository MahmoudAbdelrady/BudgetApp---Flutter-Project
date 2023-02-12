<?php
    function filterRequest($requestName){
        return htmlspecialchars(strip_tags($_POST[$requestName]));
    }
    function printSuccess($data){
        echo json_encode(array("status" => "success" , "data" => $data));
    }
    function printFail(){
        echo json_encode(array("status" => "fail"));
    }
?>