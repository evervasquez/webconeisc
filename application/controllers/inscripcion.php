<?php

if (!defined('BASEPATH'))die();

class inscripcion extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('inscripcion');
    }

    public function index() {
        $data['contenido'] = 'web/inscripcion/index.php';
        $this->load->view('index', $data);
    }

    public function validaInscrito() {
        if(isset($_POST['busqueda'])&& isset($_POST['parametro'])){
            echo '<pre>';print_r($_POST);
            $busqueda=$_POST['busqueda'];
            $parametro=$_POST['parametro'];
            $caracteres_prohibidos = array("'","/","<",">",";",'"');    
            $parametro = str_replace($caracteres_prohibidos,"",$parametro);
            if(is_numeric($busqueda) && $busqueda>0 && $busqueda<3){
                if($busqueda==1){
                    $where="email='$parametro'";
                }else if($busqueda==2){
                    $where="dni=$parametro";
                }else{
                    $this->index();
                }
                $sql = " Select estado from inscripcion where $where";
                $conexion=new conexion();
                $r=mysql_query($sql) or die("<script type='text/javascript'>
                    alert('Error: ".mysql_error()."');
                    window.location='inscripcion.php';
                    </script>");
                $conexion->close();
                if($f=mysql_fetch_assoc($r)){
                    switch ($f['estado']){
                        case 0: echo 'Aun no confirmó su email...<a href="#">Reenviar mensaje de verificación</a>';break;
                        case 1: echo 'Su inscripción está siendo verificada.Gracias!';break;
                        case 2: echo 'Usted ya forma parte del XXI Coneisc';break;
                        case 3: echo 'Si inscripción tiene un inconveniente';break;
                        case 4: echo 'Su inscripción fue rechazada por irregularidad';break;
                    }
                }else{
                    echo 'No se encuentra inscrito aún: <a href="#" onclick=\'$("#content").load("inscripcion/formInscripcion.php") \'>Inscríbase Aquí</a>';
                }
            }else{
                $this->index();
            }
        }else{
            $this->index();
        }
    }

}
