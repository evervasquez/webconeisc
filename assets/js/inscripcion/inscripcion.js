!function ($) {
    $(function(){
        $("#fecha_deposito").datepicker({dateFormat: 'dd-mm-yy',changeMonth:true,changeYear:true});
        $("#id_institucion_group, #loadInstitucion, #loadDni, #loadEmail").hide();
        $("#dni").solonumeros().blur(function(){
            if($(this).val().length==8){
                $.ajax({
                    type:"POST",
                    url:url+'inscripcion/validar',
                    data:{
                        dni:$(this).val()
                    },
                    beforeSend:function(){
                        $("#loadDni").html('<img src="'+url+'assets/img/load.gif"/>').show();
                    },
                    success:function(response){
                        if(response=='Correcto'){
                            $("#loadDni").removeClass('alert alert-error').addClass('alert alert-success');
                        }else{
                            $("#loadDni").removeClass('alert alert-success').addClass('alert alert-error');
                        }
                        $("#loadDni").html(response).show();
                    }
                });
            }else{
                $("#loadDni").html('Ingrese 8 digitos de su dni').removeClass('alert alert-success').addClass('alert alert-error').show();
            }
        });
        
        if($('#nombres').val() != ''){
            $("#nombres").parents('div[class*=control-group]').addClass('success');
        }
        if($('#apellidos').val() != ''){
            $("#apellidos").parents('div[class*=control-group]').addClass('success');
        }
        
        $("#email").blur(function(){
            $.ajax({
                type:"POST",
                url:url+'inscripcion/validar',
                data:{
                    email:$(this).val()
                },
                beforeSend:function(){
                    $("#loadEmail").html('<img src="'+url+'assets/img/load.gif"/>').show();
                },
                success:function(response){
                    if(response=='Correcto'){
                        $("#loadEmail").removeClass('alert alert-error').addClass('alert alert-success');
                    }else{
                        $("#loadEmail").removeClass('alert alert-success').addClass('alert alert-error');
                    }
                    $("#loadEmail").html(response).show();
                }
            });
        });
        
        $("#confirma_email").keyup(function(){
            if($("#loadEmail").css('display')=='none'){
                $("#email").trigger('blur');
            }
            if($("#loadEmail").html()=='Correcto'){
                if($("#email").val()!=$("#confirma_email").val()) {
                    $("#confirma_email").parents('div[class*=control-group]').removeClass('success').addClass('error');
                }else{
                    $("#confirma_email").parents('div[class*=control-group]').removeClass('error').addClass('success');
                }
            }else{
                $("#confirma_email").parents('div[class*=control-group]').removeClass('error').removeClass('success');
            }
        });
        $("#iddepartamento").change(function(){
            if($(this).val()!=26){
                $("#id_idinstitucion_group").show();
                $("#id_institucion_group").hide();
                $.ajax({
                    type:"POST",
                    url:url+'inscripcion/getInstituciones',
                    data:{
                        iddepartamento:$(this).val()
                    },
                    beforeSend:function(){
                        $("#loadInstitucion").show();
                    },
                    success:function(response){
                        $("#loadInstitucion").hide();
                        $("#idinstitucion").attr('disabled', false).html(response);
                    }
                });
            }else{
                $("#idinstitucion").html('<option value="0">- -Seleccionar- -</option>');
                if($(this).val()!=0){
                    $("#idinstitucion").attr('disabled', true);
                    $("#id_idinstitucion_group").hide();
                    $("#id_institucion_group").show();
                }
            }
        });
    
        $("#idinstitucion").change(function(){
            if($("#idinstitucion option:selected").html()=='OTRO'){
                $("#id_institucion_group").show();
            }else{
                $("#id_institucion_group").hide();
            }
        });
    
        $("#registrar").click(function(){
            var bval = true;  
            if($("#loadDni").css('display')=='none'){
                $("#dni").trigger('blur');
            }
            if($("#loadEmail").css('display')=='none'){
                $("#email").trigger('blur');
            }
            bval = bval && $( "#idtipo_inscripcion" ).combo();
            bval = bval && $( "#nombres" ).required();
            bval = bval && $( "#apellidos" ).required();
            bval = bval && $( "#email" ).email();
            if(bval && $("#loadEmail").html()=='Correcto'){
                bval = bval && $( "#confirma_email" ).email();
            }else{
                if(bval){
                    $("#email").focus();
                    bval = false;
                }
            }
            if(bval && $( "#email" ).val()!=$( "#confirma_email" ).val()) {
                alert('Los emails no coinciden');
                $("#email").focus();
                bval = false;
            }
            bval = bval && $( "#dni" ).required();
            bval = bval && $( "#telefono" ).required();
            if(bval && !$("[name=sexo]").is(":checked")){
                bval = false;
                alert('Seleccione sexo');
            }
            bval = bval && $( "#iddepartamento" ).combo();
            if($("#id_idinstitucion_group").css('display')!='none'){
                bval = bval && $( "#idinstitucion" ).combo();
            }
            if($("#id_institucion_group").css('display')!='none'){
                bval = bval && $( "#institucion" ).required();
            }
            bval = bval && $( "#tipo_pago" ).combo();
            bval = bval && $( "#fecha_deposito" ).required();
            bval = bval && $( "#nro_operacion" ).required();
            bval = bval && $( "#monto" ).combo();
            if(bval && $("#loadDni").html()!='Correcto'){
                bval=false;
                $("#dni").parents('div[class=control-group]').removeClass('success').addClass('error');
            }
            if(bval && $("#loadEmail").html()!='Correcto'){
                bval=false;
                $("#email").parents('div[class=control-group]').removeClass('success').addClass('error');
            }
            if(bval) {
                $("#form").submit();
            }
        });
    });
}(window.jQuery)