<?php

if (!defined('BASEPATH'))die();

class inscripcion extends Main_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('inscripcion_model');
    }

    public function index() {
        $data['active'] = 'li_inscripcion';
        $data['contenido'] = 'web/inscripcion/index.php';
        $this->load->view('index', $data);
    }

    public function validaInscrito() {
        if(isset($_POST['busqueda'])&& isset($_POST['parametro'])){
            $busqueda=$_POST['busqueda'];
            $parametro=$_POST['parametro'];
            $caracteres_prohibidos = array("'","/","<",">",";",'"');    
            $parametro = str_replace($caracteres_prohibidos,"",$parametro);
            if(is_numeric($busqueda) && $busqueda>0 && $busqueda<3){
                if($busqueda==1){
                    $data = array('email'=>$parametro);
                }else if($busqueda==2){
                    $data = array('dni'=>$parametro);
                }else{
                    $this->index();
                }
                $inscripcion = $this->inscripcion_model->getInscripcion($data);
                
                if($inscripcion->num_rows()>0){
                    foreach ($inscripcion->result_array() as $row) {
                        switch ($row['estado']){
                            case 0: echo 'Aun no confirmó su email...<a href="#">Reenviar mensaje de verificación</a>';break;
                            case 1: echo 'Su inscripción está siendo verificada.Gracias!';break;
                            case 2: echo 'Usted ya forma parte del XXI Coneisc';break;
                            case 3: echo 'Si inscripción tiene un inconveniente';break;
                            case 4: echo 'Su inscripción fue rechazada por irregularidad';break;
                        }
                    }exit;
                }else{
                    echo "No se encuentra inscrito aún: <a href='".base_url()."inscripcion/nuevo'>Inscríbase Aquí</a>";
                }
            }else{
                $this->index();
            }
        }else{
            $this->index();
        }
    }

    public function nuevo() {
        $this->load->model('departamento_model');
        $departamentos = $this->departamento_model->getDepartamentos();
        $combo = "<select name='iddepartamento' id='iddepartamento' class='span9'>";
        $combo .= "<option value=''> - - Seleccione - -</option>";
        foreach ($departamentos->result_array() as $row) {
            $combo.="<option value='{$row['iddepartamento']}'>{$row['descripcion']}</option>";
        }
        $combo .= "<option value='26'>Otro...</option>";
        $combo .= "</select>";
        $data['departamento'] = $combo;
        $data['active'] = 'li_inscripcion';
        $data['contenido'] = 'web/inscripcion/nuevo.php';
        $this->load->view('index', $data);
    }
    
    public function getInstituciones(){
        if(isset($_POST['iddepartamento'])){
            $this->load->model('institucion_model');
            $instituciones = $this->institucion_model->getInstituciones($_POST);
            $combo = "<option value=''> - - Seleccione - -</option>";
            foreach ($instituciones->result_array() as $row) {
                $combo.="<option value='{$row['idinstitucion']}'>{$row['descripcion']}</option>";
            }
            echo $combo;
        }else{
            $this->index();
        }
    }
    
    public function validar(){
        if(isset($_POST['dni'])){
            $dni = $_POST['dni'];
            if(is_numeric($dni)){
                $inscripcion = $this->inscripcion_model->getInscripcion($_POST);
                if($inscripcion->num_rows()>0){
                    echo 'Ya existe registrado su numero de dni';
                }else{
                    echo 'Correcto';
                }
            }
        }else if(isset($_POST['email'])){
            $email = $_POST['email'];
            $caracteres_prohibidos = array("'","/","<",">",";",'"');    
            $email = str_replace($caracteres_prohibidos,"",$email);
            $inscripcion = $this->inscripcion_model->getInscripcion(array('email'=>$email));
            if($inscripcion->num_rows()>0){
                echo 'Ya existe registrado su email';
            }else{
                echo 'Correcto';
            }
        }else{
            $this->index();
        }
    }
    
    public function guardar(){
        if(isset($_POST)){
            $inscripcion = $this->inscripcion_model->insertInscripcion($_POST);
            if($inscripcion->num_rows()>0){
                foreach ($inscripcion->result_array() as $f) {
                    //Obtenemos los datos
                    $idmd5=$f['idmd5'];
                    $email=$f['email'];
                    $usuario=$f['nombres'].' '.$f['apellidos'];
                    $cuerpo = "<p>El usuario «{$usuario}» del CONEISC (probablemente tú mismo)<br/>
                                    ha registrado esta dirección e-mail como suya.<br/><br/>

                                    Para confirmar que esta dirección e-mail está realmente<br/>
                                    asociada a esa cuenta y activar el envío de e-mails<br/>
                                    desde CONEISC.PE, sigue este enlace:<br/><br/>

                                    <a href='http://{$_SERVER['HTTP_HOST']}/inscripcion/confirmarEmail?id=$idmd5' target='_blank'>http://{$_SERVER['HTTP_HOST']}/inscripcion/confirmarEmail?id=$idmd5</a>  <br/><br/>

                                    Si la cuenta no es tuya, *no* sigas el enlace.

                                </p>";
                    //Cargamos la librería
                    $this->load->library('email');
                    //Configuramos 
                    $config['useragent'] = 'CONEISC';
                    $config['mailtype'] = 'html';
                    $this->email->initialize($config);
                    //llenamos datos
                    $this->email->from('WWW.CONEISC.PE', 'CONEISC');
                    $this->email->to($email);
                    $this->email->subject('Confirmación de la dirección de e-mail registrada en Coneisc.pe');
                    $this->email->message($cuerpo);
                    if($this->email->send()){
                        $data['mensaje'] = "Usted fue registrado con éxito en el CONEISC. Por favor revise su correo eléctronico para continuar con la inscripcion";
                        $data['active'] = 'li_inscripcion';
                        $data['contenido'] = 'web/inscripcion/mensaje.php';
                        $this->load->view('index', $data);
                    }else{
                        $this->email->send();
                        $data['mensaje'] = $this->email->print_debugger();
                        $data['active'] = 'li_inscripcion';
                        $data['contenido'] = 'web/inscripcion/mensaje.php';
                        $this->load->view('index', $data);
                    }
                }
            }
        }else{
            $this->index();
        }
    }
    
    public function confirmarEmail(){
        if(isset($_GET['id'])){
            //Validamos que el estado sea 0
            $datos = $this->inscripcion_model->getInscripcion(array('idmd5'=>$_GET['id']));
            if($datos->num_rows()>0){
                foreach ($datos->result_array() as $row) {
                    if($row['estado']==0){
                        //Actualizamos si es el estado es 0
                        $inscripcion = $this->inscripcion_model->updateInscripcion(array('estado'=>'1'),array('idmd5'=>$_GET['id']));
                        if($inscripcion){
                            $this->paginaBlanco("Tu dirección e-mail ha sido confirmada. Dentro de las proximas 48 horas le estaremos enviando un mensaje confirmando la inscripcion al coneisc.");
                        }else{
                            $this->index();
                        }
                    }else{
                        $this->paginaBlanco("Tu dirección e-mail ha sido confirmada.");
                        $data['mensaje'] = "Tu dirección e-mail ha sido confirmada.";
                        $data['active'] = 'li_inscripcion';
                        $data['contenido'] = 'web/inscripcion/mensaje.php';
                        $this->load->view('index', $data);
                    }
                }exit;
            }else{
                $this->index();
            }
        }else{
            $this->index();
        }
    }
    
    public function paginaBlanco($mensaje){
        $data['mensaje'] = $mensaje;
        $data['active'] = 'li_inscripcion';
        $data['contenido'] = 'web/inscripcion/mensaje.php';
        $this->load->view('index', $data);
    }
    
}
