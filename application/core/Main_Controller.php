<?php

class Main_Controller extends MY_Controller {

    function __construct() {
        parent::__construct();
    }

    function object2array($valor) {//valor
        if (!(is_array($valor) || is_object($valor))) { //si no es un objeto ni un array
            $dato = $valor; //lo deja
        } else { //si es un objeto
            foreach ($valor as $key => $valor1) { //lo conteo 
                $dato[$key] = $this->object2array($valor1); //
            }
        }
        return @$dato;
    }

}
