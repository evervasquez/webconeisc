<script type="text/javascript">var url = "<?php echo base_url() ?>"</script>
<link href='http://fonts.googleapis.com/css?family=Convergence|Bitter|Droid+Sans' rel='stylesheet' type='text/css' />
<script type="text/javascript" src="<?php echo base_url() ?>assets/js/estadias.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script type="text/javascript" src="https://raw.github.com/HPNeo/gmaps/master/gmaps.js"></script>
<style type="text/css">
    .popin{
        background:#fff;
        padding:15px;
        box-shadow: 0 0 20px #999;
        border-radius:2px;
    }
    #map,
    #panorama {
        height:400px;
        background:#6699cc;
    }
</style> 
<script type="text/javascript">
    $(document).ready(function(){
        map = new GMaps({
            div: '#map',
            lat: -6.480602373437085,
            lng: -76.37369155883789
        });
        map.addMarker({
            lat: -6.486316251211688,
            lng: -76.3789701461792,
            title: 'UNSM-T',
            click: function(e) {
                alert('eres gay');
            }
        });
        
        map.addMarker({
            lat: -6.4778733343428625,
            lng: -76.35929346084595,
            title: 'UNSM-T',
            click: function(e) {
                alert('eres doblemente gay');
            }
        });
        //rutas
        $('#start_travel').click(function(e){
            e.preventDefault();
            map.travelRoute({
                origin: [-6.486316251211688, -76.3789701461792],
                destination: [-6.4778733343428625, -76.35929346084595],
                travelMode: 'driving',
                step: function(e){
                    $('#instructions').append('<li>'+e.instructions+'</li>');
                    $('#instructions li:eq('+e.step_number+')').delay(450*e.step_number).fadeIn(200, function(){
                        map.setCenter(e.end_location.lat(), e.end_location.lng());
                        map.drawPolyline({
                            path: e.path,
                            strokeColor: '#131540',
                            strokeOpacity: 0.6,
                            strokeWeight: 6
                        });
                    });
                }
            });
        });
    });
</script>
<div class="container">
    <div class="navbar-inner">
        <div class="page-header">
            <h3>ESTADÍAS</h3>
        </div>

        <div class="row-fluid">
            <div class="span1"></div>
            <div class="row">
                <a href="#" id="start_travel" class="btn btn-primary">start</a>

            </div>
            <div class="popin">
                <div id="map"></div>
            </div>
            <div class="span4 text-center">
                <h4>Busque donde alojarse:</h4>
                <div>
                    <select id="sel_hosp">
                        <option>---</option>
                        <option value="1">Por Costo</option>
                        <option value="2">Por Categoria</option>
                    </select>
                </div>
                <div>
                    <select id="sel_costo">
                        <option value="0">---</option>
                        <option value="10-15">S/.10 - S/.15</option>
                        <option value="15-25">S/.15 - S/.25</option>
                        <option value="25-35">S/.25 - S/.35</option>
                        <option value="35-50">S/.35 - S/.50</option>
                        <option value="50-60">S/.50 - S/.60</option>
                        <option value="60-80">S/.60 - S/.80</option>
                    </select>
                </div>
                <div>
                    <select id="sel_categoria">
                        <option>---</option>
                        <option value="Hospedaje">Hospedaje</option>
                        <option value="Hostal">Hostal</option>
                        <option value="Alojamiento">Alojamiento</option>
                        <option value="Hotel">Hotel</option>
                        <option value="Hosteria">Hosteria</option>
                    </select>
                </div>
                <div><strong>Nota: Los precios son referenciales, costo por persona y orientados a grupos</strong></div>
                <br/>
                <div class="page">
                    <a href="javascript:void"  onclick="window.open('<?php echo base_url() ?>assets/docs/LISTADO DE HOTELES OFICIAL.xlsx')" class="btn btn-primary">Descargar Lista Completa de Hoteles</a>
                </div>
            </div>
            <div class="span5 text-center">
                <div id="load_hotel" style="margin:0 auto;max-height: 350px; overflow-y: auto">

                </div>
                <!-- Modal -->
                <div id="modal" class="hide modal">
                    <div class="modal-header">
                        <button type="button" class="close close_modal">×</button>
                        <h3 id="myModalLabel">Información</h3>
                    </div>
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary close_modal">Ok</button>
                    </div>
                    <ul id="instructions">
                    </ul>
                </div>
                <div id="fondooscuro"></div>
                <br/>
            </div>
            <div class="span2"></div>
        </div>
    </div>
</div>