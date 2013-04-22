<?php

if (!defined('BASEPATH'))
    die();

class web extends Main_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $data['contenido'] = 'web/index.php';
        $this->load->view('index', $data);
    }

    public function presentacion() {
        $data['contenido'] = 'web/presentacion.php';
        $this->load->view('index', $data);
    }

}

/* End of file frontpage.php */
/* Location: ./application/controllers/frontpage.php */
