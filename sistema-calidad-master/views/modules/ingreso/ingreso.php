<style type="text/css">
	body {
	  padding-top: 40px;
	  padding-bottom: 40px;
	  background-color: #eee;
	}
	.form-signin {
	  max-width: 330px;
	  padding: 15px;
	  margin: 0 auto;
	}
	.form-signin .form-signin-heading,
	.form-signin .checkbox {
	  margin-bottom: 10px;
	}
	.form-signin .checkbox {
	  font-weight: normal;
	}
	.form-signin .form-control {
	  position: relative;
	  height: auto;
	  -webkit-box-sizing: border-box;
	          box-sizing: border-box;
	  padding: 10px;
	  font-size: 16px;
	}
	.form-signin .form-control:focus {
	  z-index: 2;
	}
	.form-signin input[type="email"] {
	  margin-bottom: -1px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	.form-signin input[type="password"] {
	  margin-bottom: 10px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
</style>
<img src="views/bootstrap/img/logo_rokagym.jpg" class="rounded mx-auto d-block" alt="..." style="width: 200px;">
<form class="form-signin" action="index.php" method="post">
	<h2 class="form-signin-heading text-center">Ingresa</h2>
	<label for="inputEmail" class="sr-only">Email address</label>
	<input name="nombre" type="text" id="inputNombre" class="form-control" placeholder="Nombre de usuario" required autofocus>
	<label for="inputPassword" class="sr-only">Password</label>
	<input name="password" type="password" id="inputPassword" class="form-control" placeholder="Contraseña" required>
	<?php 
		$ingreso = new Ingreso();
		$ingreso->ingresoController();
	?>
	<?php if (!isset($_SESSION['nombreAdmin'])) {
		include 'btn.php';
	}?>
</form>
