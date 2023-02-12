<?php
    $req_url = "https://v6.exchangerate-api.com/v6/69576a9fbdeb3970f6c7b692/latest/USD";
    $response_json = file_get_contents($req_url);
    // $amount = htmlspecialchars(strip_tags($_POST["Amount"]));
    if($response_json != false){
        try{
            $response = json_decode($response_json);
            echo json_encode($response);
            if($response->result == "success"){
                $base_price = 12;
                // echo count($response->conversion_rates);
            }
            // if ($response->result == 'success'){
            //     $base_price = 12;
            //     $EUR_price = round(($base_price * $response->conversion_rates->EUR), 2);
                
            // }
        }
        catch(Exception $e){}
    }
?>