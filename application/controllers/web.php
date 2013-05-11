<?php

if (!defined('BASEPATH'))die();

class web extends Main_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper(array('url','form','recaptchalib_helper'));
        $this->load->library('form_validation');
    }

    public function index() {
        $data = array(
            'contenido' => 'web/index.php',
            'active' => 'li_inicio'
        );
        $this->load->view('index', $data);
    }

    public function presentacion() {
        $data = array(
            'contenido' => 'web/presentacion.php',
            'active' => 'li_coneisc'
        );
        $this->load->view('index', $data);
    }
    
    public function cronograma() {
        $data = array(
            'contenido' => 'web/cronograma.php',
            'active' => 'li_eventos'
        );
        $this->load->view('index', $data);
    }
    
    public function campeonato_deportivo() {
        $data = array(
            'contenido' => 'web/campeonato.php',
            'active' => 'li_eventos'
        );
        $this->load->view('index', $data);
    }
    
    public function mision_vision() {
        $data = array(
            'contenido' => 'web/mv.php',
            'active' => 'li_coneisc'
        );
        $this->load->view('index', $data);
    }
    
    public function comision_organizadora() {
        $data = array(
            'contenido' => 'web/co.php',
            'active' => 'li_coneisc'
        );
        $this->load->view('index', $data);
    }
    
    public function papers() {
        $data = array(
            'contenido' => 'web/papers.php',
            'active' => 'li_concursos'
        );
        $this->load->view('index', $data);
    }
    
    public function concurso_programacion() {
        $data = array(
            'contenido' => 'web/con_prog.php',
            'active' => 'li_concursos'
        );
        $this->load->view('index', $data);
    }
    
    public function concurso_proyectos_investigacion() {
        $data = array(
            'contenido' => 'web/con_pi.php',
            'active' => 'li_concursos'
        );
        $this->load->view('index', $data);
    }
    
    public function contactenos() {
        $data = array(
            'contenido' => 'web/contacto.php',
            'active' => 'li_contacto'
        );
        $this->load->view('index', $data);
    }
    
    function verifica_captcha() {
            //aquí debemos la clave privada que recaptcha nos ha dado
        $privatekey = "6LdkseASAAAAAFMNTe65nOe_3mQqociRNbSeZWnA";
        $resp = recaptcha_check_answer ($privatekey,
                                        $_SERVER["REMOTE_ADDR"],
                                        $this->input->post("recaptcha_challenge_field"),
                                        $this->input->post("recaptcha_response_field"));
 
          if (!$resp->is_valid) {
            $this->form_validation->set_message('verifica_captcha','El %s es incorrecto');
                 return FALSE;
          } else {
 
          }
    }
        
    function contactenoss() {
        if(isset($_POST['registro']) and $_POST['registro'] == 'si')
        {
            $this->form_validation->set_rules('nombre', 'Nombre','required|xss_clean');
            $this->form_validation->set_rules('email', 'Email','required|valid_email');
            $this->form_validation->set_rules('asunto', 'Asunto','required|xss_clean');
            $this->form_validation->set_rules('text', 'Text','required|xss_clean');
            $this->form_validation->set_rules('recaptcha_response_field', 'codigo captcha','callback_verifica_captcha|xss_clean');
 
            $this->form_validation->set_message('required', 'El %s es requerido');
 
            if (!$this->form_validation->run())
            {
                $this->contactenos();
            }
            else
            {
                $this->contacto();
            }
        }
    }
    
    public function contacto(){
        $this->load->view('web/contact.php');
    }

    public function costos_generales() {
        $data = array(
            'contenido' => 'web/costos.php',
            'active' => 'li_costos'
        );
        $this->load->view('index', $data);
    }
    
    public function estadias() {
        $data = array(
            'contenido' => 'web/estadias.php',
            'active' => 'li_costos'
        );
        $this->load->view('index', $data);
    }
    
    public function restaurantes() {
        $data = array(
            'contenido' => 'web/restaurantes.php',
            'active' => 'li_costos'
        );
        $this->load->view('index', $data);
    }
    
    public function seleccionar_cc() {
        $this->load->model('hc_model');
        $costos = $this->hc_model->getCC($_POST);
        $lista = "<table class='table table-striped'>";
        foreach ($costos->result_array() as $row) {
            $lista .= "<tr>";
            $lista .= "<td><p class='text-left'>".utf8_encode($row['nombre'])."</p></td>";
            $lista .= "<td><p class='text-left'>{$row['telefono']}</p></td>";
            $lista .= '<td><a href="javascript:void(0)" onclick="hoteles(\''.$row['id'].'\')" class="btn btn-small btn-success">Ver</a></td>';
            $lista .= "</tr>";
        }
        $lista .= "</table>";
        echo $lista;
    }
    
    
    public function seleccionar_h() {
        $this->load->model('hc_model');
        $costos = $this->hc_model->getCC($_POST);
        $lista = "<table cellpadding='5' align='center' class='text-left'>";
        foreach ($costos->result_array() as $row) {
            $lista .= "<tr>";
            $lista .= "<td><h4>{$row['categoria']}:</h4></td>";
            $lista .= "<td class='text-center'><h4>".utf8_encode($row['nombre'])."</h4></td>";
            $lista .= "</tr>";
            if($row['costo-s'] != ''){
                $lista .= "<tr>";
                $lista .= "<td>Costo de Habitación Simple</td>";
                $lista .= "<td class='text-center'>S/.{$row['costo-s']}.00</td>";
                $lista .= "</tr>";
            }
            if($row['costo-d'] != ''){
                $lista .= "<tr>";
                $lista .= "<td>Costo de Habitación Doble</td>";
                $lista .= "<td class='text-center'>S/.{$row['costo-d']}.00</td>";
                $lista .= "</tr>";
            }
            if($row['costo-t'] != ''){
                $lista .= "<tr>";
                $lista .= "<td>Costo de Habitación Triple</td>";
                $lista .= "<td class='text-center'>S/.{$row['costo-t']}.00</td>";
                $lista .= "</tr>";
            }
            if($row['costo-c'] != ''){
                $lista .= "<tr>";
                $lista .= "<td>Costo de Habitación Cuadruple</td>";
                $lista .= "<td class='text-center'>S/.{$row['costo-c']}.00</td>";
                $lista .= "</tr>";
            }
            if($row['costo-sx'] != ''){
                $lista .= "<tr>";
                $lista .= "<td>Costo de Habitación Sextuple</td>";
                $lista .= "<td class='text-center'>S/.{$row['costo-sx']}.00</td>";
                $lista .= "</tr>";
            }
            if($row['costo-m'] != ''){
                $lista .= "<tr>";
                $lista .= "<td>Costo de Habitación Matrimonial</td>";
                $lista .= "<td class='text-center'>S/.{$row['costo-m']}.00</td>";
                $lista .= "</tr>";
            }
            $lista .= "<tr>";
            $lista .= "<td>Teléfono</td>";
            $lista .= "<td class='text-center'>{$row['telefono']}</td>";
            $lista .= "</tr>";
            $lista .= "<tr>";
            $lista .= "<td>Dirección</td>";
            $lista .= "<td class='text-center'>".utf8_encode($row['direccion'])."</td>";
            $lista .= "</tr>";
            if($row['imagen'] != 'no'){
                $lista .= "<tr>";
                $lista .= "<td class='text-center' colspan='2'><img src='".base_url()."assets/img/hoteles/{$row['imagen']}'></td>";
                $lista .= "</tr>";
            }
        }
        $lista .= "</table>";
        echo $lista;
    }

}

/* End of file web.php */
/* Location: ./application/controllers/web.php */
