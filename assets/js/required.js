/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var _msg_error="<span class='box box-error' style='width:100% !important;'>Mensaje de Error</span>";
var _msg_info="<span class='box box-info' style='width:100% !important;'>Mensaje de Información</span>";

(function( $ ){
	$.fn.solonumeros = function() {
		var az = "abcdefghijklmn�opqrstuvwxyzñ";
		az += az.toUpperCase();
		az += "!@#$%^&*()+=[]\\\';,/{}|\":<>?~`-._ ";	
		  	
		return this.each (function() {
			$(this).keypress(function (e){
				if (!e.charCode) k = String.fromCharCode(e.which);
				else k = String.fromCharCode(e.charCode);
										
				if (az.indexOf(k) != -1) e.preventDefault();
				if (e.ctrlKey&&k=='v') e.preventDefault();
									
			});
						
			/*$(this).bind('contextmenu',function () {return false});*/
		});	 
	};
})( jQuery );

(function( $ ) {
    $.fn.required = function(opciones) {
        var estado = true;
        var first = true;
        var valoresDefault = {
            numero: false,
            tipo: "entero",
            aceptaCero: false
        }
        
        $.extend(valoresDefault, opciones);
        
        this.each (function() {
            var valor = $.trim( $(this).val() );
            if ( valor.length <1) {
//                $(this).addClass('ui-state-error ui-icon-alert');
                $(this).parents('div[class*=control-group]').removeClass('success').addClass('error');
                if(first) {
                    $(this).focus();
                    first = false;
                }
                estado = estado && false;
            } else {
                if(valoresDefault.numero) {
                    if(valoresDefault.tipo == "entero" || valoresDefault.tipo == "int" || valoresDefault.tipo == "integer") {
                        valor = parseInt(valor);
                    }
                    else if(valoresDefault.tipo == "real" || valoresDefault.tipo == "double" || valoresDefault.tipo == "float") {
                        valor = parseFloat(valor);
                    }
                    if(isNaN(valor)) {
//                        $(this).addClass('ui-state-error ui-icon-alert');
                        $(this).parents('div[class*=control-group]').removeClass('success').addClass('error');
                        if(first) {
                            $(this).focus();
                            first = false;
                        }
                        estado = estado && false;
                    }
                    else {
                        if(valoresDefault.aceptaCero) {
//                            $(this).removeClass('ui-state-error ui-icon-alert');
                            $(this).parents('div[class*=control-group]').removeClass('error').addClass('success');
                            estado = estado && true;
                        }
                        else {
                            if(valor == 0) {
//                                $(this).addClass('ui-state-error ui-icon-alert');
                                $(this).parents('div[class*=control-group]').removeClass('success').addClass('error');
                                if(first) {
                                    $(this).focus();
                                    first = false;
                                }
                                estado = estado && false;
                            }
                            else {
//                                $(this).removeClass('ui-state-error ui-icon-alert');
                                $(this).parents('div[class*=control-group]').removeClass('error').addClass('success');
                                estado = estado && true;
                            }
                        }
                    }
                }
                else {
//                    $(this).removeClass('ui-state-error ui-icon-alert');
                    $(this).parents('div[class*=control-group]').removeClass('error').addClass('success');
                    estado = estado && true;
                }
            }
        });
        return estado;
    };
})( jQuery );

(function( $ ) {
    $.fn.combo = function() {
        var estado = true;
        var first = true;
        this.each (function() {
            if ( $(this).val() == 0 ||$(this).val() == ''||$(this).val()==null) {
//                $(this).addClass('ui-state-error ui-icon-alert');
                $(this).parents('div[class*=control-group]').removeClass('success').addClass('error');
                if(first) {
                    $(this).focus();
                    first = false;
                }
                estado = estado && false;
            }else {
//                $(this).removeClass('ui-state-error ui-icon-alert');
                $(this).parents('div[class*=control-group]').removeClass('error').addClass('success');
                estado = estado && true;
            }
        });
        return estado;
    };
})( jQuery );

