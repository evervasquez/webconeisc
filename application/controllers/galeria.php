<?php

if (!defined('BASEPATH'))
    die();

class galeria extends Main_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('fbconnect');
    }

    public function index() {
        $var = $this->fbconnect->cargarAlbum(151196825047516);
        $data = array(
            'contenido' => 'web/galeria.php',
            'active' => 'li_galeria',
            'var' => $var
        );
        $this->load->view('index', $data);
    }
    
    public function album($id) {
        $var = $this->fbconnect->cargarFoto($id, 151196825047516);
        $data = array(
            'contenido' => 'web/album.php',
            'active' => 'li_galeria',
            'var' => $var
        );
        $this->load->view('index', $data);
    }

}

/* End of file frontpage.php */
/* Location: ./application/controllers/frontpage.php */
