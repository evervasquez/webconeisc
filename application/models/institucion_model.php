<?php

if (!defined('BASEPATH'))die();

class institucion_model extends CI_Model{
    
    public function __construct() {
        parent::__construct();
    }
    
    public function getInstituciones($datos=false, $select = false){
        if($select){
            $this->db->select($select);
        }
        if($datos && count($datos)>0){
            foreach ($datos as $key => $value) {
                $this->db->where($key,$value);
            }
        }
        $data = $this->db->get('institucion');
        return $data;
    }
    
}
