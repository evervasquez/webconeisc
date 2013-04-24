<?php

$nombre=$_POST['nombre'];
$email=$_POST['email'];
$asunto=$_POST['asunto'];
$text=$_POST['text'];

$cuerpo = "<font color='#96454B' size='2' face='Georgia, Arial, sans-serif'><b>DATOS DE CONTACTO</b></font><br /><br />";
$cuerpo .= "<table width='100%' border='0' cellspacing='0' cellpadding='0'>
  <tr>
    <td width='140' height='28'><font color='#96454B' size='2' face='Georgia, Arial, sans-serif'>Nombre:</font></td>
    <td height='28'><font color='#627177' size='2' face='Georgia, Arial, sans-serif'>" . $nombre . "</font></td>
  </tr>
  <tr>
    <td height='28'><font color='#96454B' size='2' face='Georgia, Arial, sans-serif'>E-mail:</font></td>
    <td height='28'><font color='#627177' size='2' face='Georgia, Arial, sans-serif'>" . $email . "</font></td>
  </tr>
  <tr>
    <td height='28'><font color='#96454B' size='2' face='Georgia, Arial, sans-serif'>Mensaje:</font></td>
    <td height='28'><font color='#627177' size='2' face='Georgia, Arial, sans-serif'>" . $text . "</font></td>
  </tr>
</table>";
$cuerpo .= "<br />";
$cuerpo .= "<font color='#96454B' size='2' face='Georgia, Arial, sans-serif'>";
$cuerpo .= "<p>Enviado el " . date('d/m/Y', time()) . "</p>";
$cuerpo .= "<p><b>DATOS ENVIADOS DEL FORMULARIO DE CONTACTO";
$cuerpo .= "<br />CONEISC.PE</b></p>";
$cuerpo .= "</font>";

$para = "informes@coneisc.pe";

function mail_utf8($to, $subject = '(No subject)', $message = '', $header = '') {
    $header_ = 'MIME-Version: 1.0' . "\r\n" . 'Content-type: text/html; charset=UTF-8' . "\r\n";
    mail($to, '=?UTF-8?B?' . base64_encode($subject) . '?=', $message, $header_ . $header);
}

mail_utf8($para, $asunto, $cuerpo);

?>

<script>
alert('Mensaje Enviado');
window.location="contactenos/";
</script>