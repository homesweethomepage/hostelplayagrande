<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Playa Grande Hostels</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/font-awesome.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
  <link rel="shortcut icon" href="images/ico/favicon.png">
</head>
<body>
  <header>
    <div class="container">
      <div class="row">
        <div class="col-md-4 col-md-offset-4 logo-reserva">
          <img src="images/logo4.png" alt="Logo" class="img-responsive">
        </div>
      </div>
    </div>
  </header>

  <section id="reservation" class="container"><!-- CONTAINER RESERVA -->

    <form class="well form-horizontal box-shadow form-orange" action="" method="post"  id="contact_form"  enctype="multipart/form-data">
      <fieldset>

        <!-- Form Name -->
        <legend>RESERVA</legend>

        <!-- Text input-->

        <div class="form-group">
          <label class="col-md-4 control-label">Nombre</label>
          <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-user"></i></span>
              <input  name="first_name" placeholder="Nombre" class="form-control" type="text">
            </div>
          </div>
        </div>

        <!-- Text input-->

        <div class="form-group">
          <label class="col-md-4 control-label" >Apellido</label>
          <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-user"></i></span>
              <input name="last_name" placeholder="Apellido" class="form-control"  type="text">
            </div>
          </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label">E-Mail</label>
          <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
              <input name="email" placeholder="Direccion de e-mail" class="form-control"  type="text">
            </div>
          </div>
        </div>


        <!-- Text input-->

        <div class="form-group">
          <label class="col-md-4 control-label">Teléfono #</label>
          <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-phone"></i></span>
              <input name="phone" placeholder="54(223)451-7307" class="form-control" type="text">
            </div>
          </div>
        </div>

        <!-- Select Basic -->

        <div class="form-group">
          <label class="col-md-4 control-label">Hostel</label>
          <div class="col-md-4 selectContainer">
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-h-square"></i></span>
              <select name="hostel" class="form-control selectpicker" disabled>
                <option value="any">Todos los hostels</option>
                <option value="hpg" {if $req['hostel'] eq "hpg"}selected{/if}>Playa Grande</option>
                <option value="hpga" {if $req['hostel'] eq "hpga"}selected{/if}>Playa Grande Austral</option>
                <option value="hpgs" {if $req['hostel'] eq "hpgs"}selected{/if}>Playa Grande Suites</option>
              </select>
            </div>
          </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
          <label class="col-md-4 control-label">Habitación</label>
          <div class="col-md-4 selectContainer">
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-bed"></i></span>
              <select name="room" class="form-control selectpicker" disabled>
                <option value="0">Single c/baño privado</option>
                <option value="1" {if $req['habitacion'] eq "1"}selected{/if}>Doble 2 camas c/baño privado</option>
                <option value="2" {if $req['habitacion'] eq "2"}selected{/if}>Doble matrimonial camas c/baño privado</option>
                <option value="3" {if $req['habitacion'] eq "3"}selected{/if}>Triple c/baño privado</option>
                <option value="4" {if $req['habitacion'] eq "4"}selected{/if}>Cuadruple c/baño privado</option>
                <option value="5" {if $req['habitacion'] eq "5"}selected{/if}>5/6 c/baño privado</option>
                <option value="6" {if $req['habitacion'] eq "6"}selected{/if}>8 c/baño privado</option>
              </select>
            </div>
          </div>
        </div>

        <div class="form-group">
          <label for="check-in" class="col-md-4 control-label">Desde</label>
          <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
              <input name="check-in" class="form-control" type="text" id="input-fecha-check-in" value="{$req['checkin']}" disabled>
            </div>
          </div>
        </div>

        <div class="form-group">
          <label for="check-out" class="col-md-4 control-label">Hasta</label>
          <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
              <input name="check-out" class="form-control" type="text" id="input-fecha-check-out" value="{$req['checkout']}" disabled>
            </div>
          </div>
        </div>

        <div class="form-group">
          <label for="img_comprobante" class="col-md-4 control-label">Comprobante</label>
          <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-file"></i></span>
              <div class="inputFile btn btn-default">
                <input name="input-aux" class="form-control input-aux btn btn-default" type="text">
                <input type="file" class="form-control input-file" name="img_comprobante" required/>
              </div>
            </div>
          </div>
        </div>

        <div class="form-group">
          <label class="col-md-4 control-label">Comentario</label>
          <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-comment"></i></span>
              <textarea class="form-control" name="comment" placeholder="Escribe un comentario..."></textarea>
            </div>
          </div>
        </div>

        <!-- Success message -->
        <div class="alert alert-success" role="alert" id="success_message">Enviado con éxito! <i class="glyphicon glyphicon-thumbs-up"></i> Gracias por contactarse con nosotros, nos comunicaremos a la brevedad.</div>

        <!-- Button -->
        <div class="form-group">
          <label class="col-md-4 control-label"></label>
          <div class="col-md-4">
            <button id="boton-reserva" type="submit" class="btn btn-enviar-orange pull-right">Enviar <span class="glyphicon glyphicon-send"></span></button>
          </div>
        </div>

      </fieldset>
    </form>
  </section>
</div><!-- ./CONTAINER RESERVA -->



<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js"></script>
<script type="text/javascript" src="js/date.js"></script>
<script type="text/javascript" src="js/form.js"></script>
<script type="text/javascript" src="js/reserva.js"></script>
</body>
</html>
