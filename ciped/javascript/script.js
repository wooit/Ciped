$(document).ready(function(){
    ajax_query();
});

//Declaration des variables qui seront nécessaires
let user_pseudo='';
let station_emprunt='';
let station_depot='';
let num_emprunt='';
let num_depot='';
let random='';
let cb='';
let arrStation = [
    [150,100],
    [500,100],
    [800,100],
    [50,350],
    [350,350],
    [650,350],
    [950,350],
    [150,600],
    [500,600],
    [800,600]
]   

function ajax_query(){
    httprequest = new XMLHttpRequest();
    httprequest.onreadystatechange = alertContents;
    httprequest.open('GET', 'jsonfile.json');
    httprequest.send();
}

function alertContents(){
    if(httprequest.readyState === XMLHttpRequest.DONE){
        if(httprequest.status === 200){
            formulaire();
        } else{
            alert('probleme avec la requete')
        }
    }
}

//function formulaire sur page d'acceuil
function formulaire(){
    $("main").text(""); // pour remettre le main à 0
    let recup = JSON.parse(httprequest.responseText)
    $("main").append(recup[0]);
    $("input[name='enregistrement']").click(function(){
        $("main").text("");
        $("main").append(recup[1]);
        creation();
    });
    $("input[name='connexion']").click(function(){
        connexion();
    });
}
//function creation d'account
function creation(){
    $("input[name='creer']").click(function(){
        $.ajax({
            url: "php/account.php",
            type: "POST",
            data: {
                nom: $('#name').val(),
                prenom: $('#prenom').val(),
                pseudo: $('#pseudo').val(),
                mdp: $('#mdp').val(),
                confirmmdp: $('#confirmmdp').val()
            },
            datatype: "html",
            success: function(data){
                //console.log(data.charAt(data.length-1));
                if(data.charAt(data.length-1)=="l"){ // l = dernier caractère de fail
                    alert("une erreur s'est produit lors de votre enregistrement")
                    //alert("votre pseudo existe deja");
                } else if (data.charAt(data.length-1)=="p"){ // p = dernier caractère de mdp
                    alert("vos mots de passe ne sont pas identiques");
                } else {
                    alert("votre enregistrement est validé");
                    formulaire();
                }
            }
        });
    });
}
//function de connexion si deja inscrit
function connexion(){
    $.ajax({
        url: "php/login.php",
        type: "POST",
        data: {
            pseudo: $("#pseudo").val(),
            mdp: $("#mdp").val()
        },
        datatype: "html",
        success: function(data){
            //console.log(data.charAt(data.length-1));
            if(data.charAt(data.length-1)=="l"){
                alert("mot de passe ou identifiants incorrects");
                formulaire();
            } else if(data.charAt(data.length-1)=="n"){
                document.location.href="admin.html";
            } else {
               // chargement des données X et Y
                user_pseudo = $("#pseudo").val();
                alert("bienvenu "+ $("#pseudo").val());
                $("main").text("");
                let recup = JSON.parse(httprequest.responseText)
                $("main").append(recup[2]);
                userPosition();
            }
        }
    });
}
//Fonction qui affiche les stations les plus proches
function userPosition(){
    $("#btn").click(function(){
        let myX=$("#positionX").val();
        let myY=$("#positionY").val();
        let destX=$("#destinationX").val();
        let destY=$("#destinationY").val();
        findStationCloseToMe(myX,myY);
        findStationCloseToWhereIwantToGo(destX,destY);
        select_bornes(); 
        
    });
    $("#reset").click(function(){
        $(".reset").val("");
        $("main .reponse_station").text("");
        $(".bornes_dispo").text("");
    });
}; 

function select_bornes(){
    let recup4 = JSON.parse(httprequest.responseText);
    $("main").append(recup4[6]);
    $.ajax({
        type: "POST",
        url: 'php/emprunt_depot.php',
        // indexmin = c'est comme une new var // indexmin1 = valeur réelle
        data: {
            indexmin_emprunt : station_emprunt,
            indexmin_depot : station_depot
        },
        datatype: "html",
        success: function(data)
        {
            test(data);
        }
    });
    
};

