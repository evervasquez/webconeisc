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
            $combo = "<select name='iddepartamento' id='iddepartamento' class='span11'>";
            $combo .= "<option value=''> - - Seleccione - -</option>";
            foreach ($departamentos->result_array() as $row) {
                $combo.="<option value='{$row['iddepartamento']}'>{$row['descripcion']}</option>";
            }
            $combo .= "<option value='26'>Otro...</option>";
            $combo .= "</select>";
            $data['imagen'] = "<img src='http://graph.facebook.com/" . $dataFacebook['id'] . "/picture?height=180&width=180'/>";
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

    // api de twitter
    public function twitter() {
        $this->load->library('twconnect');
            redirect('social/clearsession');
    }

    /* redirect to Twitter for authentication */

    public function redirect() {
        $this->load->library('twconnect');

        /* twredirect() parameter - callback point in your application */
        /* by default the path from config file will be used */
        $ok = $this->twconnect->twredirect('social/callback');

        if (!$ok) {
            echo 'Could not connect to Twitter. Refresh the page or try again later.';
        }
    }

    /* return point from Twitter */
    /* you have to call $this->twconnect->twprocess_callback() here! */

    public function callback() {
        $this->load->library('twconnect');

        $ok = $this->twconnect->twprocess_callback();

        if ($ok) {
            redirect('social/success');
        }
        else
            redirect('social/failure');
    }

    /* authentication successful */
    /* it should be a different function from callback */
    /* twconnect library should be re-loaded */
    /* but you can just call this function, not necessarily redirect to it */

    public function success() {
       // echo 'Twitter connect succeded<br/>';
        //echo '<p><a href="' . base_url() . 'social/clearsession">Do it again!</a></p>';

        $this->load->library('twconnect');

        // saves Twitter user information to $this->twconnect->tw_user_info
        // twaccount_verify_credentials returns the same information
        $this->twconnect->twaccount_verify_credentials();

        $twitter_user = (array) $this->twconnect->tw_user_info;
        
        $cadena_nombres = explode(" ",$twitter_user['name']);
        $num_nombres = count($cadena_nombres);
        
        if($num_nombres==2){
            $data['nombres'] = $cadena_nombres[0];
            $data['apellidos'] = $cadena_nombres[1];
        }if($num_nombres==3){
            $data['nombres'] = $cadena_nombres[0]." ".$cadena_nombres[1];
            $data['apellidos'] = $cadena_nombres[2];
        }if($num_nombres==4){
            $data['nombres'] = $cadena_nombres[0]." ".$cadena_nombres[1];
            $data['apellidos'] = $cadena_nombres[2]." ".$cadena_nombres[3];
        }
        
        $this->load->model('departamento_model');
            $departamentos = $this->departamento_model->getDepartamentos();
            $combo = "<select name='iddepartamento' id='iddepartamento' class='span11'>";
            $combo .= "<option value=''> - - Seleccione - -</option>";
            foreach ($departamentos->result_array() as $row) {
                $combo.="<option value='{$row['iddepartamento']}'>{$row['descripcion']}</option>";
            }
            $combo .= "<option value='26'>Otro...</option>";
            $combo .= "</select>";
            $custom_imagen = explode("_", $twitter_user['profile_image_url']);
            $num1 = count($custom_imagen);
            //echo $num1;
           	$imagen ="";
            for($i=0; $i<$num1-1;$i++){
                $imagen = $imagen . $custom_imagen[$i];
                 if($i!=$num1-2){
                $imagen = $imagen."_";    
                }
            }
            //echo $imagen;
            $data['imagen'] = "<img src='".$imagen."'/>";
            $data['departamento'] = $combo;
            //$data['nombres'] = $dataFacebook['first_name'];
            //$data['apellidos'] = $dataFacebook['last_name'];
            //$data['sexo'] = $dataFacebook['gender'];
            //$data['email'] = $dataFacebook['email'];
            $data['active'] = 'li_inscripcion';
            $data['contenido'] = 'web/inscripcion/nuevo.php';
            $this->load->view('index', $data);
        
    }

    /* authentication un-successful */

    public function failure() {

       /// echo '<p>Twitter connect failed</p>';
       // echo '<p><a href="' . base_url() .">Try again!</a></p>';
       // echo "<script>alert('Ha sucedido un error al logearse a twitter\n Intentelo más tarde')</script>";
       redirect(base_url());
    }

    /* clear session */

    public function clearsession() {

        $this->session->sess_destroy();
        redirect('/social/redirect');
    }

}