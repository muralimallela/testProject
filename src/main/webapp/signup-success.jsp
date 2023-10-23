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
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Space Grotesk', sans-serif;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	background-image: url('images/back1.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	color: white;
}

::-webkit-scrollbar {
	width: 2px;
	background: #162938;
}

::-webkit-scrollbar-thumb {
	background: #fff;
	border-radius: 6px;
}

.header {
	position: fixed;
	background-color: #162938;
	color: #fff;
	top: 0;
	left: 0;
	width: 100%;
	padding: 1px 70px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	z-index: 99;
}

.navigation a {
	position: relative;
	font-size: 1.1em;
	color: #fff;
	text-decoration: none;
	font-weight: 500;
	margin-left: 10px;
}

.navigation a::after {
	content: "";
	position: absolute;
	left: 0;
	bottom: -7px;
	width: 100%;
	height: 3px;
	background: #fff;
	border-radius: 5px;
	transform-origin: right;
	transform: scaleX(0);
	transition: transform 0.5s;
}

.navigation a:hover::after {
	transform-origin: left;
	transform: scaleX(1);
}

.navigation .btnlogin-user {
	width: 90px;
	height: 30px;
	background: transparent;
	border: 2px solid #fff;
	outline: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 1.1em;
	color: #fff;
	font-weight: 500;
	margin-left: 10px;
	transition: 0.5s;
}

.navigation .btnlogin-user:hover {
	background: #fff;
	color: #162938;
}

.navigation .btnlogin-admin {
	width: 140px;
	height: 30px;
	background: transparent;
	border: 2px solid #fff;
	outline: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 1.1em;
	color: #fff;
	font-weight: 500;
	margin-left: 10px;
	transition: 0.5s;
}

.navigation .btnlogin-admin:hover {
	background: #fff;
	color: #162938;
}
.container{
	padding-top:80px;
}
.jumbotron{
	background-color: rgba(0, 0, 0, 0.4);
	text-align:center;
	border:2px solid white;
	border-radius: 50px;
}

</style>
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
