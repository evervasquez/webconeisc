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
    
}
