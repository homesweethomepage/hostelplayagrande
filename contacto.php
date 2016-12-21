<?php

if($_POST){
    $name = $_REQUEST['nombre'];
    $email = $_REQUEST['email'];
    $asunto = $_REQUEST['asunto'];
    $comentario = $_REQUEST['comentario'];

    $to = "tomasgispert@gmail.com";

    $mensaje =
		"Nombre: " .$name ."\r\n" ."\r\n"
		."Email: " .$email ."\r\n" ."\r\n"
    ."Asunto: " .$asunto ."\r\n" ."\r\n"
    ."Comentario: " .$comentario
		;

	$subject = "HPG - Comentario de: " .$email;

	$header = "From: " .$email ."\r\n";
	$header.= "MIME-Version: 1.0\r\n";
	$header.= "Content-Type: text/plain; charset=utf-8\r\n";
	$header.= "X-Priority: 1\r\n";

    mail($to,$subject,$mensaje,$header);
}

?>
