<script type="text/javascript">
    !function ($) {
        $(function(){
            $("input:text").val('');
            $("#buscarInscrito").click(function(){
                var bval = true;
                bval = bval && $( "#email" ).email();
                if(bval){
                    $.ajax({
                        type:"POST",
                        url:'<?php echo base_url();?>inscripcion/validaInscrito',
                        data:{
                            email:$("#email").val()
                        },
                        beforeSend:function(){
                            $("#msg").html('<img src="<?php echo base_url()?>assets/img/load.gif"/>').show();
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
    }(window.jQuery);
    function enviarEmail(email){
        $.ajax({
            type:"POST",
            url:'<?php echo base_url();?>inscripcion/reenviar_email',
            data:{
                email:email
            },
            beforeSend:function(){
                $("#msg").html('<img src="<?php echo base_url()?>assets/img/load.gif"/>').show();
            },
            success:function(response){
                $("#msg").html(response);
            }
        });
    }
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
                <h4><a href="#myModal" role="button" data-toggle="modal">Leer Pasos de Inscripción</a></h4>
                <h3>Consulte o Inscríbase</h3>
                
                <!-- Modal -->
                <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Pasos para Inscribir</h3>
                    </div>
                    <div class="modal-body text-justify">
                        <h4>Instrucciones para Inscripción</h4>
                        <ol>
                            <li>Hacer el pago respectivo según el Cronograma de Inscripción.</li>
                            <li>Al momento de depositar solicitar al cajero que registre su Nombre o DNI.</li>
                            <li>Ingrese a <a href="<?php echo base_url() ?>inscripcion/">www.coneisc.pe/inscripcion</a>.</li>
                            <li>Ingrese su correo electrónico en "Consulte o Inscribase". Si ya esta registrado se mostrará el estado de su inscripción 
                                o de lo contrario lo llevará al formulario de inscripción.</li>
                        </ol>
                        <h4>Formulario de Inscripción</h4>
                        <ul>
                            <li>Realiza el Registro de sus datos personales y de operación bancaria.</li>
                            <li>Al registrarse se le enviará un correo para confirmar su inscripción.</li>
                            <li>Al confirmar su email su inscripción se encuentra en proceso de verificación y usted debe esperar 72 horas para recibir la confirmación de la misma.</li>
                        </ul>
                        <h5><label style="color:red;font-weight: bold">Nota:</label>
                        <p>No olvide traer el voucher o una copia del mismo el día del congreso para la entega de materiales.</p></h5>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    </div>
                </div>
                <p>Ingrese su email:</p>
                <form action="<?php echo base_url()?>inscripcion/nuevo" method="post" id="form">
                    <div class="control-group">
                        <input type="text" id="email" name="email" placeholder="email"/>
                    </div>
                    <input type="button" value="Enviar" class="btn btn-primary" id="buscarInscrito"/>
                </form>
                <div id="msg" class="alert alert-info" style="display: none"></div>
            </div>
        </div>
        <br/>
    </div>
</div>