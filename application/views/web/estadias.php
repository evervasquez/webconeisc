<script type="text/javascript">var url = "<?php echo base_url() ?>"</script>
<script type="text/javascript" src="<?php echo base_url() ?>assets/js/estadias.js"></script>
<div class="container">
    <div class="navbar-inner">
        <div class="page-header">
            <h3>ESTADÍAS</h3>
        </div>
        
        <div class="row-fluid">
            <div class="span1"></div>
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
                <div><strong>Nota: Los precios son referenciales y orientados a grupos</strong></div>
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
                </div>
                <div id="fondooscuro"></div>
                <br/>
            </div>
            <div class="span2"></div>
        </div>
    </div>
</div>