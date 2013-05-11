
!function ($) {
    $(function(){
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
                    beforeSend:function(){
                        $("#load_hotel").html('<img src="'+url+'assets/img/load.gif"/>').show();
                    },
                    success:function(response){
                        $("#load_hotel").html(response).show();
                    }
                });
            });
            $("#sel_categoria").change(function(){  
                $.ajax({
                    type:"POST",
                    url:url+'web/seleccionar_cc',
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
        });
    });
}(window.jQuery);
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