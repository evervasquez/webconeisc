<script type="text/javascript">var url = "<?php echo base_url() ?>"</script>
<script src="<?php echo base_url() ?>assets/js/inscripcion/inscripcion.js" type="text/javascript"></script>
<div class="container">
    <div class="navbar-inner">  

        <div id="registration" class="registration-box workflow-box social">
            <header>
                <h3>Registrar</h3>
            </header>
            <div class="row-fluid">
                <section class="form-container">
                    <div class="span1"></div>
                    <div class="span6">
                        <form id="form" method="post" data-method="standard"  class="form-horizontal" action="<?php echo base_url() ?>inscripcion/guardar">
                            <fieldset>
                                <legend>Datos personales</legend>
                                <div class="control-group">
                                    <label for="idtipo_inscripcion" class="control-label">Tipo de Participante:</label>
                                    <div class="controls">
                                        <select name="idtipo_inscripcion" id="idtipo_inscripcion" class="span11">
                                            <option value=""> - - Seleccione - -</option>
                                            <option value="1">ESTUDIANTE</option>
                                            <option value="2">PROFESIONAL</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="nombres" class="control-label" >Nombres:</label>
                                    <div class="controls">
                                        <input type="text" id="nombres" name="nombres" class="span11" maxlength="45" <?php if (isset($nombres)) {?> class="border-green" value="<?php echo $nombres ?>" <?php } ?> style="text-transform: uppercase"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="apellidos" class="control-label">Apellidos:</label>
                                    <div class="controls">
                                        <input type="text" id="apellidos" name="apellidos" class="span11" maxlength="80" <?php if (isset($apellidos)) {?> value="<?php echo $apellidos ?>" <?php } ?> style="text-transform: uppercase"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="email" class="control-label">E-mail:</label>
                                    <div class="controls">
                                        <input type="text" id="email" name="email" class="span11" value="<?php echo $email?>" maxlength="45" style="font-size: 20px;font-weight: bold"/>
                                        <div id="loadEmail" style="max-width: 285px;min-height: 20px; margin: 0;"></div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="confirma_email" class="control-label">Confirma E-mail:</label>
                                    <div class="controls">
                                        <input type="text" id="confirma_email" class="span11" maxlength="45" style="font-size: 20px;font-weight: bold"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="dni" class="control-label">DNI:</label>
                                    <div class="controls">
                                        <input type="text" id="dni" name="dni" class="span11" maxlength="8"/>
                                        <div id="loadDni" style="max-width:285px;min-height: 20px; margin: 0;"></div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="telefono" class="control-label">Telefono/Cel:</label>
                                    <div class="controls">
                                        <input type="text" id="telefono" name="telefono" class="span11" maxlength="40"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Sexo:</label>
                                    <div class="controls">
                                        
                                            <?php if (isset($sexo)) {
                                                if($sexo=='male'){  ?>
                                                <label class="radio">
                                                    <input type="radio" id="sexoM" checked="checked" name="sexo" value="M" />Masculino
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" id="sexoF" name="sexo" value="F" />Femenino
                                                </label>
                                                    <?php } else { ?>
                                                <label class="radio">
                                                    <input type="radio" id="sexoM" name="sexo" value="M" />Masculino
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" id="sexoF" checked="checked" name="sexo" value="F" />Femenino
                                                </label>
                                                    <?php } ?>
                                            <?php } else { ?>
                                                <label class="radio">
                                                    <input type="radio" id="sexoM" name="sexo" value="M" />Masculino
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" id="sexoF" name="sexo" value="F" />Femenino
                                                </label>
                                            <?php } ?>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="iddepartamento" class="control-label">Departamento:</label>
                                    <div class="controls">
                                        <?php echo $departamento ?>
                                    </div>
                                </div>
                                <div id="id_idinstitucion_group" class="control-group">
                                    <label for="idinstitucion" class="control-label">Universidad:</label>
                                    <div class="controls">
                                        <select name="idinstitucion" id="idinstitucion" class="span11">
                                            <option value=""> - - Seleccione - -</option>
                                        </select>
                                    </div>
                                    <span class="controls" id="loadInstitucion"><img src="<?php echo base_url() ?>assets/img/load.gif" /></span>
                                </div>
                                <div id="id_institucion_group" class="control-group">
                                    <label for="institucion" class="control-label">Especifique Institución:</label>
                                    <div class="controls">
                                        <input type="text" id="institucion" name="institucion" class="span11"/>
                                    </div>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>Datos de Operacion</legend>
                                <div class="control-group">
                                    <label for="tipo_pago" class="control-label">Modalidad de Pago:</label>
                                    <div class="controls">
                                        <select name="tipo_pago" id="tipo_pago" class="span11">
                                            <option value=""> - - Seleccione - -</option>
                                            <option value="1">VENTANILLA</option>
                                            <option value="2">CAJERO AUTOMATICO</option>
                                            <option value="3">AGENTE BBVA</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="fecha_deposito" class="control-label">Fecha de Pago:</label>
                                    <div class="controls">
                                        <input type="text" id="fecha_deposito" name="fecha_deposito" class="span11" readonly="readonly" style="cursor: pointer"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="nro_operacion" class="control-label">N° Transacción:</label>
                                    <div class="controls">
                                        <input type="text" id="nro_operacion" name="nro_operacion" class="span11"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="monto" class="control-label">Monto:</label>
                                    <div class="controls">
                                        <select name="monto" id="monto" class="span11">
                                            <option value=""> - - Seleccione - -</option>
                                            <option value="95">S/. 95.00</option>
                                            <option value="100">S/. 100.00</option>
                                            <option value="115">S/. 115.00</option>
                                            <option value="125">S/. 125.00</option>
                                            <option value="135">S/. 135.00</option>
                                        </select>
                                    </div>
                                </div>
                            </fieldset>
                            <div class="form-actions">
                                <div class="buttons">
                                    <button class="btn btn-primary" type="button" id="registrar">Registrar</button>
                                    <a class="cancel btn" href="<?php echo base_url() ?>inscripcion">Cancelar</a>
                                </div>
                            </div>
                            <input id="id_token" type="hidden" class=" " value="2815c719c46e47c66" name="token" />
                            <input type="hidden" name="plan" value="5_users">
                        </form>
                    </div>
                    <div class="span4">
                        <div class="sidebar">
                            <div class="social-box">
                                <h4>Puede registrarse también con:</h4>
                                <ul id="social-login-forms">
                                    <li>
                                        <form class="connect-button" name="login" method="POST" action="/social/google/redirect/">
                                            <input type="hidden" name="next" value="/account/dispatch/">
                                            <button type="submit" class="aui-button aui-style google-button">
                                                Google
                                            </button>
                                        </form>
                                    </li>
                                    <li>
                                        <form class="connect-button" name="login" method="POST" action="<?php echo base_url() ?>social/facebook">
                                            <input type="hidden" name="next" value="/account/dispatch/">
                                            <button type="submit" class="aui-button aui-style facebook-button">
                                                Facebook
                                            </button>
                                        </form>
                                    </li>
                                    <li>
                                        <form class="connect-button" name="login" method="POST" action="<?php echo base_url() ?>tweet_test/auth">
                                            <input type="hidden" name="next" value="/account/dispatch/">
                                            <button type="submit" class="aui-button aui-style twitter-button">
                                                Twitter
                                            </button>
                                        </form>
                                    </li>
                                    <li>
                                        <form class="connect-button" name="login" method="POST" action="/social/github/redirect/">

                                            <input type="hidden" name="next" value="/account/dispatch/">
                                            <button type="submit" class="aui-button aui-style github-button">
                                                GitHub
                                            </button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="span1"></div>
                </section>
            </div>
        </div>
    </div>
</div>