!function ($) {
    $(function(){
        $("#iddepartamento").val(0);
        $("#fecha_deposito").datepicker({dateFormat: 'dd-mm-yy',changeMonth:true,changeYear:true,minDate: new Date('2013','04','01'),
            maxDate: new Date('2013','07','12'),onSelect: function(date) {$("#idtipo_inscripcion").trigger('change')}});
        $("#id_institucion_group, #loadInstitucion, #loadDni, #loadEmail, #loadNro_operacion, #imgventanilla, #imgcejero_automatico, #imgagentebbva").hide();
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
        
        $("#email").attr('readonly',true).blur(function(){
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
        $("#email").trigger('blur');
        $("#nro_operacion").blur(function(){
            $.ajax({
                type:"POST",
                url:url+'inscripcion/validar',
                data:{
                    nro_operacion:$(this).val()
                },
                beforeSend:function(){
                    $("#loadNro_operacion").html('<img src="'+url+'assets/img/load.gif"/>').show();
                },
                success:function(response){
                    if(response=='Correcto'){
                        $("#loadNro_operacion").removeClass('alert alert-error').addClass('alert alert-success');
                    }else{
                        $("#loadNro_operacion").removeClass('alert alert-success').addClass('alert alert-error');
                    }
                    $("#loadNro_operacion").html(response).show();
                }
            });
        });
        
        $("#tipo_pago").change(function(){
            switch(parseInt($(this).val())){
                case 1: $("#imgventanilla").show();$("#imgcejero_automatico").hide();$("#imgagentebbva").hide();break;
                case 2: $("#imgventanilla").hide();$("#imgcejero_automatico").show();$("#imgagentebbva").hide();break;
                case 3: $("#imgventanilla").hide();$("#imgcejero_automatico").hide();$("#imgagentebbva").show();break;
                default: $("#imgventanilla").hide();$("#imgcejero_automatico").hide();$("#imgagentebbva").hide();break;
            }
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
        
        $("#idtipo_inscripcion").change(function(){
            var fecha_deposito = $("#fecha_deposito").val();
            var idtipo_inscripcion = $("#idtipo_inscripcion").val();
            var monto = "";
            if($.trim(fecha_deposito)!="" && idtipo_inscripcion!=""){
                var fecha=fecha_deposito.split("-");
                if(idtipo_inscripcion=="1"){
                    switch (fecha[1]){
                        case '05':monto="95.00" ;break;
                        case '06':monto="100.00" ;break;
                        case '07':monto="115.00" ;break;
                        case '08':monto="125.00" ;break;
                    }
                }else{
                    switch (fecha[1]){
                        case '05':monto="100.00" ;break;
                        case '06':monto="115.00" ;break;
                        case '07':monto="125.00" ;break;
                        case '08':monto="135.00" ;break;
                    }
                }
            }
            $("#monto").val(monto);
        });
        $("#idtipo_inscripcion").trigger('change');
        
        $("#registrar").click(function(){
            var bval = true;  
            if($("#loadDni").css('display')=='none'){
                $("#dni").trigger('blur');
            }
            if($("#loadEmail").css('display')=='none'){
                $("#email").trigger('blur');
            }
            if($("#loadNro_operacion").css('display')=='none'){
                $("#nro_operacion").trigger('blur');
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
            if(bval && $("#loadDni").html()!='Correcto'){
                bval=false;
                $("#dni").parents('div[class*=control-group]').removeClass('success').addClass('error');
                $("#dni").focus();
            }
            if(bval && $("#loadEmail").html()!='Correcto'){
                bval=false;
                $("#email").parents('div[class*=control-group]').removeClass('success').addClass('error');
                $("#email").focus();
            }
            if(bval && $("#loadNro_operacion").html()!='Correcto'){
                bval=false;
                $("#nro_operacion").parents('div[class*=control-group]').removeClass('success').addClass('error');
                $("#nro_operacion").focus();
            }
            if(bval) {
                $("#form").submit();
            }
        });
    });
}(window.jQuery)