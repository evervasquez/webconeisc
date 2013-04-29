<?php

if (!defined('BASEPATH'))
    die();

class social extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('fbconnect');
    }

    public function index() {
       // $this->facebook();
    }

    public function facebook() {
        // Se hace el login, primer parámetro la dirección donde los devolverá y el segundo los "scopes" (Info adicional que queremos pedirle a facebook)
        $this->fbconnect->doLogin(base_url() . 'social/handle_facebook_login', 'email,user_birthday,user_location');
    }

    public function handle_facebook_login() {
        //$this->load->library('fbconnect');
        if ($this->fbconnect->isLogedIn()) {
            $dataFacebook = $this->fbconnect->userData();
            $this->load->model('departamento_model');
            $departamentos = $this->departamento_model->getDepartamentos();
            $combo = "<select name='iddepartamento' id='iddepartamento' class='span10'>";
            $combo .= "<option value=''> - - Seleccione - -</option>";
            foreach ($departamentos->result_array() as $row) {
                $combo.="<option value='{$row['iddepartamento']}'>{$row['descripcion']}</option>";
            }
            $combo .= "<option value='26'>Otro...</option>";
            $combo .= "</select>";
            $data['departamento'] = $combo;
            $data['nombres'] = $dataFacebook['first_name'];
            $data['apellidos'] = $dataFacebook['last_name'];
            $data['sexo'] = $dataFacebook['gender'];
            $data['email'] = $dataFacebook['email'];
            $data['active'] = 'li_inscripcion';
            $data['contenido'] = 'web/inscripcion/nuevo.php';
            $this->load->view('index', $data);
        }
    }
    
    public function twitter(){
        
    }

}