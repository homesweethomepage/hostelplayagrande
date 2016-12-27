<?php

if($_POST){
    $name = $_REQUEST['first_name'];
    $apellido = $_REQUEST['last_name'];
    $email = $_REQUEST['email'];
    $phone = $_REQUEST['phone'];
    $hostel = $_REQUEST['hostel'];
    $room = $_REQUEST['room'];
    $checkIn = $_REQUEST['checkIn'];
    $checkOut = $_REQUEST['checkOut'];
    $comment = $_REQUEST['comement'];

    $to = "tomasgispert@gmail.com";

    $mensaje =
		"Nombre: " .$name ."\r\n"
    ."Apellido: " .$apellido ."\r\n"
		."Email: " .$email ."\r\n"
    ."Teléfono: " .$phone ."\r\n" ."\r\n"
    ."Check In: " .$checkIn ."\r\n"
    ."Check Out: " .$checkOut ."\r\n" ."\r\n"
    ."Hostel: " .$hostel ."\r\n"
    ."Habitacion: " .$room ."\r\n" ."\r\n"
    ."Comentario: " .$comment ."\r\n"
		;

	$subject = "HPG Web - Reserva de: " .$email;

	$header = "From: " .$email ."\r\n";
	$header.= "MIME-Version: 1.0\r\n";
	$header.= "Content-Type: text/plain; charset=utf-8\r\n";
	$header.= "X-Priority: 1\r\n";

    mail($to,$subject,$mensaje,$header);
}

?>
