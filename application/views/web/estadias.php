<script type="text/javascript">var url = "<?php echo base_url() ?>"</script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script type="text/javascript" src="<?php echo base_url() ?>/assets/js/gmaps.js"></script>
<script type="text/javascript" src="http://hpneo.github.io/gmaps/prettify/prettify.js"></script>
<link href='http://hpneo.github.io/gmaps/prettify/prettify.css' rel='stylesheet' type='text/css' />
<script type="text/javascript" src="<?php echo base_url() ?>assets/js/estadias.js"></script>

<style type="text/css">
    .popin{
        background:#fff;
        padding:15px;
        box-shadow: 0 0 20px #999;
        border-radius:2px;

        float: left;
        width: 75%;
    }
    #map {
        height:400px;

    }
    #filtro{
        top:0;
        right:0;
        width:200px;
    }
    .overlay{
        text-align: match-parent;
        color:#fff;
        font-size:17px;
        opacity:0.8;
        background:#4477aa;
        border:solid 3px #336699;
        border-radius:4px;
        box-shadow:2px 2px 10px #333;
        text-shadow:1px 1px 1px #666;
        padding:0 4px;
    }
    .overlay_arrow{
        left:50%;
        margin-left:-18px;
        width:0;
        height:0;
        position:absolute;
    }
    .overlay_arrow.above{
        bottom:-15px;
        border-left:16px solid transparent;
        border-right:16px solid transparent;
        border-top:16px solid #336699;
    }
</style> 
<script type="text/javascript">
    var map;
    $(document).ready(function(){
       
        $.ajax({
            type:"POST",
            url:url+'web/seleccionar_maps',
            dataType : 'json',
            success:function(json){
                // alert(json.result_id[1].latitud);
                map = new GMaps({
                    div: '#map',
                    lat: -6.488618840362275,
                    lng: -76.3645076751709,
                    enableNewStyle: true,
                    zoom: 14
                });
                map.addMarker({
                    lat: -6.486486813731826,
                    lng: -76.37927055358887,
                    icon:'http://icons.iconarchive.com/icons/deleket/mac-folders/64/3D-Studio-Max-icon.png',
                    title: 'UNSM-T',
                    click: function(e) {
                        
                    }
                });
                    
                for(i=0 ; i<json.num_rows;i++){                    
                    map.addMarker({
                        id : json.result_id[i].id,
                        lat: json.result_id[i].latitud,
                        lng: json.result_id[i].longitud,
                        icon:'http://icons.iconarchive.com/icons/deleket/sleek-xp-basic/24/Home-icon.png',
                        title: json.result_id[i].nombre,
                        click: function(e) {
                            hoteles(this.id);
                        }
                    });
                }
            }
        });
    });
    
</script>
<div class="container">
    <div class="navbar-inner">
        <div class="page-header">
            <h3>ESTADÍAS</h3>
            <div><strong>Nota: Los precios son referenciales, costo por persona y orientados a grupos</strong></div>
                <div class="page">
                    <a href="javascript:void"  onclick="window.open('<?php echo base_url() ?>assets/docs/LISTADO DE HOTELES OFICIAL.xlsx')" class="btn btn-primary">Descargar Lista Completa de Hoteles</a>
                </div>
            <h4 style="text-align: right; margin-top: -40px">Busque donde alojarse:</h4>
        </div>
        <div class="row-fluid">         
            <div id="contenido">
                
                <div class="popin">
                    <div id="map"></div>
                </div>
                <div id="filtro" class="span4 text-center">
                    <div>
                        <select id="sel_hosp">
                            <option value="0">---</option>
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
                    <div id="load_hotel" style="width: 230px; max-height: 350px; overflow-y: auto">

                    </div>
                </div>
            </div>
            <div class="span5 text-center">

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
        </div>
    </div>
</div>