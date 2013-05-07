
!function ($) {
    $(function(){
        $("#submit").click(function(){
            var bval = true;
            bval = bval && $( "#nombre" ).required();
            bval = bval && $( "#email" ).email();
            bval = bval && $( "#asunto" ).required();
            bval = bval && $( "#text" ).required();
            if(bval) {
                $("#frmContacto").submit();
            }
        });
    });
}(window.jQuery);