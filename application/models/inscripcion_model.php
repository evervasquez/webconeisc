<?php

if (!defined('BASEPATH'))die();

class inscripcion_model extends CI_Model{
    
    public function __construct() {
        parent::__construct();
    }
    
    public function insertInscripcion($datos){
        if (isset($datos['idtipo_inscripcion'])) {$idtipo_inscripcion = $datos["idtipo_inscripcion"];} else {$idtipo_inscripcion = null;}
        if (isset($datos['idinstitucion'])) {$idinstitucion = $datos["idinstitucion"];} else {$idinstitucion = null;}
        if (isset($datos['institucion'])) {$institucion = $datos["institucion"];} else {$institucion = null;}
        if (isset($datos['idempleado'])) {$idempleado = $datos["idempleado"];} else {$idempleado = null;}
        $nombres = $datos["nombres"];
        $apellidos = $datos["apellidos"];
        $dni = $datos["dni"];
        $sexo = $datos["sexo"];
        $fecha_inscripcion = date('Y-m-d');
        if (isset($datos['fecha_deposito'])) {$fecha_deposito = $datos["fecha_deposito"];} else {$fecha_deposito = null;}
        $d = substr($datos['fecha_deposito'], 0, 2);
        $m = substr($datos['fecha_deposito'], 3, 2);
        $a = substr($datos['fecha_deposito'], 6, 4);
        $fecha_deposito = "$a-$m-$d";
        if (isset($datos['fecha_confirmacion'])) {$fecha_confirmacion = $datos["fecha_confirmacion"];} else {$fecha_confirmacion = null;}
        if (isset($datos['tipo_pago'])) {$tipo_pago = $datos["tipo_pago"];} else {$tipo_pago = null;}
        if (isset($datos['nro_operacion'])) {$nro_operacion = $datos["nro_operacion"];} else {$nro_operacion = null;}
        if (isset($datos['monto'])) {$monto = $datos["monto"];} else {$monto = null;}
        $telefono = $datos["telefono"];
        $email = $datos["email"];
        $estado = 0;
        $data = $this->db->query("CALL pa_insert_inscripcion('$idtipo_inscripcion','$idinstitucion','$institucion','$idempleado', '$nombres',
            '$apellidos','$dni','$sexo', '$fecha_inscripcion','$fecha_deposito', '$fecha_confirmacion', '$tipo_pago', '$nro_operacion', 
            '$monto', '$telefono','$email','$estado')");
        return $data;
    }
    
    public function getInscripcion($datos, $select = false){
        if($select){
            $this->db->select($select);
        }
        if($datos && count($datos)>0){
            foreach ($datos as $key => $value) {
                $this->db->where($key,$value);
            }
        }
        $data = $this->db->get('inscripcion');
        return $data;
    }
    
    public function updateInscripcion($datos, $where=false){
        if($where && count($where)>0){
            foreach ($where as $key => $value) {
                $this->db->where($key,$value);
            }
        }
        $this->db->update('inscripcion',$datos);
        if ($this->db->affected_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }
    
}