//fonctions pour trouver la station la plus proche du user en fonction de ses coordonnées XY
function findStationCloseToMe (x,y){
    let result = [];
    for(i=0; i<arrStation.length; i++){
        let total = Math.abs(x - arrStation[i][0]) + Math.abs(y - arrStation[i][1]);
        result.push(total);
    }
    let min1 = Math.min.apply(null, result);
    let indexmin1 = result.indexOf(min1)+1;
    station_emprunt = indexmin1;
    $("main .reponse_station").append(" la station la plus proche est la station <strong>"+ indexmin1 +"</strong>");
}

function findStationCloseToWhereIwantToGo(x,y){
    let result = [];
    for(i=0; i<arrStation.length; i++){
        let total = Math.abs(x - arrStation[i][0]) + Math.abs(y - arrStation[i][1]);
        result.push(total);
    }
    let min2 = Math.min.apply(null, result);
    let indexmin2 = result.indexOf(min2)+1;
    station_depot = indexmin2;
    $("main .reponse_station").append(" <br> la station la plus proche de votre destination est la station <strong>"+ indexmin2+"</strong>");
}

function test(data){
    let arrJson= JSON.parse(data);
    let recup2 = JSON.parse(httprequest.responseText);
    //$("main").append(recup4[6]);
    console.log(arrJson);
    // $("main .borne_dispo").remove();
    // $("main").append(recup2[3]);
    for(i=0; i<arrJson.emprunt.length; i++){
        $("main .choix_station_emprunt").append("<option>" + arrJson.emprunt[i] + "</option><br>");
        //console.log(arrJson.emprunt[i]);
    }
    for(j=0; j<arrJson.depot.length; j++){
        $("main .choix_station_depot").append("<option>" + arrJson.depot[j] + "</option><br>");
        //console.log(arrJson.depot[j]);
    }
    $("#selection").click(function(){
        num_emprunt = $(".choix_station_emprunt").val();
        num_depot = $(".choix_station_depot").val();
        console.log(num_emprunt);
        console.log(num_depot);
        form_velo();
    })
}

// Pour la location d'un velo
function form_velo(){
    $("main #containerLoc").remove();
    $("main .reserv_borne").remove();
    let recup3 = JSON.parse(httprequest.responseText);
    $("h3").append(recup3[4]);
    $("#valid_cb").click(function(){
        cb = $("#cb").val();
        valider_ticket();
    });
    $("#valid_cb").attr("disables", true);
}

//confirmation de la validation
function valider_ticket(){
    let num_random = Math.floor(Math.random() * 1000);
    random = num_random;
    let recup5 = JSON.parse(httprequest.responseText);
    $("main").text("");
    $(".main").text("");
    $("main").append("<div class='ticket'><table ><th>Confirmation de votre réservation</><tr><td>Pseudo :</td><td><em>" + user_pseudo + "</em></td></tr><tr><td>Votre vélo vous attend à la :</td><td>borne n° <em>" + num_emprunt + "</em> de la station n° <em>" + station_emprunt + "</em></td></tr><tr><td>Votre vélo est attendu à la :</td><td>borne n° <em>" + num_depot + "</em> de la station n° <em>" + station_depot + "</em></td></tr><tr><td>Votre code de réservation est :</td><td><em>" + num_random + "</em></td></tr></table><br><p>*Nous vous rappelons qu'à défaut de restitution du vélo dans les délais impartis(voir règlementation), nous nous verrons dans l'obligation de vous prélever 30€/jour de retard.</p><br><button id='valider_ticket'>Confirmer</button></div>");
    $("#valider_ticket").click(function(){
        end();
    });

    function end(){
        $("main").text("");
        $.ajax({
            type : "POST",
            url : "php/the_end.php",
            data : {
                pseudo : user_pseudo,
                emprunt : station_emprunt,
                depot : station_depot,
                num_cb : cb,
                reservation : random,
                numero_emprunt : num_emprunt,
                numero_depot : num_depot
            },
            datatype : "html",
            success : function(data){
                console.log(data[0]); //on récupère le "S" de success pour entrer dans la condition car "data" nous renvoi success suivi d'un bloc html ?
                if(data[0] === "s"){  
                    alert(user_pseudo + ", Votre commande est validée ! Bonne journée");
                    document.location.href="ciped.html";
                } else {
                    alert("Une erreur s'est produite lors de votre validation !");
                    let recup1 = JSON.parse(httprequest.responseText);
                    $("main").append(recup1[4]);
                    userPosition();
                }
            }
        }); 
    }
}
