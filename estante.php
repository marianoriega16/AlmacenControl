<?php
session_start();
if (!isset($_SESSION['user_login_status']) and $_SESSION['user_login_status'] != 1) {
    header("location: login.php");
    exit;
}

require_once("config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
require_once("config/conexion.php"); //Contiene funcion que conecta a la base de datos

$active_estante = "active";
$title = "Estantes | Control de Almacén";
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <?php include("head.php"); ?>
</head>

<body>
    <?php
    include("navbar.php");
    ?>

    <div class="container">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="btn-group pull-right">
                    <button type='button' class="btn btn-success" data-toggle="modal" data-target="#nuevoCliente"><span class="glyphicon glyphicon-plus"></span> Nuevo Estante</button>
                </div>
                <h4><i class='glyphicon glyphicon-search'></i> Buscar Estantes</h4>
            </div>
            <div class="panel-body">

                <?php
                include("modal/registro_estante.php");
                include("modal/editar_estante.php");
                ?>
                <form class="form-horizontal" role="form" id="datos_cotizacion">

                    <div class="form-group row">
                        <label for="q" class="col-md-2 control-label">Nombre</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="q" placeholder="Nombre del pasillo" onkeyup='load(1);'>
                        </div>
                        <div class="col-md-3">
                            <button type="button" class="btn btn-default" onclick='load(1);'>
                                <span class="glyphicon glyphicon-search"></span> Buscar</button>
                            <span id="loader"></span>
                        </div>
                    </div>
                </form>
                <div id="resultados"></div><!-- Carga los datos ajax -->
                <div class='outer_div'></div><!-- Carga los datos ajax -->
            </div>
        </div>

    </div>
    <hr>
    <?php
    include("footer.php");
    ?>
    <script type="text/javascript" src="js/estantes.js"></script>
</body>

</html>