(function( $ ) {
    $.fn.email = function() {
        var estado = true;
        var first = true;
        var filter = /[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
        this.each (function() {
            if ( $.trim( $(this).val())!='' && filter.test($(this).val()) ) {
                $(this).parents('div[class*=control-group]').removeClass('error').addClass('success');
                estado = estado && true;
            }else {
                $(this).parents('div[class*=control-group]').removeClass('success').addClass('error');
                if(first) {
                    $(this).focus();
                    first = false;
                }
                estado = estado && false;
            }
        });        
        return estado;
    };
})( jQuery );

(function( $ ){
	  $.fn.size = function(tam) {
	    if ( $(this).val().length<tam ||$(this).val().length>tam ) {
	        $(this).addClass('ui-state-error ui-icon-alert');
	        $(this).focus();
	        return false;
	    }else {
	        $(this).removeClass('ui-state-error ui-icon-alert')
	        return true;
	    }
	  };
	})( jQuery );
(function( $ ){
	$.fn.numerico = function() {
		var az = "abcdefghijklmn�opqrstuvwxyzñ";
		az += az.toUpperCase();
		az += "!@#$%^&*()+=[]\\\';,/{}|\":<>?~`- ";	
		  	
		return this.each (function() {
			$(this).keypress(function (e){
				if (!e.charCode) k = String.fromCharCode(e.which);
				else k = String.fromCharCode(e.charCode);
										
				if (az.indexOf(k) != -1) e.preventDefault();
				if (e.ctrlKey&&k=='v') e.preventDefault();
									
			});
						
			/*$(this).bind('contextmenu',function () {return false});*/
		});	 
	};
})( jQuery );
(function( $ ){
	$.fn.real = function() {
		var counterNumberPointWrite = 1;
        var az = "abcdefghijklmnñopqrstuvwxyz";
		az += az.toUpperCase();
		az += "!@#$%^&*()+=[]\\\';,/{}|\":<>?~`-´ºª·¬¿Ç¡¨_ ";
 	
		return this.each (function() {
			$(this).keypress(function (e) {				
				if (!e.charCode) k = String.fromCharCode(e.which);
				else k = String.fromCharCode(e.charCode);
										
				if (az.indexOf(k) != -1) e.preventDefault();
				if (e.ctrlKey&&k=='v') e.preventDefault();
                
                if (e.keyCode == 46) {
					var counter = 1;
					var character = $(this).val();				
					s = character.split('');
					for (var i=0; i < s.length; i++) {
						if(s[i] == ".")
							counter ++;
					}
					counterNumberPointWrite = counter;
                    if(counterNumberPointWrite > 1) {
                        e.preventDefault();
                    }
                }
									
			});
		});	 
	};
})( jQuery );
(function( $ ){
	  $.fn.setEnabled = function(estado) {
              
            $(this).attr("disabled",estado);
            return true;
	  };
	})( jQuery );
var decimales=function(numero,num){
    var pot = Math.pow(10,num); 
    return parseInt(parseFloat(numero) * pot) / pot;
}

function clearForm(formID) {
    var oForm = document.getElementById(formID);
    var elements = oForm.elements;
    
    oForm.reset();
    
    for(i=0; i<elements.length; i++) {
    
        field_type = elements[i].type.toLowerCase();
    	
        switch(field_type) {
            case "text": 
            case "password": 
            case "textarea":
            case "hidden":	
                elements[i].value = ""; 
                break;

            case "radio":
            case "checkbox":
                if (elements[i].checked) {
                    elements[i].checked = false; 
                }
                break;

            case "select-one":
            case "select-multi":
                elements[i].selectedIndex = 0;
//                elements[i].selectedIndex = -1;
                break;

            default:
                break;
        }
    }
}
(function( $ ) {
    $.fn.calendario = function(dateFormat) {
        if(dateFormat==undefined)dateFormat='dd/mm/yy';
        $(this).datepicker({
                            dateFormat:dateFormat,
                            changeMonth:true,changeYear:true,showAnim: 'scale' ,
                            showOn: 'button',
                            direction: 'right',
                            buttonImage: '/images/btn_calendar.png',
                            buttonImageOnly: true,
                            showOn: 'both',
                            buttonText: 'Seleccione la Fecha'}
                    );
        $(this).css({"cursor":"pointer"});
        $(this).next("img").css({"cursor":"pointer"});
        return true;
    };
    
   
})( jQuery );