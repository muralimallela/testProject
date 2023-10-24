<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Signup Success</title>
<!-- Link to Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/signup-success.css">
</head>
<body>
	<div class="header">
		<img src="images/SaiSpruthi.jpg" style="border-radius: 10px;"
			width=20% height=50>
		<nav class="navigation">
			<a href="index.html">Home</a> <a href="#">About</a> <a href="#">Services</a>
			<a href="#">Contact</a>
			<button class="btnlogin-user"
				onclick="window.location.href='studentLogin'">Login</button>
			<button class="btnlogin-admin"
				onclick="window.location.href='adminLogin'">Admin Login</button>
		</nav>
	</div>

	<div class="container mt-5">
		<div class="jumbotron">
			<h1 class="display-4">Signup Successful!</h1>
			<p class="lead">Thank you for signing up. You can now proceed to
				the login page to access your account.</p>
			<p class="lead">
				<a class="btn btn-primary btn-lg" href="studentLogin" role="button">Go
					to Login</a>
			</p>
		</div>
	</div>
	<!-- Link to Bootstrap JS and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
