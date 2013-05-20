<?php

if (!defined('BASEPATH'))die();

class hc_model extends CI_Model{
    
    public function __construct() {
        parent::__construct();
    }
    
    public function getCC($datos=false){
        if($datos && count($datos)>0){
            foreach ($datos as $key => $value) {
                $this->db->where($key,$value);
            }
        }
        $data = $this->db->get('hoteles');
        return $data;
    }
    
    public function getEstadias(){
        $data = $this->db->get('hoteles');
        return $data;
    }
    
    public function getHotel($id){
       $this->db->where('id',$id); 
       $data = $this->db->get('hoteles');
       return $data;
    }
}