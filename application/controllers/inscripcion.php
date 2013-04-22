<?php

if (!defined('BASEPATH'))die();

class inscripcion extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $data['contenido'] = 'web/inscripcion/index.php';
        $this->load->view('index', $data);
    }

    public function presentacion() {
        $data['contenido'] = 'web/presentacion.php';
        $this->load->view('index', $data);
    }

}
