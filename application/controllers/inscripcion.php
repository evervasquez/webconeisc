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
        if(isset($_POST['email'])){
            $email=$_POST['email'];
            $caracteres_prohibidos = array("'","/","<",">",";",'"');    
            $email = str_replace($caracteres_prohibidos,"",$email);
            $data = array('email'=>$email);
            $inscripcion = $this->inscripcion_model->getInscripcion($data);
            if($inscripcion->num_rows()>0){
                foreach ($inscripcion->result_array() as $row) {
                    switch ($row['estado']){
                        case 0: echo 'Aun no confirmó su email...<a href="#" onclick="enviarEmail(\''.$email.'\')">Reenviar mensaje de verificación</a>';break;
                        case 1: echo 'Su inscripción está en proceso de verificación. Gracias!';break;
                        case 2: echo 'Usted ya forma parte del XXI Coneisc. Te esperamos!';break;
                        case 3: echo 'Su inscripción tiene un inconveniente. Se le ha enviado un correo con los detalles';break;
                        case 4: echo 'Su inscripción fue rechazada por irregularidad. Comuníquese al Telef. 042 525688';break;
                    }
                }exit;
            }else{
                echo "nuevo";
            }
        }else{
            $this->index();
        }
    }

    public function nuevo() {
        if(isset($_POST['email'])){
            $this->load->model('departamento_model');
            $departamentos = $this->departamento_model->getDepartamentos();
            $combo = "<select name='iddepartamento' id='iddepartamento' class='span10'>";
            $combo .= "<option value=''> - - Seleccione - -</option>";
            foreach ($departamentos->result_array() as $row) {
                $combo.="<option value='{$row['iddepartamento']}'>{$row['descripcion']}</option>";
            }
            $combo .= "<option value='26'>Otro...</option>";
            $combo .= "</select>";
            $data['email'] = $_POST['email'];
            $data['departamento'] = $combo;
            $data['active'] = 'li_inscripcion';
            $data['contenido'] = 'web/inscripcion/nuevo.php';
            $this->load->view('index', $data);
        }else{
            $this->index();
        }
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
            }else{
                echo 'Datos numericos';
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
        }else if(isset($_POST['nro_operacion'])){
            $nro_operacion = $_POST['nro_operacion'];
            $caracteres_prohibidos = array("'","/","<",">",";",'"');    
            $nro_operacion = str_replace($caracteres_prohibidos,"",$nro_operacion);
            $inscripcion = $this->inscripcion_model->getInscripcion(array('nro_operacion'=>$nro_operacion));
            if($inscripcion->num_rows()>0){
                echo 'Ya existe registrado su N° de transaccion';
            }else{
                echo 'Correcto';
            }
        }else{
            $this->index();
        }
    }
    
    public function guardar(){
        if(isset($_POST)){
            $resultado = $this->inscripcion_model->insertInscripcion($_POST);
//            print_r($resultado);exit;
            if($resultado['estado']==1){
                $inscripcion = $resultado['data'];
                if($inscripcion->num_rows()>0){
                    foreach ($inscripcion->result_array() as $f) {
                        //Obtenemos los datos
                        $idmd5=$f['idmd5'];
                        $email=$f['email'];
                        $usuario=$f['nombres'].' '.$f['apellidos'];
                        $cuerpo = "<p>El usuario «{$usuario}» del CONEISC (probablemente tú mismo)<br/>
                                        ha registrado esta dirección e-mail como suya.<br/><br/>

                                        Para confirmar su registro y que esta dirección e-mail <br/>
                                        está realmente asociada a esta cuenta, sigue el siguiente enlace:<br/><br/>

                                        <a href='http://{$_SERVER['HTTP_HOST']}/inscripcion/confirmarEmail/$idmd5' target='_blank'>http://{$_SERVER['HTTP_HOST']}/inscripcion/confirmarEmail/$idmd5</a>  <br/><br/>
                                        <br/>   
                                        Atentamente.
                                        <br/>
                                        XXI CONEISC
                                        <br/>
                                        Tarapoto 2013 
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
                            $this->mensaje("Registro Coneisc","Por favor revise su correo eléctronico para confirmar su registro");
                        }else if($this->email->send()){
                            $this->mensaje("Registro Coneisc","Por favor revise su correo eléctronico para confirmar su registro");
                        }else{
                            $this->mensaje("Error Envio de Email","Por favor comuníquese con los organizadores informando de su error.");
                        }
                    }
                }
            }else{
                $this->mensaje("Error de Registro",$resultado['msg']);
            }
        }else{
            $this->index();
        }
    }
    
    public function confirmarEmail(){
        $id = $this->uri->segment(3);
        if(trim($id)!=''){
            //Validamos que el estado sea 0
            $datos = $this->inscripcion_model->getInscripcion(array('idmd5'=>$id));
            if($datos->num_rows()>0){
                foreach ($datos->result_array() as $row) {
                    if($row['estado']==0){
                        //Actualizamos si es el estado es 0
                        $inscripcion=$this->inscripcion_model->updateInscripcion(array('estado'=>'1'),array('idmd5'=>$id));
                        if(isset($inscripcion)){
                            $this->mensaje("Confirmar dirección e-mail","Tu dirección e-mail ha sido confirmada. Dentro de las proximas 72 horas le estaremos enviando un mensaje confirmando la inscripcion al XXI CONEISC.");
                        }else{
                            $this->index();
                        }
                    }else{
                        $this->mensaje("Confirmar dirección e-mail","Tu dirección e-mail ha sido confirmada.");
                    }
                }
            }else{
                $this->index();
            }
        }else{
            $this->index();
        }
    }
    
    public function mensaje($titulo="", $mensaje=""){
        if($titulo!="" && $mensaje!=""){
            $data['titulo'] = $titulo;
            $data['mensaje'] = $mensaje;
            $data['active'] = 'li_inscripcion';
            $data['contenido'] = 'web/inscripcion/mensaje.php';
            $this->load->view('index', $data);
        }else{
            $this->index();
        }
    }
    
    public function reenviar_email(){
        if(isset($_POST['email'])){
            //Obtenemos los datos
            $email = $_POST['email'];
            $caracteres_prohibidos = array("'","/","<",">",";",'"');    
            $email = str_replace($caracteres_prohibidos,"",$email);
            $inscripcion = $this->inscripcion_model->getInscripcion(array('email'=>$email));
            $inscripcion = $inscripcion->result_array();
            $idmd5=$inscripcion[0]['idmd5'];
            $email=$inscripcion[0]['email'];
            $usuario=$inscripcion[0]['nombres'].' '.$inscripcion[0]['apellidos'];
            $cuerpo = "<p>El usuario «{$usuario}» del CONEISC (probablemente tú mismo)<br/>
                            ha registrado esta dirección e-mail como suya.<br/><br/>

                            Para confirmar su registro y que esta dirección e-mail <br/>
                            está realmente asociada a esta cuenta, sigue el siguiente enlace:<br/><br/>

                            <a href='http://{$_SERVER['HTTP_HOST']}/inscripcion/confirmarEmail/$idmd5' target='_blank'>http://{$_SERVER['HTTP_HOST']}/inscripcion/confirmarEmail/$idmd5</a>  <br/><br/>
                            <br/>   
                            Atentamente.
                            <br/>
                            XXI CONEISC
                            <br/>
                            Tarapoto 2013 
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
                echo "Por favor revise su correo electrónico para confirmar su registro";
            }else if($this->email->send()){
                echo "Por favor revise su correo electrónico para confirmar su registro";
            }else{
                echo 'Error al enviar mensaje...<a href="#" onclick="enviarEmail(\''.$_POST['email'].'\')">Reenviar mensaje de verificación</a>';
            }
        }else{
            $this->index();
        }
    }
    
}
