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
    
    public function nuevo() {
       $data['contenido'] = 'web/inscripcion/nuevo.php';
        $this->load->view('index', $data);
    }
}
