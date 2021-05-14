<?php
session_start();
if (!isset($_SESSION['user_login_status']) and $_SESSION['user_login_status'] != 1) {
	header("location: login.php");
	exit;
}

require_once("config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
require_once("config/conexion.php"); //Contiene funcion que conecta a la base de datos

$active_productos = "active";
$title = "Inventario | Control de Almacén";
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
					<button type='button' class="btn btn-success" data-toggle="modal" data-target="#nuevoProducto"><span class="glyphicon glyphicon-plus"></span> Agregar</button>
				</div>
				<h4><i class='glyphicon glyphicon-search'></i> Consultar inventario</h4>
			</div>
			<div class="panel-body">

				<?php
				include("modal/registro_productos.php");
				include("modal/editar_productos.php");
				?>
				<form class="form-horizontal" role="form" id="datos">

					<div class="row">
						<div class='col-md-8'>
							<label>Filtrar por código o nombre del producto, categoria, estante o pasillo</label>
							<input type="text" class="form-control" id="q" placeholder="Código o nombre del producto, categoria, estante o pasillo" onkeyup='load(1);'>
						</div><br/><br/><br/><br/>

						<!-- <div class='col-md-4'>
							<label>Filtrar por categoría</label>
							<select class='form-control' name='id_categoria' id='id_categoria' onchange="load(1);">
								<option value="">Selecciona una categoría</option>
								<?php
								$query_categoria = mysqli_query($con, "select * from categorias order by nombre_categoria");
								while ($rw = mysqli_fetch_array($query_categoria)) {
								?>
									<option value="<?php echo $rw['id_categoria']; ?>"><?php echo $rw['nombre_categoria']; ?></option>
								<?php
								}
								?>
							</select>
						</div>

						<div class='col-md-4'>
							<label>Filtrar por pasillo</label>
							<select class='form-control' name='id_pasillo' id='id_pasillo' onchange="load(1);">
								<option value="">Selecciona un pasillo</option>
								<?php
								$query_pasillo = mysqli_query($con, "select * from pasillos order by nombre_pasillo");
								while ($rw = mysqli_fetch_array($query_pasillo)) {
								?>
									<option value="<?php echo $rw['id_pasillo']; ?>"><?php echo $rw['nombre_pasillo']; ?></option>
								<?php
								}
								?>
							</select>
						</div>

						<div class='col-md-4'>
							<label>Filtrar por estante</label>
							<select class='form-control' name='id_estante' id='id_estante' onchange="load(1);">
								<option value="">Selecciona un estante</option>
								<?php
								$query_estante = mysqli_query($con, "select * from estantes order by nombre_estante");
								while ($rw = mysqli_fetch_array($query_estante)) {
								?>
									<option value="<?php echo $rw['id_estante']; ?>"><?php echo $rw['nombre_estante']; ?></option>
								<?php
								}
								?>
							</select>
						</div>-->

						<div class='col-md-12 text-center'>
							<span id="loader"></span>
						</div>
					</div>
					<hr>
					<div class='row-fluid'>
						<div id="resultados"></div><!-- Carga los datos ajax -->
					</div>
					<div class='row'>
						<div class='outer_div'></div><!-- Carga los datos ajax -->
					</div>
				</form>
			</div>
		</div>

	</div>
	<hr>
	<?php
	include("footer.php");
	?>
	<script type="text/javascript" src="js/productos.js"></script>
</body>

</html>
<script>
	function eliminar(id) {
		var q = $("#q").val();
		var id_categoria = $("#id_categoria").val();
		var id_pasillo = $("#id_pasillo").val();
		var id_estante = $("#id_estante").val();
		$.ajax({
			type: "GET",
			url: "./ajax/buscar_productos.php",
			data: "id=" + id,
			"q": q + "id_categoria=" + id_categoria,
			"q": q + "id_pasillo=" + id_pasillo,
			"q": q + "id_estante=" + id_estante,
			beforeSend: function(objeto) {
				$("#resultados").html("Mensaje: Cargando...");
			},
			success: function(datos) {
				$("#resultados").html(datos);
				load(1);
			}
		});
	}

	$(document).ready(function() {

		<?php
		if (isset($_GET['delete'])) {
		?>
			eliminar(<?php echo intval($_GET['delete']) ?>);
		<?php
		}

		?>
	});

	$("#guardar_producto").submit(function(event) {
		$('#guardar_datos').attr("disabled", true);

		var parametros = $(this).serialize();
		$.ajax({
			type: "POST",
			url: "ajax/nuevo_producto.php",
			data: parametros,
			beforeSend: function(objeto) {
				$("#resultados_ajax_productos").html("Mensaje: Cargando...");
			},
			success: function(datos) {
				$("#resultados_ajax_productos").html(datos);
				$('#guardar_datos').attr("disabled", false);
				load(1);
			}
		});
		event.preventDefault();
	})
</script>