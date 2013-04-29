<?php

include(APPPATH . '/libraries/facebook/facebook.php');
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class Fbconnect extends Facebook {

    public $user = null;
    public $user_id = null;
    public $fb = false;
    public $fbSession = false;
    public $appkey = 0;
    public $token;

    public function Fbconnect() {
        $ci = & get_instance();
        $ci->config->load('facebook', TRUE);
        $config = $ci->config->item('facebook');
        parent::__construct($config);
        parse_str(substr(strrchr($_SERVER['REQUEST_URI'], '?'), 1), $_REQUEST);

        $this->user_id = $this->getUser();
        
       if($this->isLogedIn()) {
                try {
                    // Se obtiene la info del usuario
                    $this->user = $this->api('/me');
                }
                catch(FacebookApiException $e) {
                    error_log($e);
                }
            }
    }
    
    public function cargarAlbum($fan_pageid) {
        $album = $this->api('/'.$fan_pageid.'/albums');
        $albumes = '';
//        $albumes .= '<ul>';
        foreach ($album['data'] as $album) {
//            $albumes .= '<li>Álbum: ' . $album['name'] . '</li>';

            $albumes .= "<div style='display:inline-block;padding:10px;width:220px;height:230px'> ";

            //recuperar fotos por albums
            $photo = $this->api("/{$album['id']}/photos");
            $i = 0;
            foreach ($photo['data'] as $photo) {
                if($i == 0){
                    $albumes .= "<a href='". base_url() ."galeria/album/".$album['id']."'><img src='{$photo['picture']}' class='img-polaroid' style='height:200px;width:200px' /></a>";
                    $i = 1;
                }
            }
            $albumes .= '<br/>Álbum: ' . $album['name'];
            $albumes .= '</div>';
        }
//        $albumes .= '</ul>';
        
        return $albumes;
    }
    
    public function cargarFoto($idfoto, $fan_pageid) {
        $album = $this->api('/'.$fan_pageid.'/albums');
        $albumes = '';
//        $albumes .= '<ul>';
        foreach ($album['data'] as $album) {
            if($album['id'] == $idfoto){
//            $albumes .= '<li>Álbum: ' . $album['name'] . '</li>';

                $albumes .= '<h4>Álbum: ' . $album['name'] . '</h4><br/>';
                //recuperar fotos por albums
                $photo = $this->api("/{$album['id']}/photos");

                foreach ($photo['data'] as $photo) {
                        $albumes .= "<div style='display:inline-block;padding:10px;width:220px;height:230px'> ";
                        $albumes .= "<a href='". base_url() ."galeria/album/".$album['id']."'><img src='{$photo['picture']}' class='img-polaroid' style='height:200px;width:200px' /></a>";
                        $albumes .= '</div>';
                        
                }
            }
        }
//        $albumes .= '</ul>';
        
        return $albumes;
    }


    public function send_back($param) {
        return $param;
    }
    
    // Devuelve URL foto de perfil
        public function profilePic($uid=FALSE) {
            if(!$uid) {
                $uid = $this->userId;
            }
            
            return 'http://graph.facebook.com/' . $uid . '/picture';
        }
        
        // Realizar peticiones a través de FQL: Tabla, Scopes, Array u Objeto, Where
        // $this->fbconnect->fqlQuery('user', 'current_location');
        public function fqlQuery($table, $scopes, $as_object=TRUE, $where='uid=me()') {
            $array = $this->api(array('method'=>'fql.query','query'=>"SELECT " . $scopes . " FROM " . $table . " WHERE " . $where));
            return ($as_object ? json_decode (json_encode ($array[0]), FALSE) : $array[0]);
        }
        
        // Comprobar si está logeado
        public function isLogedIn() {
            return ($this->user_id);
        }
        
        // Datos del usuario para manejo en controlador
        // $this->fbconnect->userData()->email;
        public function userData($obj=TRUE) {
            if($this->user) {
                //return ($obj ? json_decode (json_encode ($this->user), FALSE) : $this->user);
                return $this->user;
            }
            return array();
        }
        
        // Acción de login. Directo en el controlador
        // $this->fbconnect->doLogin('http://ejemplo.com/login/facebook', 'email');
        public function doLogin($redirect, $scope='') {
            redirect($this->getLoginUrl(array('redirect_uri' => $redirect, 'scope' => $scope)));
        }

}

?>
