
!function ($) {
    var map;
    $(function(){
        $("#sel_hosp").val(0);
        function salir(){
            $("#modal").fadeOut(300);
            $("#fondooscuro").fadeOut(300);
        }
        $(".close_modal").click(function(){
            salir();
        });
        $("#fondooscuro").click(function(){
            salir();
        });
        document.onkeydown = function(evt) {
            evt = evt || window.event;
            if (evt.keyCode == 27) {
                salir();
            }
        };
        $("#sel_costo").hide();
        $("#sel_categoria").hide();
        $("#sel_hosp").change(function(){
            $("#sel_costo").val('0');
            $("#sel_categoria").val('0');
            if($(this).val()==1){
                $("#sel_costo").show();
                $("#sel_categoria").hide();
                $("#load_hotel").hide();
            }
            else{
                if($(this).val()==2){
                    $("#sel_categoria").show();
                    $("#sel_costo").hide();
                    $("#load_hotel").hide();
                }
                else{
                    $("#sel_costo").hide();
                    $("#sel_categoria").hide();
                    $("#load_hotel").hide();
                }
            }
            $("#sel_costo").change(function(){
                $.ajax({
                    type:"POST",
                    url:url+'web/seleccionar_cc',
                    data:{
                        rango:$(this).val()
                    },
                    dataType: 'json',
                    //                    beforeSend:function(){
                    //                        $("#load_hotel").html('<img src="'+url+'assets/img/load.gif"/>').show();
                    //                    },
                    success:function(json){
                        //                        $("#load_hotel").html(response).show();
                        map = new GMaps({
                            div: '#map',
                            lat: -6.488618840362275,
                            lng: -76.3645076751709,
                            zoom: 14
                        });
                        setMap(map);
                        map.addMarker({
                            lat: -6.486486813731826,
                            lng: -76.37927055358887,
                            icon:'http://icons.iconarchive.com/icons/deleket/mac-folders/64/3D-Studio-Max-icon.png',
                            title: 'UNSM-T',
                            click: function(e) {
                                alert('Lugar de Conferencia');
                            }
                        });

                        for(i=0 ; i<json.num_rows;i++){
                            map.addMarker({
                                id: json.result_id[i].id,
                                lat: json.result_id[i].latitud,
                                lng: json.result_id[i].longitud,
                                icon:'http://icons.iconarchive.com/icons/deleket/sleek-xp-basic/24/Home-icon.png',
                                title: json.result_id[i].nombre,
                                click: function(e) {
                                    hoteles(this.id);
                                }
                            });
                        }
                    }
                });
            });
            $("#sel_categoria").change(function(){
                $.ajax({
                    type:"POST",
                    url:url+'web/seleccionar_cc',
                    dataType: 'json',
                    data:{
                        categoria:$(this).val()
                    },
                    //                    beforeSend:function(){
                    //                        $("#load_hotel").html('<img src="'+url+'assets/img/load.gif"/>').show();
                    //                    },
                    success:function(json){
                        //                       $("#load_hotel").html(response).show();
                        map = new GMaps({
                            div: '#map',
                            lat: -6.488618840362275,
                            lng: -76.3645076751709,
                            zoom: 14
                        });
                        setMap(map);
                        map.addMarker({
                            lat: -6.486486813731826,
                            lng: -76.37927055358887,
                            icon:'http://icons.iconarchive.com/icons/deleket/mac-folders/64/3D-Studio-Max-icon.png',
                            title: 'UNSM-T',
                            click: function(e) {
                                alert('Lugar de Conferencia');
                            }
                        });

                        for(i=0 ; i<json.num_rows;i++){
                            map.addMarker({
                                id: json.result_id[i].id,
                                lat: json.result_id[i].latitud,
                                lng: json.result_id[i].longitud,
                                icon:'http://icons.iconarchive.com/icons/deleket/sleek-xp-basic/24/Home-icon.png',
                                title: json.result_id[i].nombre,
                                click: function(e) {
                                    hoteles(this.id);
                                }
                            });
                        }
                    }
                });
            });
            
            ////////////////////////////////////////////
            $("#sel_categoria").change(function(){
                $.ajax({
                    type:"POST",
                    url:url+'web/seleccionar_cc1',
                    data:{
                        categoria:$(this).val()
                    },
                    beforeSend:function(){
                        $("#load_hotel").html('<img src="'+url+'assets/img/load.gif"/>').show();
                    },
                    success:function(response){
                        $("#load_hotel").html(response).show();                      
                    }
                });
            });
            
            $("#sel_costo").change(function(){
                $.ajax({
                    type:"POST",
                    url:url+'web/seleccionar_cc1',
                    data:{
                        rango:$(this).val()
                    },
                    beforeSend:function(){
                        $("#load_hotel").html('<img src="'+url+'assets/img/load.gif"/>').show();
                    },
                    success:function(response){
                        $("#load_hotel").html(response).show();
                    }
                });
            });
        //////////////////////////////
        });
    });
}(window.jQuery);
var mapa;
function hoteles(id) {
    $.ajax({
        type:"POST",
        url:url+'web/seleccionar_h',
        data:{
            id:id
        },
        beforeSend:function(){
            $(".modal-body").html('<img src="'+url+'assets/img/load.gif"/>').show();
        },
        success:function(response){
            $(".modal-body").html(response);
            $("#fondooscuro").fadeIn(200);
            $("#modal").fadeIn(200);
        }
    });
}

function map_hoteles(id){
    $.ajax({
        type:"POST",
        url:url+'web/seleccionar_cc',
        dataType: 'json',
        data:{
            id:id
        },
        success:function(json){

            mapa.drawOverlay({
                lat: json.result_id[0].latitud,
                lng: json.result_id[0].longitud,
                content: '<div class="overlay">'+json.result_id[0].nombre+'<div class="overlay_arrow above"></div></div>',
                verticalAlign: 'top',
                verticalOffset: -40
            });
        }
    }); 
}
function setMap(map){
    mapa = map;
}