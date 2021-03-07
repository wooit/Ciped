<?php

include('../db/db_access.php');

    $requete1 = "SELECT * FROM `borne`";
    $exec_requete1 = mysqli_query($handler, $requete1);
        $test_borne=[];
        while ($data1 = mysqli_fetch_row($exec_requete1)){
            array_push($test_borne, $data1);
        }

    $requete2 = "SELECT * FROM `velo`";
    $exec_requete2 = mysqli_query($handler, $requete2);
        $test_velo=[];
        while ($data2 = mysqli_fetch_row($exec_requete2)){
            array_push($test_velo, $data2);
        }

    $requete3 = "SELECT id_user, prenom, pseudo FROM `user`";
    $exec_requete3 = mysqli_query($handler, $requete3);
        $test_user=[];
        while ($data3 = mysqli_fetch_row($exec_requete3)){
            array_push($test_user, $data3);
    }

    $requete4 = "SELECT * FROM `station`";
    $exec_requete4 = mysqli_query($handler, $requete4);
        $test_station=[];
        while ($data4 = mysqli_fetch_row($exec_requete4)){
            array_push($test_station, $data4);
    }

    $requete5 = "SELECT * FROM `reservation`";
    $exec_requete5 = mysqli_query($handler, $requete5);
        $test_reservation=[];
        while ($data5 = mysqli_fetch_row($exec_requete5)){
            array_push($test_reservation, $data5);
    }
$object = array(
    "velo"=>$test_velo,
    "borne"=>$test_borne,
    "user"=>$test_user,
    "reservation"=>$test_reservation,
    "station"=>$test_station
);
    $testJson = json_encode($object);
    echo $testJson;
    mysqli_close($handler);

///////////////////////////////////////////////////////////////////
  

// $requete1 = "SELECT * FROM `station`";
//     $exec_requete1 = mysqli_query($handler, $requete1);
//         $test_station=[];
//         while ($data1 = mysqli_fetch_row($exec_requete1)){
//             array_push($test_station, $data1);
//     }

// $requete2 = "SELECT `id_station`,`borne_id` FROM `borne` WHERE `dispo_borne` = 1";
//     $exec_requete2 = mysqli_query($handler, $requete2);
//         $test_borne=[];
//         while ($data2 = mysqli_fetch_row($exec_requete2)){
//             array_push($test_borne, $data2);
            
//         }

//     $requete3 = "SELECT `velo_id`  FROM `velo` WHERE `etat_velo` = 1";
//     $exec_requete3 = mysqli_query($handler, $requete3);
//         $test_velo=[];
//         while ($data3 = mysqli_fetch_row($exec_requete3)){
//             array_push($test_velo, $data3);
//         }

    
// $object = array(
//     "station"=>$test_station,
//     "borne"=>$test_borne,
//     "velo"=>$test_velo
// );
//     $testJson = json_encode($object);
//     echo $testJson;
//     mysqli_close($handler);


    
// --------FONCTIONNEL-------------
//NE PAS METTRE DE `` dans ma requete sur phpmyadmin. En revanche il faut les mettre sur mon script PHP.

    // SELECT borne.borne_id, velo.velo_id, velo.etat_velo
    // FROM `velo`
    // INNER JOIN borne
    // ON velo.velo_id = borne.borne_id
    // WHERE borne.dispo_borne = 1
    // AND velo.etat_velo = 1

?>
