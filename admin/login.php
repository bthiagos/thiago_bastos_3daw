<!DOCTYPE html>
<html lang="pt-br">

<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

	<title>Admin | Tocumfome</title>


	<?php include('./header.php'); ?>
	<?php include('./db_connect.php'); ?>
	<?php
	session_start();
	if (isset($_SESSION['login_id']))
		header("location:index.php?page=home");

	$query = $conn->query("SELECT * FROM system_settings limit 1")->fetch_array();
	foreach ($query as $key => $value) {
		if (!is_numeric($key))
			$_SESSION['setting_' . $key] = $value;
	}
	?>

</head>
<style>
	/*author:starttemplate*/
	/*reference site : starttemplate.com*/
	body {
		background-image: url('https://images.unsplash.com/photo-1516054719048-38394ee6cf3e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80');
		background-position: center;
		background-size: cover;

		-webkit-font-smoothing: antialiased;
		font: normal 14px Roboto, arial, sans-serif;
		font-family: Helvetica, sans-serif !important;
	}

	.container {
		padding: 110px;
	}

	::placeholder {
		/* Chrome, Firefox, Opera, Safari 10.1+ */
		color: #ffffff !important;
		opacity: 1;
		/* Firefox */
		font-size: 18px !important;
	}

	.form-login {
		background-color: rgba(0, 0, 0, 0.55);
		padding-top: 10px;
		padding-bottom: 20px;
		padding-left: 20px;
		padding-right: 20px;
		border-radius: 15px;
		border-color: #d2d2d2;
		border-width: 5px;
		color: white;
		box-shadow: 0 1px 0 #cfcfcf;
	}

	.form-control {
		background: transparent !important;
		color: white !important;
		font-size: 18px !important;
	}

	h1 {
		color: white !important;
	}

	h4 {
		border: 0 solid #fff;
		border-bottom-width: 1px;
		padding-bottom: 10px;
		text-align: center;
	}

	.form-control {
		border-radius: 10px;
	}

	.text-white {
		color: white !important;
	}

	.wrapper {
		text-align: center;
	}

	.footer p {
		font-size: 18px;
	}
</style>

<body>


	<main id="main">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-5 col-md-4 text-center">
					<h1 class='text-white'>Área Restrita</h1>
					<form id="login-form">
						<div class="form-login"></br>
							<h4>Login Seguro</h4>
							</br>
							<input type="text" id="username" name="username" class="form-control" placeholder="Usuário" />
							</br></br>
							<input type="password" id="password" name="password" class="form-control" placeholder="Senha" />
							</br></br>
							<div class="wrapper">
								<span class="group-btn">
									<button class="btn-sm btn-block btn-wave col-md-4 btn-primary">Entrar <i class="fa fa-sign-in"></i></button>
								</span>
							</div>
						</div>
					</form>
				</div>
			</div>
			</br></br></br>
			<!--footer-->
			<div class="footer text-white text-center">
				<p>Copyright © 2020 - Thiago Bastos | <a href="https://www.tocumfome.com/" target="_blank">Tocumfome</a></p>
			</div>
			<!--//footer-->
		</div>

	</main>

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>


</body>
<script>
	$('#login-form').submit(function(e) {
		e.preventDefault()
		$('#login-form button[type="button"]').attr('disabled', true).html('Entrando...');
		if ($(this).find('.alert-danger').length > 0)
			$(this).find('.alert-danger').remove();
		$.ajax({
			url: 'ajax.php?action=login',
			method: 'POST',
			data: $(this).serialize(),
			error: err => {
				console.log(err)
				$('#login-form button[type="button"]').removeAttr('disabled').html('Login');

			},
			success: function(resp) {
				if (resp == 1) {
					location.href = 'index.php?page=home';
				} else if (resp == 2) {
					location.href = 'voting.php';
				} else {
					$('#login-form').prepend('<div class="alert alert-danger">Usuário ou Senha incorretos</div>')
					$('#login-form button[type="button"]').removeAttr('disabled').html('Login');
				}
			}
		})
	})
</script>

</html>