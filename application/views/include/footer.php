
            <div class="modal-footer">
                <h4>XXI CONEISC TARAPOTO 2013</h4>
            </div>
        </div>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
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
