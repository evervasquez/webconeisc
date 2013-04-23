!function ($) {
    $(function(){
        $("#fecha_deposito").datepicker({dateFormat: 'dd-mm-yy',changeMonth:true,changeYear:true});
        $("#id_institucion_group, #loadInstitucion").hide();
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
                        $("#loadDni").html(response);
                    }
                });
            }else{
                $("#loadDni").html('Ingrese 8 digitos de su dni');
            }
        });
    
        $("#email").blur(function(){
            $.ajax({
                type:"POST",
                url:url+'inscripcion/validar',
                data:{
                    email:$(this).val()
                },
                beforeSend:function(){
                    $("#loadEmail").html('<img src="'+url+'assets/img/ajax-loader.gif"/>').show();
                },
                success:function(response){
                    $("#loadEmail").html(response);
                }
            });
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
            bval = bval && $( "#idtipo_inscripcion" ).combo();
            bval = bval && $( "#nombres" ).required();
            bval = bval && $( "#apellidos" ).required();
            bval = bval && $( "#dni" ).required();
            bval = bval && $( "#telefono" ).required();
            bval = bval && $( "#email" ).required();
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