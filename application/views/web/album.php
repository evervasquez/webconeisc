<script src="<?php echo base_url()?>assets/js/sexylightbox.js" type="text/javascript"></script>
<script src="<?php echo base_url()?>assets/js/jquery.easing.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-migrate-1.0.0.js"></script>
<script type="text/javascript">
    $(function(){
        SexyLightbox.initialize({color:'blanco', dir: 'sexyimages'});
    });
</script>
<link href="<?php echo base_url()?>assets/css/sexylightbox.css" rel="stylesheet" />
<div class="container">
    <div class="navbar-inner">  
        <div class="page-header">
            <h3>Album <span><a href="javascript:history.back(1)" style="float: right" class="btn btn-primary">Volver a la Lista de Álbumes</a></span></h3>
        </div>
        <div class="text-center">
<?php

echo $var;

?>
        </div>
    </div>
</div>
