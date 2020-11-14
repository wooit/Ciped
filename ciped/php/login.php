<?php
include('../db/db_access.php');

$pseudo = $_POST['pseudo'];
$mdp = sha1($_POST['mdp']);
//echo $pseudo;
// need to check requete preparée contre injec sql
$requete= "SELECT * FROM user WHERE pseudo = '".$pseudo."' AND mdp = '".$mdp."'";
$exec_requete = mysqli_query($handler, $requete);
    if(mysqli_num_rows($exec_requete)==1){
        if($pseudo === "admin"){
            echo "admin";
        }else{
            echo "user";
        }
    } else {
        echo "fail";
    }
    mysqli_close($handler);
?>
