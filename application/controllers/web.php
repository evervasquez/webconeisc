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
            'active' => 'li_coneisc'
        );
        $this->load->view('index', $data);
    }
    
    public function mision_vision() {
        $data = array(
            'contenido' => 'web/mv.php',
            'active' => 'li_nosotros'
        );
        $this->load->view('index', $data);
    }
    
    public function comision_organizadora() {
        $data = array(
            'contenido' => 'web/co.php',
            'active' => 'li_nosotros'
        );
        $this->load->view('index', $data);
    }
    
    public function papers() {
        $data = array(
            'contenido' => 'web/papers.php',
            'active' => 'li_papers'
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

    public function costos_vida() {
        $data = array(
            'contenido' => 'web/costos.php',
            'active' => 'li_costos'
        );
        $this->load->view('index', $data);
    }

}

/* End of file web.php */
/* Location: ./application/controllers/web.php */
