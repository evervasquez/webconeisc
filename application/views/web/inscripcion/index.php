<div class="container">
    <div class="row">
        <h2>Inscripción</h2>
        <div class="span7">
            <h3>Costos</h3>
            <div style="text-align:center">
                <div class="image_wrapper">
                    <img src="<?php echo base_url()?>assets/img/costo inscripcion.png" alt="Costo de Inscripcion" />
                </div>
            </div>
        </div>
        <div class="span5">
            <h3>Inscríbase...</h3>
                <select name="busqueda" id="busqueda">
                    <option value="">:: Seleccione ::</option>
                    <option value="1">Email</option>
                    <option value="2">DNI</option>
                </select>
                <label>
                    <input type="text" id="parametro" name="parametro"/>
                </label>
                <input type="button" value="Buscar" class="btn" id="buscarInscrito"/>
            <div id="msg"></div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function(){
            alert('');
            $("#menu_inscripcion").addClass('active');
            $("select").val(0);
            $("input:text").val('');
            $("#busqueda").change(function(){
                $("#parametro").val('');
                if($(this).val()==1){
                    $("#parametro").email().attr('maxlength','45').focus();
                }
                if($(this).val()==2){
                    $("#parametro").solonumeros().attr('maxlength','8').focus();
                }
            });

            $("#buscarInscrito").click(function(){
                var bval = true;
                bval = bval && $( "#busqueda" ).combo();
                bval = bval && $( "#parametro" ).required();
                if(bval){
                    $.ajax({
                        type:"POST",
                        url:'inscripcion/buscar.php',
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
        });
    </script>
</div>