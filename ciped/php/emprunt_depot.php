<?php
include('../db/db_access.php');

$indexmin1 = $_POST['indexmin_emprunt'];
$indexmin2 = $_POST['indexmin_depot'];

$requete1 = "SELECT * FROM `borne` WHERE id_station = '".$indexmin1."' AND dispo_borne = 1 ";
$exec_requete1 = mysqli_query($handler, $requete1);
    $test1=[];
    while ($data1 = mysqli_fetch_row($exec_requete1)){
        array_push($test1, $data1[0]);
    }

$requete2 = "SELECT * FROM `borne` WHERE id_station = '".$indexmin2."' AND dispo_borne = 0 ";
$exec_requete2 = mysqli_query($handler, $requete2);
    $test2=[];
    while ($data2 = mysqli_fetch_row($exec_requete2)){
        array_push($test2, $data2[0]);
    }

$recup_station = array(
    "emprunt" => $test1,
    "depot" => $test2
);
    $testJson = json_encode($recup_station);
    echo $testJson;
    mysqli_close($handler);


?>