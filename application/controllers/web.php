<?php

if (!defined('BASEPATH'))
    die();

class web extends Main_Controller {

    public function __construct() {
        parent::__construct();
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

}

/* End of file frontpage.php */
/* Location: ./application/controllers/frontpage.php */
