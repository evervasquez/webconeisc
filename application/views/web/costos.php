<script type="text/javascript">var url = "<?php echo base_url() ?>"</script>
<script type="text/javascript">
!function ($) {
    $(function(){
        $("#sel_costo").hide();
        $("#sel_categoria").hide();
        $("#sel_hosp").change(function(){
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
            $(".modal-body").html('ayeee');
            $("#myModal").modal({
                show: true
            });
        }
    });
}
</script>
<div class="container">
    <div class="navbar-inner">
        <div class="page-header">
            <h3>COSTOS DE VIDA</h3>
        </div>
        
        <div class="row-fluid">
            <div class="span6">
                <div class="text-center">
                <h4>Costos de Hospedaje</h4>
                    <img src="<?php echo base_url()?>assets/img/hospedaje.jpg" class="img-polaroid" />
                </div>
                <div class="text-center page">
                <h4>Costos de Alimentación</h4>
                    <img src="<?php echo base_url()?>assets/img/alimentacion.png" class="img-polaroid" />
                </div>
                <div class="text-center page">
                <h4>Costos de Movilidad</h4>
                    <img src="<?php echo base_url()?>assets/img/movilidad.png" class="img-polaroid" />
                </div>
            </div>
            <div class="span6 text-center">
                <h4>Seleccione</h4>
                <div>
                    <select id="sel_hosp">
                        <option>---</option>
                        <option value="1">Por Costo</option>
                        <option value="2">Por Categoria</option>
                    </select>
                </div>
                <div>
                    <select id="sel_costo">
                        <option>---</option>
                        <option value="10-15">S/.10 - S/.15</option>
                        <option value="15-25">S/.15 - S/.25</option>
                        <option value="25-35">S/.25 - S/.35</option>
                        <option value="35-50">S/.35 - S/.50</option>
                        <option value="50-60">S/.50 - S/.60</option>
                        <option value="60-80">S/.60 - S/.80</option>
                    </select>
                </div>
                <div>
                    <select id="sel_categoria">
                        <option>---</option>
                        <option value="Hospedaje">Hospedaje</option>
                        <option value="Alojamiento">Alojamiento</option>
                        <option value="Hosteria">Hosteria</option>
                    </select>
                </div>
                <div id="load_hotel" style="margin:0 auto;max-height: 350px; width: 60%;overflow-y: auto">
                    
                </div>
                <!-- Modal -->
                <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Información</h3>
                    </div>
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Ok</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>