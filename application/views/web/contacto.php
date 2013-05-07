<div class="container">
    <div class="navbar-inner">
        <div class="page-header">
            <h2>CONTÁCTENOS</h2>
            <p class="text-justify">Si tienes alguna duda o deseas informarte más sobre el XXI CONEISC Tarapoto 2013 comuníquese con nosotros.</p>
        </div>
        <div class="row-fluid">
            <div class="span1"></div>
            <div class="span3" id="contact">
                <h4>Envíenos un Mensaje</h4>
                <?php
                    $frm = array (
                        'id' => 'frmContacto',
                        'class' => 'form-inline'
                    );  
                    $publickey = '6LdkseASAAAAAMSTcqJDLii37ZVm47H8-vzQshzd'; 
                 ?>
                 <?php echo form_open(base_url() . 'web/contactenoss',$frm) ?>
                    <div class="control-group">
                        <?php if(validation_errors()) { ?>
                        <div class="alert alert-error"><?php echo validation_errors(); ?></div>
                        <?php } ?>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Nombre:</label>
                        <div class="controls">
                            <input type="text" class="input-xlarge" id="nombre" name="nombre" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Email:</label>
                        <div class="controls">
                            <input type="email" class="input-xlarge" id="email" name="email" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Asunto:</label>
                        <div class="controls">
                            <input type="text" class="input-xlarge" id="asunto" name="asunto" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Mensaje:</label>
                        <div class="controls">
                            <textarea class="input-xlarge" id="text" name="text" rows="5" cols="0"></textarea>
                        </div>
                    </div>
                    <?php echo recaptcha_get_html($publickey) ?><br />
                    <input type="hidden" name="registro" value="si" />
                    <div class="controls">
                        <input type="submit" class="boton_registro btn btn-primary" value="Enviar" id="submit" />
                        <button type="reset" class="btn" name="reset" id="reset">Cancelar</button>
                    </div>
                <?php echo form_close() ?>
            </div>
            <div class="span1"></div>
            <div class="span6">
                <h4>Estamos ubicados en</h4>
                <iframe id="map_coneisc" width="100%" height="500" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.es/maps?f=q&amp;source=s_q&amp;hl=es&amp;geocode=&amp;q=unsm+&amp;aq=&amp;sll=-6.487350,-76.367950&amp;sspn=0.012100,0.021100&amp;ie=UTF8&amp;hq=unsm&amp;hnear=&amp;filter=0&amp;update=1&amp;ll=-6.486454,-76.378922&amp;spn=0.012089,0.021136&amp;t=m&amp;z=14&amp;iwloc=A&amp;cid=15027587430505972592&amp;output=embed">
                </iframe><br />
                <small>
                    <a target="_blank" href="http://maps.google.es/maps?f=q&amp;source=embed&amp;hl=es&amp;geocode=&amp;q=unsm+&amp;aq=&amp;sll=-6.487350,-76.367950&amp;sspn=0.012100,0.021100&amp;ie=UTF8&amp;hq=unsm&amp;hnear=&amp;filter=0&amp;update=1&amp;ll=-6.486454,-76.378922&amp;spn=0.012089,0.021136&amp;t=m&amp;z=14&amp;iwloc=A&amp;cid=15027587430505972592">Ver mapa más grande</a>
                </small>
            </div>
            <div class="span1"></div>
        </div><br/>
    </div>
</div>