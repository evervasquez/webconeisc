<?php

if (!defined('BASEPATH'))
    die();

class social extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('fbconnect');
    }
    public function index(){
        $this->facebook();
    }

    public function facebook() {
        // Se hace el login, primer parámetro la dirección donde los devolverá y el segundo los "scopes" (Info adicional que queremos pedirle a facebook)
        $this->fbconnect->doLogin(base_url().'social/handle_facebook_login', 'email,user_birthday,user_location');   
    }

    public function handle_facebook_login() {
       // $this->load->library('fbconnect');
       $data['nombres'] = utf8_encode($this->fbconnect->userData()->first_name);
       $data['apellidos'] = utf8_encode($this->fbconnect->userData()->last_name);
       $data['sexo'] = utf8_encode($this->fbconnect->userData()->gender);
       $data['email'] = utf8_encode($this->fbconnect->userData()->email);

       echo '<pre>';
       print_r($this->fbconnect->userData());
       echo '</pre>';
    }
    
        public function fblogin() {
        // Cargamos la librería
        
    }  

}