<script type="text/javascript">
    !function ($) {
        $(function(){
            $("select").val(0);
            $("input:text").val('');
            $("#busqueda").change(function(){
                $("#parametro").val('');
                if($(this).val()==1){
                    $("#parametro").attr('maxlength','45').focus();
                }
                if($(this).val()==2){
                    $("#parametro").attr('maxlength','8').focus();
                }
            });

            $("#buscarInscrito").click(function(){
                var bval = true;
                bval = bval && $( "#busqueda" ).combo();
                bval = bval && $( "#parametro" ).required();
                if(bval){
                    $.ajax({
                        type:"POST",
                        url:'<?php echo base_url();?>inscripcion/validaInscrito',
                        data:{
                            busqueda:$("#busqueda").val(),
                            parametro:$("#parametro").val()
                        },
                        beforeSend:function(){
                            $("#msg").html('Buscando...');
                        },
                        success:function(response){
                            $("#msg").html(response);
                        }
                    });
                }
            });
        })
    }(window.jQuery)
</script>
<div class="container">
    <div class="navbar-inner">
        <div class="row-fluid">
            <h2>Inscripción</h2>
            <div class="span8">
                <h3>Costos</h3>
                <div style="text-align:center">
                    <div class="image_wrapper">
                        <img src="<?php echo base_url() ?>assets/img/costo inscripcion.png" alt="Costo de Inscripcion" />
                    </div>
                </div>
            </div>
            <div class="span3">
                <h3>Inscríbase...</h3>
                <div class="control-group">
                    <select name="busqueda" id="busqueda">
                        <option value="0">:: Seleccione ::</option>
                        <option value="1">Email</option>
                        <option value="2">DNI</option>
                    </select>
                </div>
                <div class="control-group">
                    <input type="text" id="parametro" name="parametro" class=""/>
                </div>
                <input type="button" value="Buscar" class="btn btn-primary" id="buscarInscrito"/>
                <div id="msg"></div>
            </div>
        </div>
        <br/>
    </div>
</div>