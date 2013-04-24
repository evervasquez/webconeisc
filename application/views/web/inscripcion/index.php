<script type="text/javascript">
    !function ($) {
        $(function(){
            $("input:text").val('');
            $("#buscarInscrito").click(function(){
                var bval = true;
//                var filter = /[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
                bval = bval && $( "#email" ).email();
//                if(filter.test($("#email").val())){
//                    $("#email").removeClass('error').addClass('success');
//                    bval = true;
//                }else{
//                    $("#email").parents('div[class*=control-group]').removeClass('success').addClass('error');
//                    bval = false;
//                }
                if(bval){
                    $.ajax({
                        type:"POST",
                        url:'<?php echo base_url();?>inscripcion/validaInscrito',
                        data:{
                            email:$("#email").val()
                        },
                        beforeSend:function(){
                            $("#msg").html('<img src="<?php echo base_url()?>assets/img/load.gif"/>');
                        },
                        success:function(response){
                            if(response=='nuevo'){
                                $("#form").submit();
                            }else{
                                $("#msg").html(response);
                            }
                        }
                    });
                }
            });
            
            $("#email").keypress(function(e){
                var tecla = (document.all) ? e.keyCode : e.which; 
                if(tecla==13){
                    e.preventDefault();
                    $("#buscarInscrito").trigger('click');
                }
            });
        });
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
                        <img src="<?php echo base_url() ?>assets/img/costo inscripcion.png" class="img-polaroid" alt="Costo de Inscripcion" />
                    </div>
                </div>
            </div>
            <div class="span3">
                <h3>Consulte o Inscríbase</h3>
                <p>Ingrese su email:</p>
                <form action="<?php echo base_url()?>inscripcion/nuevo" method="post" id="form">
                    <div class="control-group">
                        <input type="text" id="email" name="email" placeholder="email"/>
                    </div>
                    <input type="button" value="Enviar" class="btn btn-primary" id="buscarInscrito"/>
                </form>
                <div id="msg"></div>
            </div>
        </div>
        <br/>
    </div>
</div>