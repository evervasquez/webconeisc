<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>XXI CONEISC - Tarapoto</title>
        <meta name="keywords" content="xxi, congreso nacional, ingenieria de sistemas y computacion, coneisc, tarapoto 2013" />
        <meta name="description" content="XXI CONEISC 2013 Tarapoto Peru" >
        <meta name="viewport" content="width=device-width">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="<?php echo base_url()?>assets/img/favicon.ico" type="image/x-icon" />
        
        <link rel="stylesheet" href="<?php echo base_url()?>assets/css/bootstrap.css">
        <link rel="stylesheet" href="<?php echo base_url()?>assets/css/jquery-ui.custom.css">
        <link rel="stylesheet" href="<?php echo base_url()?>assets/css/bootstrap-responsive.css">
        <link rel="stylesheet" href="<?php echo base_url()?>assets/css/fanbox.css" type="text/css" media="screen">
        <div id='facebook_box' class="slide_likebox">
            <img src='<?php echo base_url()?>assets/img/fb_tab.png' class="img_fanbox"/>
            <div class="div_fanbox" style='background: #3c5a98;'>
                <span class="fanbox_fb">
                    <div class='likeboxwrap'>
                        <iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fxxiconeisc&amp;width=238&amp;colorscheme=light&amp;connections=12&amp;stream=false&amp;header=false&amp;height=350" scrolling="no" frameborder="0" id="frame_fb">
                        </iframe>
                    </div>
                </span>
            </div>
        </div>
        <script src="<?php echo base_url()?>assets/js/fanbox_init.js"></script>
        <div id='twitter_box' class="slide_likebox2">
            <img src='<?php echo base_url()?>assets/img/tw_tab.png'  class="img_fanbox"/>
            <div class="div_fanbox" style='background: #00a0e8;'>
                <span>
                    <div class='likeboxwrap'>
                        <div id="twitterfanbox">
                               <script type="text/javascript">fanbox_init("coneisc");</script>
                        </div>      
                    </div>
                </span>
            </div>
        </div>
        <link rel="stylesheet" href="<?php echo base_url()?>assets/css/main.css">
        <script src="<?php echo base_url()?>assets/js/jquery.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
        <script src="<?php echo base_url()?>assets/js/required.js"></script>
    </head>
    <body class="primary">
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <div class="container">
            <section id="navbar">
                <div class="page">
                    <a href="http://www.coneisc.pe"><img src="<?php echo base_url()?>assets/img/logo.png" /></a>
                </div>
                <div class="navbar">
                    <div class="navbar-inner nvinner">
                        <div class="container" style="width: auto;">
                            <div class="pull-left">
                                <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="nav-collapse collapse">
                                <ul class="nav">
                                    <li id="li_inicio"><a href="<?php echo base_url() ?>"><i class="icon-home"></i> Inicio</a></li>
                                    <li id="li_coneisc" class="dropdown">
                                        <a href="javascript:void" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-ok"></i> XXI Coneisc<b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>web/presentacion"><i class="icon-forward"></i> Presentación</a></li>
                                            <li><a href="<?php echo base_url() ?>web/cronograma"><i class="icon-calendar"></i> Cronograma</a></li>
                                        </ul>
                                    </li>
                                    <li id="li_nosotros" class="dropdown">
                                        <a href="javascript:void" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-thumbs-up"></i> Nosotros<b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>web/mision_vision"><i class="icon-globe"></i> Misión y Visión</a></li>
                                            <li><a href="<?php echo base_url() ?>web/comision_organizadora"><i class="icon-user"></i> Comisión Organizadora</a></li>
                                        </ul>
                                    </li>
                                    <li id="li_papers"><a href="<?php echo base_url() ?>web/papers"><i class="icon-briefcase"></i> Papers</a></li>
                                    <li><a href="#"><i class="icon-tasks"></i> Eventos</a></li>
                                    <li id="li_inscripcion"><a href="<?php echo base_url() ?>inscripcion"><i class="icon-pencil"></i> Inscripción</a></li>
                                    <li id="li_costos"><a href="<?php echo base_url() ?>web/costos_vida"><i class="icon-shopping-cart"></i> Costos de Vida</a></li>
                                    <li><a href="#"><i class="icon-picture"></i> Galería</a></li>
                                    <li id="li_contacto"><a href="<?php echo base_url() ?>web/contactenos"><i class="icon-envelope"></i> Contáctenos</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <?php  include_once $contenido; ?>

            <footer>
                <h4>XXI CONEISC TARAPOTO 2013</h4>
            </footer>
        </div>

        <?php 
        echo '<script>
            !function ($) {
                $(function(){
                    $("#'. $active .'").addClass("active")
                })
            }(window.jQuery)
            </script>';
        ?>
        <script>
            jQuery.noConflict();
            jQuery(function (){jQuery(".slide_likebox").hover(function(){jQuery(".slide_likebox").stop(true, false).animate({right:"0"},"medium")},
                function(){jQuery(".slide_likebox").stop(true, false).animate({right:"-250"},"medium");},500);return false;});
            jQuery(function (){
                jQuery(".slide_likebox2").hover(function(){
                    jQuery(".slide_likebox2").stop(true, false).animate({right:"0"},"medium").css('z-index','1005');
                },
                function(){
                    jQuery(".slide_likebox2").stop(true, false).animate({right:"-250"},"medium").css('z-index','1000');
                },500);return false;
            });
        </script>
        <script src="<?php echo base_url()?>assets/js/bootstrap.js"></script>
        <script>
        !function ($) {
            $(function(){
            // carousel demo
            $('#myCarousel').carousel()
            })
        }(window.jQuery)
        </script>

        <!-- Google Analytics -->
        <script>
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-39943238-1']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
        </script>
    </body>
</html>
