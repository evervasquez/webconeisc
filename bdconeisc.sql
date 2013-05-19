/*
MySQL Data Transfer
Source Host: localhost
Source Database: bdconeisc
Target Host: localhost
Target Database: bdconeisc
Date: 22/04/2013 07:56:14 p.m.
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for asistencia_taller
-- ----------------------------
DROP TABLE IF EXISTS `asistencia_taller`;
CREATE TABLE `asistencia_taller` (
  `idasistencia_taller` int(11) NOT NULL,
  `idinscrito_taller` int(11) NOT NULL,
  `asistencia` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idasistencia_taller`),
  KEY `fk_inscrito_taller_asistencia` (`idinscrito_taller`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for asistente_conferencia
-- ----------------------------
DROP TABLE IF EXISTS `asistente_conferencia`;
CREATE TABLE `asistente_conferencia` (
  `idconferencia` int(11) NOT NULL,
  `idinscripcion` int(11) NOT NULL,
  `asistencia` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idconferencia`,`idinscripcion`),
  KEY `fk_inscripcion_inscripcion_conferencia` (`idinscripcion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for concurso
-- ----------------------------
DROP TABLE IF EXISTS `concurso`;
CREATE TABLE `concurso` (
  `idconcurso` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`idconcurso`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for conferencias
-- ----------------------------
DROP TABLE IF EXISTS `conferencias`;
CREATE TABLE `conferencias` (
  `idconferencia` int(11) NOT NULL,
  `idtipo_conferencia` int(11) DEFAULT NULL,
  `conferencias` varchar(100) DEFAULT NULL,
  `temas` varchar(300) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_termino` time DEFAULT NULL,
  `ponente` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idconferencia`),
  KEY `fk_tipo_conferencia_conferencia` (`idtipo_conferencia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for departamento
-- ----------------------------
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `iddepartamento` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`iddepartamento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for equipos
-- ----------------------------
DROP TABLE IF EXISTS `equipos`;
CREATE TABLE `equipos` (
  `idequipo` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `idinstitucion` int(11) DEFAULT NULL,
  `idconcurso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idequipo`),
  KEY `fk_institucion_equipos` (`idinstitucion`),
  KEY `fk_concurso_equipos` (`idconcurso`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for equipos_inscripcion
-- ----------------------------
DROP TABLE IF EXISTS `equipos_inscripcion`;
CREATE TABLE `equipos_inscripcion` (
  `idequipo` int(11) NOT NULL,
  `idinscripcion` int(11) NOT NULL,
  PRIMARY KEY (`idequipo`,`idinscripcion`),
  KEY `fk_inscripcion_equipo_inscripcion` (`idinscripcion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for informativo
-- ----------------------------
DROP TABLE IF EXISTS `informativo`;
CREATE TABLE `informativo` (
  `idinformativo` int(11) NOT NULL AUTO_INCREMENT,
  `idtipo_informativo` int(11) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(800) DEFAULT NULL,
  `imagen1` varchar(200) DEFAULT NULL,
  `imagen2` varchar(200) DEFAULT NULL,
  `frfrfrf` varchar(222) DEFAULT NULL,
  PRIMARY KEY (`idinformativo`),
  KEY `fk_informativo_tipo_informativo` (`idtipo_informativo`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for inscripcion
-- ----------------------------
DROP TABLE IF EXISTS `inscripcion`;
CREATE TABLE `inscripcion` (
  `idinscripcion` int(11) NOT NULL DEFAULT '0',
  `idmd5` varchar(50) NOT NULL,
  `idtipo_inscripcion` int(11) DEFAULT NULL,
  `idinstitucion` int(11) DEFAULT NULL,
  `institucion` varchar(100) DEFAULT NULL,
  `idempleado` int(11) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(80) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fecha_inscripcion` date NOT NULL,
  `fecha_deposito` date DEFAULT NULL,
  `fecha_confirmacion` datetime DEFAULT NULL,
  `tipo_pago` char(1) DEFAULT NULL,
  `nro_operacion` varchar(30) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idinscripcion`),
  KEY `fk_tipo_inscripcion` (`idtipo_inscripcion`),
  KEY `fk_inscripcion_institucion` (`idinstitucion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for inscrito_taller
-- ----------------------------
DROP TABLE IF EXISTS `inscrito_taller`;
CREATE TABLE `inscrito_taller` (
  `idinscrito_taller` int(11) NOT NULL,
  `idtalleres` int(11) NOT NULL,
  `idinscripcion` int(11) NOT NULL,
  `costo` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`idinscrito_taller`),
  KEY `fk_taller_inscrito_taller` (`idtalleres`),
  KEY `fk_inscripcion_inscrito_taller` (`idinscripcion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for institucion
-- ----------------------------
DROP TABLE IF EXISTS `institucion`;
CREATE TABLE `institucion` (
  `idinstitucion` int(11) NOT NULL,
  `idtipo_institucion` int(11) NOT NULL,
  `iddepartamento` int(11) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idinstitucion`),
  KEY `fk_tipo_institucion_institucion` (`idtipo_institucion`),
  KEY `fk_iddepartamento_institucion` (`iddepartamento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for materiales
-- ----------------------------
DROP TABLE IF EXISTS `materiales`;
CREATE TABLE `materiales` (
  `idmaterial` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `final` int(1) DEFAULT '0',
  PRIMARY KEY (`idmaterial`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for materiales_inscripcion
-- ----------------------------
DROP TABLE IF EXISTS `materiales_inscripcion`;
CREATE TABLE `materiales_inscripcion` (
  `idmaterial` int(11) NOT NULL,
  `idinscripcion` int(11) NOT NULL,
  PRIMARY KEY (`idmaterial`,`idinscripcion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for modulos
-- ----------------------------
DROP TABLE IF EXISTS `modulos`;
CREATE TABLE `modulos` (
  `idmodulo` int(11) NOT NULL,
  `idpadre` int(11) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmodulo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for organizadores
-- ----------------------------
DROP TABLE IF EXISTS `organizadores`;
CREATE TABLE `organizadores` (
  `idorganizadores` int(11) NOT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(80) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `asigancion` varchar(100) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idorganizadores`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for perfil
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `idperfil` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idperfil`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for permiso
-- ----------------------------
DROP TABLE IF EXISTS `permiso`;
CREATE TABLE `permiso` (
  `idperfil` int(11) NOT NULL,
  `idmodulo` int(11) NOT NULL,
  `habilitarmodulo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idmodulo`,`idperfil`),
  KEY `fk_perfil_permiso` (`idperfil`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for responsable_concurso
-- ----------------------------
DROP TABLE IF EXISTS `responsable_concurso`;
CREATE TABLE `responsable_concurso` (
  `idconcurso` int(11) NOT NULL,
  `idorganizadores` int(11) NOT NULL,
  PRIMARY KEY (`idconcurso`,`idorganizadores`),
  KEY `fk_organizadores_responsable_concurso` (`idorganizadores`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for responsable_conferencia
-- ----------------------------
DROP TABLE IF EXISTS `responsable_conferencia`;
CREATE TABLE `responsable_conferencia` (
  `idconferencia` int(11) NOT NULL,
  `idorganizadores` int(11) NOT NULL,
  PRIMARY KEY (`idconferencia`,`idorganizadores`),
  KEY `fk_organizadores_responsable_conferencia` (`idorganizadores`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for responsables_talleres
-- ----------------------------
DROP TABLE IF EXISTS `responsables_talleres`;
CREATE TABLE `responsables_talleres` (
  `idorganizador` int(11) NOT NULL,
  `idtalleres` int(11) NOT NULL,
  PRIMARY KEY (`idorganizador`,`idtalleres`),
  KEY `fk_talleres_responsables_talleres` (`idtalleres`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for talleres
-- ----------------------------
DROP TABLE IF EXISTS `talleres`;
CREATE TABLE `talleres` (
  `idtalleres` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_final` time DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `ponente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtalleres`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tipo_conferencia
-- ----------------------------
DROP TABLE IF EXISTS `tipo_conferencia`;
CREATE TABLE `tipo_conferencia` (
  `idtipo_conferencia` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idtipo_conferencia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tipo_inscripcion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_inscripcion`;
CREATE TABLE `tipo_inscripcion` (
  `idtipo_inscripcion` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idtipo_inscripcion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tipo_institucion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_institucion`;
CREATE TABLE `tipo_institucion` (
  `idtipo_institucion` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idtipo_institucion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `idusuario` varchar(8) NOT NULL,
  `idperfil` int(11) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(80) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_perfil_usuario` (`idperfil`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- View structure for v_institucion
-- ----------------------------
DROP VIEW IF EXISTS `v_institucion`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_institucion` AS select `institucion`.`idinstitucion` AS `idinstitucion`,`institucion`.`descripcion` AS `descripcion`,`institucion`.`iddepartamento` AS `iddepartamento` from `institucion`;

-- ----------------------------
-- Procedure structure for informativo
-- ----------------------------
DROP PROCEDURE IF EXISTS `informativo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `informativo`(p1 int ,p2 int ,p3 VARCHAR(400),p4 VARCHAR(500),p5 VARCHAR(100),p6 VARCHAR(300))
BEGIN
 declare idMax INT;

  set idMax =(select max(idinformativo)+1 from  informativo );
         if (idMax is null)then
         set idMax=1;
         end if;

INSERT INTO informativo(idinformativo,idtipo_informativo,titulo,descripcion,imagen1,imagen2)
 VALUES (idMax,p2,p3,p4,p5,p6);
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_equipos
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_equipos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_equipos`(p0 int ,p1 varchar(100),p2 int,p3 int ,op int)
BEGIN
DECLARE idMax int;
if op = 0 then
set idMax =(select max(idequipo)+1 from equipos);
         if (idMax is null)then
         set idMax=1;
         end if;
       insert into equipos(idequipo,descripcion,idinstitucion,idconcurso) 
          values(idMax,p1,p2,p3);
   else 
        update equipos set descripcion=p1,idinstitucion=p2,idconcurso=p3
        where idconcurso = p0; 
end IF;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_organizadores
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_organizadores`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_organizadores`(p0 int ,p1 varchar(50),p2 varchar(80),p3 varchar(8),p4 varchar(100),p5 char(1) ,p6 varchar(45),op int)
BEGIN
DECLARE idMax int;
if op = 0 then
set idMax =(select max(idorganizadores)+1 from organizadores);
         if (idMax is null)then
         set idMax=1;
         end if;
       insert into organizadores (idorganizadores,nombres,apellidos,dni,asignacion,sexo,email) 
          values(idMax,p1,p2,p3,p4,p5,p6);
   else 
        update organizadores set nombres=p1,apellidos=p2,dni=p3,asignacion=p4,sexo=p5,email=p6
        where idorganizadores = p0; 
end IF;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_conferencias
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_conferencias`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_conferencias`(p1 INT,p2 INT, p3 VARCHAR(100),p4 VARCHAR(300),p5 DATE, p6 TIME, p7 TIME,p8 VARCHAR(200),op INT)
BEGIN 
DECLARE idMax int;
if op = 0 then
set idMax =(select max(idconferencia)+1 from conferencia );
         if (idMax is null)then
         set idMax=1;
         end if;
       insert into conferencia (idconferencia,idtipo_conferencia,conferencias,temas,fecha,hora_inicio,hora_termino,ponente) 
        values(idMax,p2,p3,p4,p5,p6,p7,p8);
    else 
        update conferencia set idtipo_conferencia=p2,conferencias=p3,temas=p4,fecha=p5,hora_inicio=p6,hora_termino=p7,ponente=p8
        where idconferencia = p1;

    end if;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_confirmar_inscripcion
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_confirmar_inscripcion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_confirmar_inscripcion`(p1 int,p2 INT,p3 date,p4 DECIMAL )
BEGIN
  UPDATE inscripcion SET idempleado=p2, fecha_confirmacion=CURDATE(),monto=p4,estado=1
  WHERE idinscripcion=p1;
  
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_insert_incripcion
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_insert_incripcion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_insert_incripcion`(p1 int,
p2 int,
p3 int, 
p4 VARCHAR(50), 
p5 VARCHAR(50),
p6 VARCHAR(80),
p7 VARCHAR(8),p8 date,
p9 varchar(13),

p10 varchar(100),
p11 VARCHAR(30),
p12 VARCHAR(100),
p13 VARCHAR(15))
BEGIN
declare xidconferencia int;
declare xcontconferencias int;
declare idMax INT;

  set idMax =(select max(idinscripcion)+1 from  inscripcion );
         if (idMax is null)then
         set idMax=1;
         end if;

 set xidconferencia=0;
set xcontconferencias=15;
INSERT INTO inscripcion(
idinscripcion,
idtipo_inscripcion,
idinstitucion,
nombres,
apellidos,
dni,
sexo,
fecha_deposito,
tipo_pago,
nro_operacion,
telefono,
email,
estado)
values(
idMax,
p2,
p3,
p4,
p5,
p6,
p7,
p8,
p9,
p10,
p11,
p12,
p13);

    BUCLE: LOOP
         set xidconferencia = xidconferencia + 1;
        insert into asistente_conferencia (idconferencia,idinscripcion,asistencia) values(xidconferencia,idMax,0);
        set xcontconferencias = xcontconferencias- 1;
            IF xcontconferencias=0 THEN
                LEAVE BUCLE;
            END IF;
        END LOOP BUCLE;

COMMIT;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_insert_inscripcion
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_insert_inscripcion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_insert_inscripcion`(P_idtipo_inscripcion int(11), P_idinstitucion int(11), P_institucion varchar(50),  P_idempleado int(11), P_nombres varchar(50), P_apellidos varchar(80), P_dni varchar(8), P_sexo char(1), P_fecha_inscripcion date, P_fecha_deposito date, P_fecha_confirmacion datetime, P_tipo_pago char(1), P_nro_operacion varchar(30), P_monto decimal(10,2), P_telefono varchar(15), P_email varchar(45),  P_estado int(11))
BEGIN
 declare idMax INT;
 declare idMD5 varchar(50);

  set idMax =(select max(idinscripcion)+1 from  inscripcion );
         if (idMax is null)then
         set idMax=1;
         end if;

set idMD5 = md5(md5(md5(idMax)));

INSERT INTO inscripcion (idinscripcion, idmd5, idtipo_inscripcion, idinstitucion, institucion, idempleado, nombres, apellidos, dni, sexo,
	fecha_inscripcion, fecha_deposito, fecha_confirmacion, tipo_pago, nro_operacion, monto, telefono, email, estado )
values(idMax, idMD5, P_idtipo_inscripcion, P_idinstitucion, P_institucion, P_idempleado, P_nombres, P_apellidos, P_dni, P_sexo,
 	P_fecha_inscripcion, P_fecha_deposito, P_fecha_confirmacion, P_tipo_pago, P_nro_operacion, P_monto, P_telefono, P_email, P_estado);

SELECT idmd5, email, nombres, apellidos  from inscripcion where idinscripcion = idMax;

COMMIT;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_insert_preinscripcion
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_insert_preinscripcion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_insert_preinscripcion`(P_idinstitucion int(11),P_iddepartamento int(11),P_nombres varchar(50), P_apellidos varchar(80), P_dni varchar(8), P_sexo char(1), P_telefono varchar(15), P_email varchar(45), P_estado int(11), P_ins_estaado int (1))
BEGIN
 declare idMax INT;

  set idMax =(select max(idinscripcion)+1 from  inscripcion );
         if (idMax is null)then
         set idMax=1;
         end if;

INSERT INTO inscripcion (idinscripcion, idtipo_inscripcion, idinstitucion, iddepartamento, idempleado, nombres, apellidos, dni, sexo, 
	fecha_deposito, fecha_confirmacion, tipo_pago, nro_operacion, monto, telefono, email, ins_estado, estado)
values(idMax, P_idinstitucion, P_iddepartamento, P_nombres, P_apellidos, P_dni, P_sexo, P_telefono, P_email, P_estado, P_ins_estaado);
COMMIT;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_talleres
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_talleres`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_talleres`(p1 INT,p2 varchar(45), p3 date,p4 varchar(11),p5 varchar(11) ,p6 decimal(10,2), p7 varchar(45) ,op INT)
BEGIN 
DECLARE idMax int;
if op = 0 then
set idMax =(select max(idtalleres)+1 from talleres );
         if (idMax is null)then
         set idMax=1;
         end if;
       insert into talleres (idtalleres,descripcion,fecha,hora_inicio,hora_final,costo,ponente) 
        values(idMax,p2,p3,p4,p5,p6,p7);
    else 
        update talleres set descripcion=p2,fecha=p3,hora_inicio=p4,hora_final=p5,costo=p6,ponente=p7
        where idtalleres = p1;

    end if;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_tipo_conferencia
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_tipo_conferencia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_tipo_conferencia`(p1 INT,p2 VARCHAR(50), op INT)
BEGIN 
DECLARE idMax int;
if op = 0 then
set idMax =(select max(idtipo_conferencia)+1 from tipo_conferencia );
         if (idMax is null)then
         set idMax=1;
         end if;
       insert into tipo_conferencia (idtipo_conferencia,descripcion) 
        values(idMax,p2);
    else 
        update conferencia set descripcion=p2
        where idtipo_conferencia = p1;
    end if;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_update_inscripcion
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_update_inscripcion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_update_inscripcion`(P_idinscripcion int(11), P_idtipo_inscripcion int(11), P_idinstitucion int(11), P_iddepartamento int(11), P_idempleado int(11), P_nombres varchar(50), P_apellidos varchar(80), P_dni varchar(8), P_sexo char(1), P_fecha_deposito date, P_fecha_confirmacion date, P_tipo_pago char(1), P_nro_operacion varchar(30), P_monto decimal(10,2), P_telefono varchar(15), P_email varchar(45), P_ins_estado int(1), P_estado int(11))
BEGIN
UPDATE inscripcion set idtipo_inscripcion=P_idtipo_inscripcion, idinstitucion=P_idinstitucion, iddepartamento=P_iddepartamento, idempleado=P_idempleado, nombres=P_nombres, apellidos=P_apellidos, dni=P_dni, sexo=P_sexo, 	fecha_deposito=P_fecha_deposito,
	 fecha_confirmacion=P_fecha_confirmacion, tipo_pago=P_tipo_pago, nro_operacion=P_nro_operacion, monto=P_monto, telefono=P_telefono, email=P_email, ins_estado=P_ins_estado, estado=P_estado
WHERE idinscripcion=P_idinscripcion;
COMMIT;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for trans_inscripcion
-- ----------------------------
DROP PROCEDURE IF EXISTS `trans_inscripcion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `trans_inscripcion`(
p1 int,
p2 int,
p3 int, 
p4 VARCHAR(50), 
p5 VARCHAR(50),
p6 VARCHAR(80),
p7 VARCHAR(8),p8 date,
p9 varchar(13),

p10 varchar(100),
p11 VARCHAR(30),
p12 VARCHAR(100),
p13 VARCHAR(15))
BEGIN 
declare xidconferencia int;  
declare xcontconferencias int;
 declare idMax INT;

  set idMax =(select max(idinscripcion)+1 from  inscripcion );
         if (idMax is null)then
         set idMax=1;
         end if;

 set xidconferencia=0;
set xcontconferencias=15;  
INSERT INTO inscripcion(
idinscripcion,
idtipo_inscripcion,
idinstitucion,
nombres,
apellidos,
dni,
sexo,
fecha_deposito,
tipo_pago,
nro_operacion,
telefono,
email,
estado) 
values(
idMax,
p2,
p3,
p4,
p5,
p6,
p7,
p8,
p9,
p10,
p11,
p12,
p13);

    BUCLE: LOOP
         set xidconferencia = xidconferencia + 1;
        insert into asistente_conferencia (idconferencia,idinscripcion,asistencia) values(xidconferencia,idMax,0);
        set xcontconferencias = xcontconferencias- 1;
            IF xcontconferencias=0 THEN
                LEAVE BUCLE;
            END IF;			
        END LOOP BUCLE;

COMMIT;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_concurso
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_concurso`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_concurso`(op int,
               didconcurso int(11),
               ddescripcion varchar(100),
							 dfecha date,
							 dhora time)
BEGIN
declare idMax int;
CASE op
      when 1 then
        set idMax=(select max(idconcurso)from concurso);
        if (idMax is null) then SET idMax=1;
        else set idMax = idMax+1;
        end if;
        insert into concurso(idconcurso,descripcion,fecha,hora)values (idMax,ddescripcion,dfecha,dhora);

      when 2 then
         update concurso set descripcion=ddescripcion,fecha=dfecha,hora=dhora where (idconcurso=didconcurso);


END CASE;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_conferencia
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_conferencia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_conferencia`(op int,
							 didconferencia int(11),
                                                         didtipo_conferencia int(11),
							 dconferencias varchar(100),
							 dtemas varchar(300),
							 dfecha date,
							 dhora_inicio varchar(11),
							 dhora_termino varchar(11),
							 dponente varchar(200))
BEGIN
declare idMax int;
CASE op
      when 1 then
        set idMax=(select max(idconferencia)from conferencia);
        if (idMax is null) then SET idMax=1;
        else set idMax = idMax+1;
        end if;
        insert into conferencia(idconferencia,idtipo_conferencia,conferencias, temas,fecha,hora_inicio,hora_termino,ponente)values (idMax, didtipo_conferencia, dconferencias,dtemas,dfecha,dhora_inicio,dhora_termino,dponente);

      when 2 then
         update conferencia set idtipo_conferencia=didtipo_conferencia,conferencias=dconferencias,temas=dtemas,fecha=dfecha,hora_inicio=dhora_inicio,hora_termino =dhora_termino,ponente=dponente   where (idconferencia=didconferencia);


END CASE;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_departamento
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_departamento`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_departamento`(op int,
                                    diddepartamento int(11),
                                    ddescripcion varchar(100))
BEGIN
declare idMax int;
CASE op
      when 1 then
        set idMax=(select max(iddepartamento)from departamento);
        if (idMax is null) then SET idMax=1;
        else set idMax = idMax+1;
        end if;
        insert into departamento(iddepartamento,descripcion)values (idMax,ddescripcion);

      when 2 then
         update departamento set descripcion=ddescripcion where (iddepartamento=diddepartamento);


END CASE;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_entregamaterial
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_entregamaterial`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_entregamaterial`(
xidinscripcion int,
xidmaterial int
)
BEGIN
   insert into materiales_inscripcion(
             idinscripcion,
             idmaterial
   )
   values(
           xidinscripcion,
           xidmaterial
   );
   update materiales set cantidad = cantidad - 1 where idmaterial = xidmaterial;

END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_equipos
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_equipos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_equipos`(op int,
                                                         didequipo int(11),
							 didinstitucion int(11),
							 didconcurso int(11),
                                                         ddescripcion varchar(100))
BEGIN
declare idMax int;
CASE op
      when 1 then
        set idMax=(select max(idequipo)from equipos);
        if (idMax is null) then SET idMax=1;
        else set idMax = idMax+1;
        end if;
        insert into equipos(idequipo,idinstitucion,idconcurso,descripcion)values (idMax,didinstitucion,didconcurso,ddescripcion);

      when 2 then
         update equipos set idinstitucion=didinstitucion,idconcurso=didconcurso,descripcion=ddescripcion where (idequipo=didequipo);


END CASE;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_institucion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_institucion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_institucion`(op int,
                                                         didinstitucion int(11),
							 didtipo_institucion int(11),
							 diddepartamento int(11),
                                                         ddescripcion varchar(100))
BEGIN
declare idMax int;
CASE op
      when 1 then
        set idMax=(select max(idinstitucion)from institucion);
        if (idMax is null) then SET idMax=1;
        else set idMax = idMax+1;
        end if;
        insert into institucion(idinstitucion,idtipo_institucion,iddepartamento,descripcion)values (idMax, didtipo_institucion,diddepartamento,ddescripcion);

      when 2 then
         update institucion set idtipo_institucion=didtipo_institucion ,iddepartamento=diddepartamento,descripcion=ddescripcion where ( idinstitucion= didinstitucion);


END CASE;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_materiales
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_materiales`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_materiales`(
							op int,
                            didmaterial int(11),
							ddescripcion varchar(100),
							dcantidad int(11),
							dfinal int(1))
BEGIN
declare idMax int;
CASE op
      when 1 then
        set idMax=(select max(idmaterial)from materiales);
        if (idMax is null) then SET idMax=1;
        else set idMax = idMax+1;
        end if;
        insert into materiales(idmaterial,descripcion,cantidad,final)values (idMax,ddescripcion,dcantidad,dfinal);

      when 2 then
         update materiales 
		 set 
			idmaterial=didmaterial ,
			descripcion=ddescripcion,
			cantidad=dcantidad, 
			final=dfinal
		where ( idmaterial= didmaterial);
END CASE;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_materiales_inscripcion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_materiales_inscripcion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_materiales_inscripcion`(didmaterial int(11),
                                                         didinscripcion int(11),
							 dentregado varchar(1))
BEGIN

         insert into materiales_inscripcion(idmaterial,idinscripcion,entregado)values (didmaterial,didinscripcion,dentregado);


END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_modulos
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_modulos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_modulos`(op int,
                                                         didmodulo int(11),
                                                         didpadre int(11),
                                                         ddescripcion varchar(100),
                                                         durl varchar(100),
                                                         destado int(11),
                                                         dorden int)
BEGIN
declare idMax int;
CASE op
      when 1 then
        set idMax=(select max(idmodulo)from modulos);
        if (idMax is null) then SET idMax=1;
        else set idMax = idMax+1;
        end if;
        insert into modulos(idmodulo,idpadre,descripcion,url,estado,orden)values (idMax,didpadre,ddescripcion,durl,destado,dorden);

      when 2 then
         update modulos set idpadre=didpadre,descripcion=ddescripcion,url=durl,estado=destado,orden=dorden where (idmodulo=didmodulo);


END CASE;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_perfil
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_perfil`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_perfil`(op int,
                                                         didperfil int(11),
                                                         ddescripcion varchar(100))
BEGIN
declare idMax int;
CASE op
      when 1 then
        set idMax=(select max(idperfil)from perfil);
        if (idMax is null) then SET idMax=1;
        else set idMax = idMax+1;
        end if;
        insert into perfil(idperfil,descripcion) values (idMax,ddescripcion);

      when 2 then
         update perfil set descripcion=ddescripcion where (idperfil=didperfil);


END CASE;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_permiso
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_permiso`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_permiso`(op int,
                                                         didmodulo int(11),
                                                         didperfil int(11),
                                                         dhabilitarmodulo tinyint(4))
BEGIN
CASE op
      when 1 then
         insert into permiso(idperfil,idmodulo,habilitarmodulo)values (didperfil,didmodulo,dhabilitarmodulo);

      when 2 then
         update permiso set idmodulo=didmodulo,habilitarmodulo=dhabilitarmodulo where (idperfil=didperfil);


END CASE;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_responsable_concurso
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_responsable_concurso`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_responsable_concurso`(didconcurso int(11),
                                                         didorganizadores int(11))
BEGIN

         insert into responsable_concurso(idconcurso,idorganizadores)values (didconcurso,didorganizadores);


END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_talleres
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_talleres`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_talleres`(op int,
                                         didtalleres int(11),
                                         ddescripcion varchar(100),
					 dfecha date,
					 dhora_inicio varchar(11),
					 dhora_Final varchar(11),
					 dcosto varchar(11),
					 dponente varchar(100))
BEGIN
declare idMax int;
CASE op
      when 1 then
        set idMax=(select max(idtalleres)from talleres);
        if (idMax is null) then SET idMax=1;
        else set idMax = idMax+1;
        end if;
        insert into talleres(idtalleres,descripcion,fecha,hora_inicio,hora_final,costo,ponente)values (idMax,ddescripcion,dfecha,dhora_inicio ,dhora_final,dcosto,dponente);

      when 2 then
         update talleres set descripcion=ddescripcion,fecha=dfecha,  hora_inicio=dhora_inicio, hora_final= dhora_final,costo=dcosto,ponente=dponente  where (idtalleres=didtalleres);


END CASE;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_tipo_conferencia
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_tipo_conferencia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_tipo_conferencia`(op int,
                                                         didtipo_conferencia int(11),
                                                         ddescripcion varchar(100))
BEGIN
declare idMax int;
CASE op
      when 1 then
        set idMax=(select max(idtipo_conferencia)from tipo_conferencia);
        if (idMax is null) then SET idMax=1;
        else set idMax = idMax+1;
        end if;
        insert into tipo_conferencia(idtipo_conferencia,descripcion)values (idMax,ddescripcion);

      when 2 then
         update tipo_conferencia set descripcion=ddescripcion where (idtipo_conferencia=didtipo_conferencia);


END CASE;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_tipo_inscripcion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_tipo_inscripcion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_tipo_inscripcion`(op int,
                                                         didtipo_inscripcion int(11),
                                                         ddescripcion varchar(100))
BEGIN
declare idMax int;
CASE op
      when 1 then
        set idMax=(select max(idtipo_inscripcion)from tipo_inscripcion);
        if (idMax is null) then SET idMax=1;
        else set idMax = idMax+1;
        end if;
        insert into tipo_inscripcion(idtipo_inscripcion,descripcion)values (idMax,ddescripcion);

      when 2 then
         update tipo_inscripcion set descripcion=ddescripcion where (idtipo_inscripcion=didtipo_inscripcion);


END CASE;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_tipo_institucion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_tipo_institucion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_tipo_institucion`(op int,
                                         didtipo_institucion int(11),
                                         ddescripcion varchar(100))
BEGIN
declare idMax int;
CASE op
      when 1 then
        set idMax=(select max(idtipo_institucion)from tipo_institucion);
        if (idMax is null) then SET idMax=1;
        else set idMax = idMax+1;
        end if;
        insert into tipo_institucion(idtipo_institucion,descripcion)values (idMax,ddescripcion);

      when 2 then
         update tipo_institucion set descripcion=ddescripcion where (idtipo_institucion=didtipo_institucion);


END CASE;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_usuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_usuario`(op int,
                                                             didusuario int(11),
                                                             didperfil int(11),
                                                             dnombres varchar(45),
                                                             dapellidos varchar(80),
                                                             dlogin varchar(45),
                                                             dclave varchar(45),                                                           
                                                             dtelefono varchar(15),
							     demail varchar (45))
BEGIN
declare idMax int;
CASE op
      when 1 then
        set idMax=(select max(idusuario)from usuario);
        if (idMax is null) then SET idMax=1;
        else set idMax = idMax+1;
        end if;
        insert into usuario(idusuario,idperfil,nombres,apellidos,login,clave,telefono,email,estado)values(idMax,didperfil ,dnombres,dapellidos,dlogin,dclave,dtelefono,demail,0);

      when 2 then
         update usuario set idperfil=didperfil,nombres=dnombres ,apellidos=dapellidos ,login=dlogin,clave=dclave,telefono=dtelefono,email=demail,estado=0 where (idusuario=didusuario);

      when 3 then
            update usuario set estado=0  where(idusuario=didusuario);

end case;
END;;
DELIMITER ;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `asistente_conferencia` VALUES ('1', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '2', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '3', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '4', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '5', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '6', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '7', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '8', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '9', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '10', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '11', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '12', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '13', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '14', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '15', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '16', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '17', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '18', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '19', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '20', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '21', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '22', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '23', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '24', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '25', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '26', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '27', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '28', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '29', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '30', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '31', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '32', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '33', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '34', '0');
INSERT INTO `asistente_conferencia` VALUES ('1', '35', '0');
INSERT INTO `asistente_conferencia` VALUES ('2', '35', '0');
INSERT INTO `asistente_conferencia` VALUES ('3', '35', '0');
INSERT INTO `asistente_conferencia` VALUES ('4', '35', '0');
INSERT INTO `asistente_conferencia` VALUES ('5', '35', '0');
INSERT INTO `asistente_conferencia` VALUES ('6', '35', '0');
INSERT INTO `asistente_conferencia` VALUES ('7', '35', '0');
INSERT INTO `asistente_conferencia` VALUES ('8', '35', '0');
INSERT INTO `asistente_conferencia` VALUES ('9', '35', '0');
INSERT INTO `asistente_conferencia` VALUES ('10', '35', '0');
INSERT INTO `asistente_conferencia` VALUES ('11', '35', '0');
INSERT INTO `asistente_conferencia` VALUES ('12', '35', '0');
INSERT INTO `asistente_conferencia` VALUES ('13', '35', '0');
INSERT INTO `asistente_conferencia` VALUES ('14', '35', '0');
INSERT INTO `asistente_conferencia` VALUES ('15', '35', '0');
INSERT INTO `conferencias` VALUES ('1', '1', 'php', 'mya', '2013-02-05', '12:00:00', '02:00:00', 'Manuela Ramis');
INSERT INTO `conferencias` VALUES ('2', '1', 'peru pais con futuro', 'analissis perofundo', '2013-02-05', '08:00:00', '10:00:00', 'Apolos');
INSERT INTO `conferencias` VALUES ('3', '1', 'CLIENTE', 'ARQUITECTURA', '2013-02-19', '06:00:00', '08:00:00', 'ING Rucoba');
INSERT INTO `conferencias` VALUES ('4', '1', 'LAS TICS', 'introduccion a las Tics', '2013-02-26', '06:00:00', '08:00:00', 'ING Umbo');
INSERT INTO `departamento` VALUES ('1', 'AMAZONAS');
INSERT INTO `departamento` VALUES ('2', 'ANCASH');
INSERT INTO `departamento` VALUES ('3', 'APURIMAC');
INSERT INTO `departamento` VALUES ('4', 'AREQUIPA');
INSERT INTO `departamento` VALUES ('5', 'AYACUCHO');
INSERT INTO `departamento` VALUES ('6', 'CAJAMARCA');
INSERT INTO `departamento` VALUES ('7', 'CALLAO');
INSERT INTO `departamento` VALUES ('8', 'CUSCO');
INSERT INTO `departamento` VALUES ('9', 'HUANCAVELICA');
INSERT INTO `departamento` VALUES ('10', 'HUANUCO');
INSERT INTO `departamento` VALUES ('11', 'ICA');
INSERT INTO `departamento` VALUES ('12', 'JUNIN');
INSERT INTO `departamento` VALUES ('13', 'LA LIBERTAD');
INSERT INTO `departamento` VALUES ('14', 'LAMBAYEQUE');
INSERT INTO `departamento` VALUES ('15', 'LIMA');
INSERT INTO `departamento` VALUES ('16', 'LORETO');
INSERT INTO `departamento` VALUES ('17', 'MADRE DE DIOS');
INSERT INTO `departamento` VALUES ('18', 'MOQUEGUA');
INSERT INTO `departamento` VALUES ('19', 'PASCO');
INSERT INTO `departamento` VALUES ('20', 'PIURA');
INSERT INTO `departamento` VALUES ('21', 'PUNO');
INSERT INTO `departamento` VALUES ('22', 'SAN MARTIN');
INSERT INTO `departamento` VALUES ('23', 'TACNA');
INSERT INTO `departamento` VALUES ('24', 'TUMBES');
INSERT INTO `departamento` VALUES ('25', 'UCAYALI');
INSERT INTO `informativo` VALUES ('1', '1', '33', '33', '33', '33', null);
INSERT INTO `informativo` VALUES ('2', '1', '33', '33', '33', '33', null);
INSERT INTO `informativo` VALUES ('3', '8', '98', '98', '98', '9', null);
INSERT INTO `informativo` VALUES ('4', '9809', '09', '89', '89', '8', null);
INSERT INTO `informativo` VALUES ('5', '7', '897', '87', '87', '11', null);
INSERT INTO `informativo` VALUES ('6', '7', '897', '87', '87', '8', null);
INSERT INTO `inscripcion` VALUES ('1', '40f5888b67c748df7efba008e7c2f9d2', '1', '24', '', '0', 'Mauro', 'Flores', '70484208', 'M', '2013-04-20', '2013-04-20', '0000-00-00 00:00:00', '1', '123456', '95.00', '966948379', 'mauroflores8193@gmail.com', '0');
INSERT INTO `institucion` VALUES ('1', '1', '15', 'UNIVERSIDAD NACIONAL MAYOR DE SAN MARCOS ');
INSERT INTO `institucion` VALUES ('2', '1', '5', 'UNIVERSIDAD NACIONAL SAN CRISTOBAL DE HUAMANGA');
INSERT INTO `institucion` VALUES ('3', '1', '8', 'UNIVERSIDAD NACIONAL DE SAN ANTONIO ABAD ');
INSERT INTO `institucion` VALUES ('4', '1', '13', 'UNIVERSIDAD NACIONAL DE TRUJILLO ');
INSERT INTO `institucion` VALUES ('5', '1', '4', 'UNIVERSIDAD NACIONAL DE SAN AGUSTÍN ');
INSERT INTO `institucion` VALUES ('6', '1', '21', 'UNIVERSIDAD NACIONAL DEL ALTIPLANO ');
INSERT INTO `institucion` VALUES ('7', '1', '15', 'UNIVERSIDAD NACIONAL DE INGENIERÍA ');
INSERT INTO `institucion` VALUES ('8', '1', '15', 'UNIVERSIDAD NACIONAL AGRARIA LA MOLINA ');
INSERT INTO `institucion` VALUES ('9', '1', '11', 'UNIVERSIDAD NACIONAL SAN LUIS GONZAGA ');
INSERT INTO `institucion` VALUES ('10', '1', '12', 'UNIVERSIDAD NACIONAL DEL CENTRO DEL PERÚ');
INSERT INTO `institucion` VALUES ('11', '1', '16', 'UNIVERSIDAD NACIONAL DE LA AMAZONÍA PERUANA ');
INSERT INTO `institucion` VALUES ('12', '1', '20', 'UNIVERSIDAD NACIONAL DE PIURA ');
INSERT INTO `institucion` VALUES ('13', '1', '6', 'UNIVERSIDAD NACIONAL DE CAJAMARCA ');
INSERT INTO `institucion` VALUES ('14', '1', '15', 'UNIVERSIDAD NACIONAL FEDERICO VILLARREAL ');
INSERT INTO `institucion` VALUES ('15', '1', '10', 'UNIVERSIDAD NACIONAL AGRARIA DE LA SELVA');
INSERT INTO `institucion` VALUES ('16', '1', '10', 'UNIVERSIDAD NACIONAL HERMILIO VALDIZÁN ');
INSERT INTO `institucion` VALUES ('17', '1', '19', 'UNIVERSIDAD NACIONAL DANIEL ALCIDES CARRIÓN ');
INSERT INTO `institucion` VALUES ('18', '1', '7', 'UNIVERSIDAD NACIONAL DEL CALLAO ');
INSERT INTO `institucion` VALUES ('19', '1', '15', 'UNIVERSIDAD NACIONAL DE EDUCACIÓN ENRIQUE GUZMAN Y VALLE');
INSERT INTO `institucion` VALUES ('20', '1', '15', 'UNIVERSIDAD NACIONAL JOSÉ FAUSTINO SÁNCHEZ CARRIÓN ');
INSERT INTO `institucion` VALUES ('21', '1', '14', 'UNIVERSIDAD NACIONAL PEDRO RUIZ GALLO ');
INSERT INTO `institucion` VALUES ('22', '1', '23', 'UNIVERSIDAD NACIONAL JORGE BASADRE GROHMANN ');
INSERT INTO `institucion` VALUES ('23', '1', '2', 'UNIVERSIDAD NACIONAL SANTIAGO ANTÚNEZ DE MAYOLO ');
INSERT INTO `institucion` VALUES ('24', '1', '22', 'UNIVERSIDAD NACIONAL DE SAN MARTÍN ');
INSERT INTO `institucion` VALUES ('25', '1', '25', 'UNIVERSIDAD NACIONAL DE UCAYALI ');
INSERT INTO `institucion` VALUES ('26', '1', '24', 'UNIVERSIDAD NACIONAL DE TUMBES ');
INSERT INTO `institucion` VALUES ('27', '1', '2', 'UNIVERSIDAD NACIONAL DEL SANTA ');
INSERT INTO `institucion` VALUES ('28', '1', '9', 'UNIVERSIDAD NACIONAL DE HUANCAVELICA ');
INSERT INTO `institucion` VALUES ('29', '1', '17', 'UNIVERSIDAD NACIONAL AMAZÓNICA DE MADRE DE DIOS ');
INSERT INTO `institucion` VALUES ('30', '1', '1', 'UNIVERSIDAD NACIONAL TORIBIO RODRIGUEZ DE MENDOZA DE AMAZONAS');
INSERT INTO `institucion` VALUES ('31', '1', '3', 'UNIVERSIDAD NACIONAL MICAELA BASTIDAS DE APURÃMAC ');
INSERT INTO `institucion` VALUES ('32', '2', '15', 'PONTIFICIA UNIVERSIDAD CATÃ“LICA DEL PERÃš');
INSERT INTO `institucion` VALUES ('33', '2', '15', 'UNIVERSIDAD PERUANA CAYETANO HEREDIA');
INSERT INTO `institucion` VALUES ('34', '2', '4', 'UNIVERSIDAD CATÃ“LICA SANTA MARÃA');
INSERT INTO `institucion` VALUES ('35', '2', '15', 'UNIVERSIDAD DEL PACÃFICO ');
INSERT INTO `institucion` VALUES ('36', '2', '15', 'UNIVERSIDAD DE LIMA ');
INSERT INTO `institucion` VALUES ('37', '2', '15', 'UNIVERSIDAD DE SAN MARTÃN DE PORRES ');
INSERT INTO `institucion` VALUES ('38', '2', '15', 'UNIVERSIDAD FEMENINA DEL SAGRADO CORAZÃ“N ');
INSERT INTO `institucion` VALUES ('39', '2', '15', 'UNIVERSIDAD INCA GARCILASO DE LA VEGA');
INSERT INTO `institucion` VALUES ('40', '2', '20', 'UNIVERSIDAD DE PIURA ');
INSERT INTO `institucion` VALUES ('41', '2', '15', 'UNIVERSIDAD RICARDO PALMA');
INSERT INTO `institucion` VALUES ('42', '2', '21', 'UNIVERSIDAD ANDINA NESTOR CÃCERES VELÃSQUEZ');
INSERT INTO `institucion` VALUES ('43', '2', '12', 'UNIVERSIDAD PERUANA LOS ANDES ');
INSERT INTO `institucion` VALUES ('44', '2', '15', 'UNIVERSIDAD PERUANA UNIÃ“N ');
INSERT INTO `institucion` VALUES ('45', '2', '14', 'UNIVERSIDAD PARTICULAR DE CHICLAYO');
INSERT INTO `institucion` VALUES ('46', '2', '8', 'UNIVERSIDAD ANDINA DEL CUSCO');
INSERT INTO `institucion` VALUES ('47', '2', '3', 'UNIVERSIDAD TECNOLÃ“GICA DE LOS ANDES');
INSERT INTO `institucion` VALUES ('48', '2', '23', 'UNIVERSIDAD PRIVADA DE TACNA ');
INSERT INTO `institucion` VALUES ('49', '2', '2', 'UNIVERSIDAD CATÃ“LICA LOS ÃNGELES DE CHIMBOTE ');
INSERT INTO `institucion` VALUES ('50', '2', '2', 'UNIVERSIDAD SAN PEDRO');
INSERT INTO `institucion` VALUES ('51', '2', '13', 'UNIVERSIDAD PRIVADA ANTENOR ORREGO');
INSERT INTO `institucion` VALUES ('52', '2', '10', 'UNIVERSIDAD DE HUÃNUCO');
INSERT INTO `institucion` VALUES ('53', '2', '18', 'UNIVERSIDAD JOSÃ‰ CARLOS MARIÃTEGUI');
INSERT INTO `institucion` VALUES ('54', '2', '15', 'UNIVERSIDAD PRIVADA MARCELINO CHAMPAGNAT');
INSERT INTO `institucion` VALUES ('55', '2', '16', 'UNIVERSIDAD CIENTÃFICA DEL PERÃš');
INSERT INTO `institucion` VALUES ('56', '2', '13', 'UNIVERSIDAD PRIVADA CÃ‰SAR VALLEJO');
INSERT INTO `institucion` VALUES ('57', '2', '13', 'UNIVERSIDAD PRIVADA DEL NORTE');
INSERT INTO `institucion` VALUES ('58', '2', '15', 'UNIVERSIDAD PERUANA DE CIENCIAS APLICADAS ');
INSERT INTO `institucion` VALUES ('59', '2', '15', 'UNIVERSIDAD PRIVADA SAN IGNACIO DE LOYOLA');
INSERT INTO `institucion` VALUES ('60', '2', '14', 'UNIVERSIDAD CATÃ“LICA SANTO TORIBIO DE MOGROVEJO');
INSERT INTO `institucion` VALUES ('61', '2', '15', 'UNIVERSIDAD ALAS PERUANAS ');
INSERT INTO `institucion` VALUES ('62', '2', '15', 'UNIVERSIDAD PRIVADA NORBERT WIENER ');
INSERT INTO `institucion` VALUES ('63', '2', '15', 'ASOCIACIÃ“N UNIVERSIDAD PRIVADA SAN JUAN BAUTISTA');
INSERT INTO `institucion` VALUES ('64', '2', '4', 'UNIVERSIDAD CATÃ“LICA SAN PABLO');
INSERT INTO `institucion` VALUES ('65', '2', '15', 'FACULTAD DE TEOLOGÃA PONTIFICIA Y CIVIL DE LIMA ');
INSERT INTO `institucion` VALUES ('66', '2', '15', 'UNIVERSIDAD TECNOLÃ“GICA DEL PERÃš');
INSERT INTO `institucion` VALUES ('67', '2', '15', 'UNIVERSIDAD CATOLICA SEDES SAPIENTIAE ');
INSERT INTO `institucion` VALUES ('68', '2', '12', 'UNIVERSIDAD CONTINENTAL DE CIENCIA E INGENIERÃA ');
INSERT INTO `institucion` VALUES ('69', '2', '15', 'UNIVERSIDAD CIENTÃFICA DEL SUR ');
INSERT INTO `institucion` VALUES ('70', '2', '6', 'UNIVERSIDAD PRIVADA ANTONIO GUILLERMO URRELO ');
INSERT INTO `institucion` VALUES ('71', '2', '14', 'UNIVERSIDAD PRIVADA SEÃ‘OR DE SIPÃN ');
INSERT INTO `institucion` VALUES ('72', '2', '13', 'UNIVERSIDAD CATÃ“LICA DE TRUJILLO');
INSERT INTO `institucion` VALUES ('73', '2', '15', 'UNIVERSIDAD PERUANA DE CIENCIAS E INFORMÃTICA ');
INSERT INTO `institucion` VALUES ('74', '2', '15', 'UNIVERSIDAD ANTONIO RUIZ DE MONTOYA');
INSERT INTO `institucion` VALUES ('75', '2', '15', 'UNIVERSIDAD ESAN ');
INSERT INTO `institucion` VALUES ('76', '2', '15', 'UNIVERSIDAD PERUANA DE LAS AMÃ‰RICAS');
INSERT INTO `institucion` VALUES ('77', '2', '15', 'UNIVERSIDAD PRIVADA TELESUP ');
INSERT INTO `institucion` VALUES ('78', '1', '18', 'UNIVERSIDAD NACIONAL DE MOQUEGUA ');
INSERT INTO `institucion` VALUES ('79', '1', '25', 'UNIVERSIDAD NACIONAL INTERCULTURAL DE LA AMAZONÃA ');
INSERT INTO `institucion` VALUES ('80', '1', '3', 'UNIVERSIDAD NACIONAL JOSÃ‰ MARÃA ARGUEDAS ');
INSERT INTO `institucion` VALUES ('81', '1', '15', 'UNIVERSIDAD NACIONAL TECNOLÃ“GICA DEL CONO SUR DE LIMA ');
INSERT INTO `institucion` VALUES ('82', '1', '21', 'UNIVERSIDAD NACIONAL DE JULIACA');
INSERT INTO `institucion` VALUES ('83', '1', '6', 'UNIVERSIDAD NACIONAL DE JAÃ‰N');
INSERT INTO `institucion` VALUES ('84', '1', '15', 'UNIVERSIDAD NACIONAL DE CAÃ‘ETE');
INSERT INTO `institucion` VALUES ('85', '1', '6', 'UNIVERSIDAD NACIONAL AUTONOMA DE CHOTA');
INSERT INTO `institucion` VALUES ('86', '1', '15', 'UNIVERSIDAD NACIONAL DE BARRANCA');
INSERT INTO `institucion` VALUES ('87', '1', '20', 'UNIVERSIDAD NACIONAL DE FRONTERA');
INSERT INTO `institucion` VALUES ('88', '1', '1', 'UNIVERSIDAD NACIONAL INTERCULTURAL FABIOLA SALAZAR LEGUÃA DE BAGUA');
INSERT INTO `institucion` VALUES ('89', '1', '12', 'UNIVERSIDAD NACIONAL INTERCULTURAL DE LA SELVA CENTRAL JUAN SANTOS ATAHUALPA');
INSERT INTO `institucion` VALUES ('90', '1', '8', 'UNIVERSIDAD NACIONAL INTERCULTURAL DE QUILLABAMBA');
INSERT INTO `institucion` VALUES ('91', '1', '16', 'UNIVERSIDAD NACIONAL AUTÃ“NOMA DE ALTO AMAZONAS');
INSERT INTO `institucion` VALUES ('92', '1', '12', 'UNIVERSIDAD NACIONAL AUTÃ“NOMA ALTOANDINA DE TARMA');
INSERT INTO `institucion` VALUES ('93', '1', '5', 'UNIVERSIDAD NACIONAL AUTÃ“NOMA DE HUANTA');
INSERT INTO `institucion` VALUES ('94', '1', '15', 'UNIVERSIDAD NACIONAL TECNOLÃ“GICA DE SAN JUAN DE LURIGANCHO');
INSERT INTO `institucion` VALUES ('95', '2', '11', 'UNIVERSIDAD PRIVADA DE ICA ');
INSERT INTO `institucion` VALUES ('96', '2', '9', 'UNIVERSIDAD PARA EL DESARROLLO ANDINO');
INSERT INTO `institucion` VALUES ('97', '2', '15', 'UNIVERSIDAD PRIVADA SERGIO BERNALES ');
INSERT INTO `institucion` VALUES ('98', '2', '25', 'UNIVERSIDAD PRIVADA DE PUCALLPA ');
INSERT INTO `institucion` VALUES ('99', '2', '11', 'UNIVERSIDAD ADA A BYRON');
INSERT INTO `institucion` VALUES ('100', '2', '13', 'UNIVERSIDAD PRIVADA DE TRUJILLO ');
INSERT INTO `institucion` VALUES ('101', '2', '15', 'UNIVERSIDAD PERUANA SIMÃ“N BOLIVAR ');
INSERT INTO `institucion` VALUES ('102', '2', '21', 'UNIVERSIDAD PRIVADA SAN CARLOS ');
INSERT INTO `institucion` VALUES ('103', '2', '15', 'UNIVERSIDAD DE CIENCIAS Y HUMANIDADES ');
INSERT INTO `institucion` VALUES ('104', '2', '16', 'UNIVERSIDAD PERUANA DEL ORIENTE');
INSERT INTO `institucion` VALUES ('105', '2', '15', 'UNIVERSIDAD PERUANA DE INTEGRACIÃ“N GLOBAL');
INSERT INTO `institucion` VALUES ('106', '2', '15', 'UNIVERSIDAD AUTÃ“NOMA DEL PERÃš');
INSERT INTO `institucion` VALUES ('107', '2', '14', 'UNIVERSIDAD PRIVADA JUAN MEJÃA BACA ');
INSERT INTO `institucion` VALUES ('108', '2', '12', 'UNIVERSIDAD PERUANA DEL CENTRO');
INSERT INTO `institucion` VALUES ('109', '2', '15', 'UNIVERSIDAD PRIVADA ARZOBISPO LOAYZA ');
INSERT INTO `institucion` VALUES ('110', '2', '15', 'UNIVERSIDAD LE CORDON BLEU');
INSERT INTO `institucion` VALUES ('111', '2', '15', 'UNIVERSIDAD JAIME BAUSATE Y MEZA');
INSERT INTO `institucion` VALUES ('112', '2', '12', 'UNIVERSIDAD PRIVADA DE HUANCAYO FRANKLIN ROOSEVELT');
INSERT INTO `institucion` VALUES ('113', '2', '14', 'UNIVERSIDAD DE LAMBAYEQUE ');
INSERT INTO `institucion` VALUES ('114', '2', '15', 'UNIVERSIDAD DE CIENCIAS Y ARTES DE AMÃ‰RICA LATINA');
INSERT INTO `institucion` VALUES ('115', '2', '15', 'UNIVERSIDAD PERUANA DE ARTE ORVAL');
INSERT INTO `institucion` VALUES ('116', '2', '4', 'UNIVERSIDAD CIENCIAS DE LA SALUD');
INSERT INTO `institucion` VALUES ('117', '2', '16', 'UNIVERSIDAD PRIVADA DE LA SELVA PERUANA');
INSERT INTO `institucion` VALUES ('118', '2', '5', 'UNIVERSIDAD DE AYACUCHO FEDERICO FROEBEL');
INSERT INTO `institucion` VALUES ('119', '2', '15', 'UNIVERSIDAD PERUANA DE INVESTIGACIÃ“N Y NEGOCIOS');
INSERT INTO `institucion` VALUES ('120', '2', '8', 'UNIVERSIDAD PERUANA AUSTRAL DEL CUSCO');
INSERT INTO `institucion` VALUES ('121', '2', '4', 'UNIVERSIDAD AUTÃ“NOMA SAN FRANCISCO');
INSERT INTO `institucion` VALUES ('122', '2', '15', 'UNIVERSIDAD SAN ANDRÃ‰S');
INSERT INTO `institucion` VALUES ('123', '2', '15', 'UNIVERSIDAD INTERAMERICANA PARA EL DESARROLLO');
INSERT INTO `institucion` VALUES ('124', '2', '15', 'UNIVERSIDAD JUAN PABLO II');
INSERT INTO `institucion` VALUES ('125', '2', '15', 'UNIVERSIDAD AUTÃ“NOMA MUNICIPAL DE LOS OLIVOS');
INSERT INTO `institucion` VALUES ('126', '1', '15', 'UNIVERSIDAD NACIONAL AUTÃ“NOMA DE TAYACAJA DANIEL HERNÃNDEZ MORILLO');
INSERT INTO `institucion` VALUES ('200', '2', '15', 'TECNOLÃ“GICO DE MONTERREY - Sede Lima');
INSERT INTO `institucion` VALUES ('201', '2', '4', 'UNIVERSIDAD ALAS PERUANAS - Sede Arequipa');
INSERT INTO `institucion` VALUES ('202', '2', '15', 'UNIVERSIDAD PRIVADA DEL NORTE - Sede Lima');
INSERT INTO `institucion` VALUES ('203', '2', '14', 'UNIVERSIDAD DE SAN MARTÃN DE PORRES  - Sede Chiclayo');
INSERT INTO `institucion` VALUES ('204', '2', '3', 'UNIVERSIDAD ALAS PERUANAS - Sede Abancay');
INSERT INTO `institucion` VALUES ('206', '2', '5', 'UNIVERSIDAD ALAS PERUANAS - Sede Ayacucho');
INSERT INTO `institucion` VALUES ('207', '2', '6', 'UNIVERSIDAD ALAS PERUANAS - Sede Cajamarca');
INSERT INTO `institucion` VALUES ('208', '2', '19', 'UNIVERSIDAD ALAS PERUANAS - Sede Cerro de Pasco');
INSERT INTO `institucion` VALUES ('209', '2', '1', 'UNIVERSIDAD ALAS PERUANAS - Sede Chachapoyas');
INSERT INTO `institucion` VALUES ('210', '2', '14', 'UNIVERSIDAD ALAS PERUANAS - Sede Chiclayo');
INSERT INTO `institucion` VALUES ('211', '2', '8', 'UNIVERSIDAD ALAS PERUANAS - Sede Cusco');
INSERT INTO `institucion` VALUES ('212', '2', '9', 'UNIVERSIDAD ALAS PERUANAS - Sede Huancavelica');
INSERT INTO `institucion` VALUES ('213', '2', '12', 'UNIVERSIDAD ALAS PERUANAS - Sede Huancayo');
INSERT INTO `institucion` VALUES ('214', '2', '2', 'UNIVERSIDAD ALAS PERUANAS - Sede Chimbote');
INSERT INTO `institucion` VALUES ('215', '2', '15', 'UNIVERSIDAD ALAS PERUANAS - Sede Huacho');
INSERT INTO `institucion` VALUES ('216', '2', '10', 'UNIVERSIDAD ALAS PERUANAS - Sede HuÃ¡nuco');
INSERT INTO `institucion` VALUES ('217', '2', '2', 'UNIVERSIDAD ALAS PERUANAS - Sede Huaraz');
INSERT INTO `institucion` VALUES ('218', '2', '11', 'UNIVERSIDAD ALAS PERUANAS - Sede Ica');
INSERT INTO `institucion` VALUES ('219', '2', '6', 'UNIVERSIDAD ALAS PERUANAS - Sede JaÃ©n');
INSERT INTO `institucion` VALUES ('220', '2', '21', 'UNIVERSIDAD ALAS PERUANAS - Sede Juliaca');
INSERT INTO `institucion` VALUES ('221', '2', '12', 'UNIVERSIDAD ALAS PERUANAS - Sede La Merced');
INSERT INTO `institucion` VALUES ('222', '2', '18', 'UNIVERSIDAD ALAS PERUANAS - Sede Moquegua');
INSERT INTO `institucion` VALUES ('223', '2', '22', 'UNIVERSIDAD ALAS PERUANAS - Sede Moyobamba');
INSERT INTO `institucion` VALUES ('224', '2', '20', 'UNIVERSIDAD ALAS PERUANAS - Sede Piura');
INSERT INTO `institucion` VALUES ('225', '2', '17', 'UNIVERSIDAD ALAS PERUANAS - Sede Puerto Maldonado');
INSERT INTO `institucion` VALUES ('226', '2', '25', 'UNIVERSIDAD ALAS PERUANAS - Sede Pucallpa');
INSERT INTO `institucion` VALUES ('227', '2', '21', 'UNIVERSIDAD ALAS PERUANAS - Sede Puno');
INSERT INTO `institucion` VALUES ('228', '2', '23', 'UNIVERSIDAD ALAS PERUANAS - Sede Tacna');
INSERT INTO `institucion` VALUES ('229', '2', '22', 'UNIVERSIDAD ALAS PERUANAS - Sede Tarapoto');
INSERT INTO `institucion` VALUES ('230', '2', '13', 'UNIVERSIDAD ALAS PERUANAS - Sede Trujillo');
INSERT INTO `institucion` VALUES ('231', '2', '24', 'UNIVERSIDAD ALAS PERUANAS - Sede Tumbes');
INSERT INTO `institucion` VALUES ('232', '2', '15', 'UNIVERSIDAD PRIVADA CÃ‰SAR VALLEJO - Sede Lima');
INSERT INTO `institucion` VALUES ('234', '2', '20', 'UNIVERSIDAD PRIVADA CÃ‰SAR VALLEJO - Sede Piura');
INSERT INTO `institucion` VALUES ('235', '2', '2', 'UNIVERSIDAD PRIVADA CÃ‰SAR VALLEJO - Sede Chimbote');
INSERT INTO `institucion` VALUES ('236', '2', '14', 'UNIVERSIDAD PRIVADA CÃ‰SAR VALLEJO - Sede Chiclayo');
INSERT INTO `institucion` VALUES ('237', '2', '22', 'UNIVERSIDAD PRIVADA CÃ‰SAR VALLEJO - Sede Tarapoto');
INSERT INTO `institucion` VALUES ('238', '2', '21', 'UNIVERSIDAD PERUANA UNIÃ“N - Sede Juliaca');
INSERT INTO `institucion` VALUES ('239', '2', '22', 'UNIVERSIDAD PERUANA UNIÃ“N - Sede Tarapoto');
INSERT INTO `institucion` VALUES ('240', '2', '3', 'UNIVERSIDAD ALAS PERUANAS - Sede Andahuaylas');
INSERT INTO `institucion` VALUES ('241', '2', '13', 'UNIVERSIDAD PRIVADA LEONARDO DA VINCI ');
INSERT INTO `institucion` VALUES ('242', '2', '15', 'UNIVERSIDAD DE INGENIERÃA Y TECNOLOGÃA');
INSERT INTO `institucion` VALUES ('243', '2', '4', 'UNIVERSIDAD LA SALLE ');
INSERT INTO `institucion` VALUES ('244', '2', '23', 'UNIVERSIDAD LATINOAMERICANA CIMA ');
INSERT INTO `institucion` VALUES ('245', '2', '4', 'UNIVERSIDAD PRIVADA AUTÃ“NOMA DEL SUR ');
INSERT INTO `institucion` VALUES ('246', '2', '15', 'UNIVERSIDAD MARÃA AUXILIADORA ');
INSERT INTO `institucion` VALUES ('247', '2', '1', 'UNIVERSIDAD DE LA AMAZONÃA MARIO PELÃEZ BAZÃN ');
INSERT INTO `institucion` VALUES ('248', '2', '15', 'UNIVERSIDAD SANTO DOMINGO DE GUZMÃN ');
INSERT INTO `institucion` VALUES ('249', '2', '7', 'UNIVERSIDAD MARÃTIMA DEL PERÃš ');
INSERT INTO `institucion` VALUES ('250', '2', '8', 'UNIVERSIDAD PERUANA LÃDER PERUANA ');
INSERT INTO `institucion` VALUES ('251', '2', '15', 'UNIVERSIDAD PRIVADA SISE ');
INSERT INTO `institucion` VALUES ('252', '2', '8', 'UNIVERSIDAD GLOBAL DEL CUSCO');
INSERT INTO `institucion` VALUES ('253', '2', '15', 'UNIVERSIDAD PRIVADA PERUANO ALEMANA');
INSERT INTO `institucion` VALUES ('254', '2', '12', 'UNIVERSIDAD SANTO TOMÃS DE AQUINO');
INSERT INTO `institucion` VALUES ('255', '2', '6', 'UNIVERSIDAD SAN PEDRO - Sede Cajamarca');
INSERT INTO `institucion` VALUES ('256', '2', '4', 'UNIVERSIDAD TECNOLÃ“GICA DEL PERÃš - Sede Arequipa');
INSERT INTO `institucion` VALUES ('257', '2', '20', 'UNIVERSIDAD SAN PEDRO - Sede Piura');
INSERT INTO `institucion` VALUES ('258', '2', '11', 'ASOCIACIÃ“N UNIVERSIDAD PRIVADA SAN JUAN BAUTISTA - Sede Chincha');
INSERT INTO `institucion` VALUES ('259', '2', '15', 'UNIVERSIDAD SAN PEDRO - Sede Lima');
INSERT INTO `institucion` VALUES ('260', '1', '12', 'UNIVERSIDAD NACIONAL DANIEL ALCIDES CARRIÃ“N - Sede La Merced');
INSERT INTO `institucion` VALUES ('261', '2', '4', 'UNIVERSIDAD DE SAN MARTÃN DE PORRES - Sede Arequipa');
INSERT INTO `institucion` VALUES ('262', '2', '4', 'UNIVERSIDAD ANDINA NESTOR CÃCERES VELÃSQUEZ - Arequipa');
INSERT INTO `institucion` VALUES ('263', '2', '15', 'UNIVERSIDAD DE PIURA  - Sede Lima');
INSERT INTO `institucion` VALUES ('264', '2', '17', 'UNIVERSIDAD ANDINA DEL CUSCO - Sede Puerto Maldonado');
INSERT INTO `institucion` VALUES ('265', '2', '6', 'UNIVERSIDAD PRIVADA DEL NORTE - Sede Cajamarca');
INSERT INTO `institucion` VALUES ('266', '2', '6', 'UNIVERSIDAD PARTICULAR DE CHICLAYO - Sede JaÃ©n');
INSERT INTO `institucion` VALUES ('267', '1', '12', 'UNIVERSIDAD NACIONAL DANIEL ALCIDES CARRIÃ“N - Sede Tarma');
INSERT INTO `institucion` VALUES ('268', '2', '13', 'UNIVERSIDAD SAN PEDRO - Sede Trujillo');
INSERT INTO `institucion` VALUES ('269', '1', '6', 'UNIVERSIDAD NACIONAL PEDRO RUIZ GALLO - Sede Cutervo');
INSERT INTO `institucion` VALUES ('270', '2', '11', 'ASOCIACIÃ“N UNIVERSIDAD PRIVADA SAN JUAN BAUTISTA - Sede Ica');
INSERT INTO `institucion` VALUES ('271', '2', '11', 'UNIVERSIDAD INCA GARCILASO DE LA VEGA - Sede Chincha');
INSERT INTO `institucion` VALUES ('272', '2', '15', 'UNIVERSIDAD PERUANA LOS ANDES - Sede Lima');
INSERT INTO `institucion` VALUES ('273', '2', '8', 'UNIVERSIDAD TECNOLÃ“GICA DE LOS ANDES - Sede Cusco');
INSERT INTO `institucion` VALUES ('274', '2', '12', 'UNIVERSIDAD DE SAN MARTÃN DE PORRES - Sede Huancayo');
INSERT INTO `institucion` VALUES ('275', '2', '15', 'UNIVERSIDAD SAN PEDRO - Sede Barranca');
INSERT INTO `institucion` VALUES ('276', '2', '15', 'UNIVERSIDAD SAN PEDRO - Sede Huacho');
INSERT INTO `institucion` VALUES ('277', '3', '1', 'OTRO');
INSERT INTO `institucion` VALUES ('278', '3', '2', 'OTRO');
INSERT INTO `institucion` VALUES ('279', '3', '3', 'OTRO');
INSERT INTO `institucion` VALUES ('280', '3', '4', 'OTRO');
INSERT INTO `institucion` VALUES ('281', '3', '5', 'OTRO');
INSERT INTO `institucion` VALUES ('282', '3', '6', 'OTRO');
INSERT INTO `institucion` VALUES ('283', '3', '7', 'OTRO');
INSERT INTO `institucion` VALUES ('284', '3', '8', 'OTRO');
INSERT INTO `institucion` VALUES ('285', '3', '9', 'OTRO');
INSERT INTO `institucion` VALUES ('286', '3', '10', 'OTRO');
INSERT INTO `institucion` VALUES ('287', '3', '11', 'OTRO');
INSERT INTO `institucion` VALUES ('288', '3', '12', 'OTRO');
INSERT INTO `institucion` VALUES ('289', '3', '13', 'OTRO');
INSERT INTO `institucion` VALUES ('290', '3', '14', 'OTRO');
INSERT INTO `institucion` VALUES ('291', '3', '15', 'OTRO');
INSERT INTO `institucion` VALUES ('292', '3', '16', 'OTRO');
INSERT INTO `institucion` VALUES ('293', '3', '17', 'OTRO');
INSERT INTO `institucion` VALUES ('294', '3', '18', 'OTRO');
INSERT INTO `institucion` VALUES ('295', '3', '19', 'OTRO');
INSERT INTO `institucion` VALUES ('296', '3', '20', 'OTRO');
INSERT INTO `institucion` VALUES ('297', '3', '21', 'OTRO');
INSERT INTO `institucion` VALUES ('298', '3', '22', 'OTRO');
INSERT INTO `institucion` VALUES ('299', '3', '23', 'OTRO');
INSERT INTO `institucion` VALUES ('300', '3', '24', 'OTRO');
INSERT INTO `institucion` VALUES ('301', '3', '25', 'OTRO');
INSERT INTO `materiales` VALUES ('1', 'FOLDER', '197', '0');
INSERT INTO `materiales` VALUES ('2', 'CREDENCIAL', '198', '0');
INSERT INTO `materiales` VALUES ('3', 'CERTIFICADO', '197', '1');
INSERT INTO `materiales` VALUES ('4', 'MOCHILA', '197', '0');
INSERT INTO `materiales` VALUES ('5', 'CDS', '1996', '1');
INSERT INTO `materiales_inscripcion` VALUES ('1', '1');
INSERT INTO `materiales_inscripcion` VALUES ('1', '4');
INSERT INTO `materiales_inscripcion` VALUES ('2', '5');
INSERT INTO `materiales_inscripcion` VALUES ('3', '1');
INSERT INTO `materiales_inscripcion` VALUES ('4', '1');
INSERT INTO `materiales_inscripcion` VALUES ('4', '5');
INSERT INTO `materiales_inscripcion` VALUES ('5', '1');
INSERT INTO `materiales_inscripcion` VALUES ('5', '4');
INSERT INTO `materiales_inscripcion` VALUES ('5', '5');
INSERT INTO `modulos` VALUES ('1', '0', 'INSCRIPCION', 'index.php', '0', '1');
INSERT INTO `modulos` VALUES ('2', '0', 'ASISTENCIA', 'Index.php', '0', '2');
INSERT INTO `modulos` VALUES ('3', '0', 'ENTREGA MATERIALES', 'index.php', '0', '3');
INSERT INTO `modulos` VALUES ('4', '0', 'REGISTROS', 'Index.php', '0', '4');
INSERT INTO `modulos` VALUES ('5', '0', 'SEGURIDAD', 'index.php', '0', '5');
INSERT INTO `modulos` VALUES ('6', '0', 'REPORTES', 'Index.php', '0', '6');
INSERT INTO `modulos` VALUES ('7', '5', 'PERFIL', 'index.php?controller=perfil', '0', '1');
INSERT INTO `modulos` VALUES ('8', '5', 'USUARIO', 'index.php?controller=usuario', '0', '2');
INSERT INTO `modulos` VALUES ('9', '5', 'MODULOS', 'index.php?controller=modulos', '0', '3');
INSERT INTO `modulos` VALUES ('10', '5', 'PERMISOS', 'index.php?controller=accesos', '0', '4');
INSERT INTO `modulos` VALUES ('11', '4', 'CONFERENCIAS', 'index.php?controller=conferencia', '0', '1');
INSERT INTO `modulos` VALUES ('12', '4', 'TALLERES', 'index.php?controller=talleres', '0', '2');
INSERT INTO `modulos` VALUES ('13', '4', 'TPO.CONFERENCIAS', 'index.php?controller=tipo_conferencia', '0', '4');
INSERT INTO `modulos` VALUES ('14', '4', 'ORGANIZADORES', 'index.php?controller=organizadores', '0', '3');
INSERT INTO `modulos` VALUES ('15', '3', 'MATERIALES', 'index.php?controller=materiales', '0', '1');
INSERT INTO `modulos` VALUES ('16', '3', 'ENTREGA', 'index.php?controller=entrega', '0', '2');
INSERT INTO `modulos` VALUES ('17', '0', 'CONTROL DE ASISTENCIAS', 'index.php', '0', '6');
INSERT INTO `modulos` VALUES ('18', '2', 'control de asistencias', 'index.php?controller=cliente&action=lista_conferencias', '0', '1');
INSERT INTO `modulos` VALUES ('19', '2', 'ASISTENCIA', 'index.php?controller=asistencia', '0', '1');
INSERT INTO `modulos` VALUES ('20', '6', 'REPORT-MAT', 'index.php?controller=reportes&action=_reportmateriales', '0', '1');
INSERT INTO `modulos` VALUES ('21', '1', 'INSCRIPCION', 'index.php?controller=inscripcion ', '0', '1');
INSERT INTO `perfil` VALUES ('1', 'ADMINISTRADOR');
INSERT INTO `perfil` VALUES ('2', 'USUARIO');
INSERT INTO `perfil` VALUES ('3', 'ADMINISTRADOR DE LA DATA');
INSERT INTO `permiso` VALUES ('1', '20', '1');
INSERT INTO `permiso` VALUES ('1', '6', '1');
INSERT INTO `permiso` VALUES ('1', '10', '1');
INSERT INTO `permiso` VALUES ('1', '9', '1');
INSERT INTO `permiso` VALUES ('1', '8', '1');
INSERT INTO `permiso` VALUES ('1', '7', '1');
INSERT INTO `permiso` VALUES ('1', '5', '1');
INSERT INTO `permiso` VALUES ('1', '14', '1');
INSERT INTO `permiso` VALUES ('1', '13', '1');
INSERT INTO `permiso` VALUES ('1', '12', '1');
INSERT INTO `permiso` VALUES ('1', '11', '1');
INSERT INTO `permiso` VALUES ('1', '4', '1');
INSERT INTO `permiso` VALUES ('1', '16', '1');
INSERT INTO `permiso` VALUES ('1', '15', '1');
INSERT INTO `permiso` VALUES ('1', '3', '1');
INSERT INTO `permiso` VALUES ('1', '19', '1');
INSERT INTO `permiso` VALUES ('1', '2', '1');
INSERT INTO `permiso` VALUES ('1', '21', '1');
INSERT INTO `permiso` VALUES ('1', '1', '1');
INSERT INTO `talleres` VALUES ('1', 'CMS DRUPAL', '2013-02-07', '02:00:00', '04:00:00', '30.00', 'Ing CRISTHIAN');
INSERT INTO `talleres` VALUES ('2', 'PHP Y MYSQL', '2013-02-01', '05:50:00', '07:00:00', '40.00', 'Ing INJANTE');
INSERT INTO `talleres` VALUES ('3', 'CMS DRUPAL', '2013-02-09', '02:00:00', '00:05:00', '30.00', 'Ing ALBERTO');
INSERT INTO `talleres` VALUES ('4', 'oracle', '2013-02-28', '04:00:00', '06:00:00', '50.00', 'Francklin');
INSERT INTO `talleres` VALUES ('8', 'CMS DRUPAL', '2013-02-07', '02:00:00', '04:00:00', '30.00', 'Ing CRISTHIAN');
INSERT INTO `talleres` VALUES ('9', 'PHP Y MYSQL', '2013-02-01', '05:50:00', '07:00:00', '40.00', 'Ing INJANTE');
INSERT INTO `talleres` VALUES ('10', 'CMS DRUPAL', '2013-02-09', '02:00:00', '00:05:00', '30.00', 'Ing ALBERTO');
INSERT INTO `talleres` VALUES ('11', 'oracle', '2013-02-28', '04:00:00', '06:00:00', '50.00', 'Francklin');
INSERT INTO `talleres` VALUES ('12', 'php orientada a objetos', '2013-03-22', '10:00:00', '12:00:00', '120.00', 'ERICSON VALLES');
INSERT INTO `tipo_conferencia` VALUES ('1', 'REGIONAL');
INSERT INTO `tipo_conferencia` VALUES ('2', 'NACIONALES');
INSERT INTO `tipo_inscripcion` VALUES ('1', 'Estudiante');
INSERT INTO `tipo_inscripcion` VALUES ('2', 'Profesional');
INSERT INTO `tipo_inscripcion` VALUES ('3', 'Bachiller');
INSERT INTO `tipo_inscripcion` VALUES ('4', 'Estudiante de la UNSM');
INSERT INTO `tipo_inscripcion` VALUES ('5', 'Otros');
INSERT INTO `usuario` VALUES ('1', '1', 'ADMINISTRADOR', 'SISTEMA WEB', 'admin', '123', '942653592', 'admin@gmail.com', '1');
