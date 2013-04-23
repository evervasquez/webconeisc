<?php

if (!defined('BASEPATH'))die();

class inscripcion_model extends CI_Model{
    
    public function __construct() {
        parent::__construct();
    }
    
    public function getInscripcion($datos, $select = false){
        if($select){
            $this->db->select($select);
        }
        if(count($datos)>0){
            foreach ($datos as $key => $value) {
                $this->db->where($key,$value);
            }
        }
        $data = $this->db->get('inscripcion');
        return $data;
    }
    
}
