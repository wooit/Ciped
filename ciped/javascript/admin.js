$(document).ready(function(){
    ajax_query();
});

function ajax_query(){
    httprequest = new XMLHttpRequest();
    httprequest.onreadystatechange = alertContents;
    httprequest.open('GET', 'jsonfile.json');
    httprequest.send();
}

function alertContents(){
    if(httprequest.readyState === XMLHttpRequest.DONE){
        if(httprequest.status === 200){
            bdd();
        } else{
            alert('probleme avec la requete')
        }
    }
}

function bdd(){
    let recup = JSON.parse(httprequest.responseText);
    $.ajax({
        url: "php/admin.php",
            type: "POST",
            data: {
            },
            datatype: "html",
            success: function(data){
                recup_bdd(data);
            }
    });
}

function recup_bdd(data){
    let display_bdd= JSON.parse(data);
    console.log(display_bdd.velo[0]);
    $("main").append("<table id='velos' style='border:1px solid white;'><tr style='border:1px solid white;'><td style='border:1px solid white;'>num vélo</td><td style='border:1px solid white;'>num borne dispo</td></tr>");
    for(i=0;i<display_bdd.velo.length;i++){
        if(display_bdd.velo[i][2]=1){

            $("main #velos").append("<tr style='border:1px solid white;'><td style='border:1px solid white; text-align:center;'>" + display_bdd.velo[i][0] + "</td><td style='text-align:center; border:1px solid white;'> " + display_bdd.velo[i][1] + "</td></tr>");

        }
    }
    $("main").append("</table><br>");
    $("main").append("<table id='station' style='border:1px solid white;'><tr style='border:1px solid white;'><td style='border:1px solid white;'>num station</td><td style='border:1px solid white;'>coord_X</td><td style='border:1px solid white;'>coord_Y</td></tr>");
    for(j=0;j<display_bdd.station.length;j++){
        $("main #station").append("<tr style='border:1px solid white;'><td style='border:1px solid white;'>" + display_bdd.station[j][0] + "</td><td style='border:1px solid white;'>" + display_bdd.station[j][1] + "</td><td style='border:1px solid white;'>" + display_bdd.station[j][2] + "</td></tr>");
    }
    $("main").append("</table><br>");

    $("main").append("</table><br>");
    $("main").append("<table id='user' style='border:1px solid white;'><tr style='border:1px solid white;'><td style='border:1px solid white;'>userID</td><td style='border:1px solid white;'>prenom</td><td style='border:1px solid white;'>pseudo</td></tr>");
    for(j=0;j<display_bdd.user.length;j++){
        $("main #user").append("<tr style='border:1px solid white;'><td style='border:1px solid white;'>" + display_bdd.user[j][0] + "</td><td style='border:1px solid white;'>" + display_bdd.user[j][1] + "</td><td style='border:1px solid white;'>" + display_bdd.user[j][2] + "</td></tr>");
    }
    $("main").append("</table><br>");
}