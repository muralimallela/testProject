<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSIT : Sai Spurthi Institute of Technology</title>
<script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Space+Grotesk&display=swap')
	;

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
	color: #fff;
}

.header {
	position: absolute;
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

.card {
	left: 35%;
	right: auto;
	margin-top: 80px;
	position: absolute;
	width: 400px;
	height: 400px;
	background: transparent;
	border: 2px solid whitesmoke;
	border-radius: 20px;
	backdrop-filter: blur(2px);
	box-shadow: 0 0 30px rgba(0, 0, 0, 1);
	display: flex;
	justify-content: center;
	align-items: center;
	transition: transform 0.5s, height 0.1s ease;
	overflow: hidden;
	background-color: rgba(0, 0, 0, 0.2);
}

.card .form-box {
	width: 100%;
	padding: 40px;
}

.card .form-box h2 {
	font-size: 2em;
	text-align: center;
	color: whitesmoke;
}

.input-box {
	position: relative;
	width: 100%;
	height: 50px;
	border-bottom: 2px solid whitesmoke;
	margin: 30px 0;
}

.input-box label {
	position: absolute;
	top: 50%;
	left: 5px;
	transform: translateY(-50%);
	font-size: 1em;
	color: whitesmoke;
	pointer-events: none;
	transition: 0.5s;
}

.input-box input:focus ~label, .input-box input:valid ~label {
	top: -5px;
}

.input-box input {
	width: 100%;
	height: 100%;
	background: transparent;
	border: none;
	outline: none;
	font-size: 1em;
	color: whitesmoke;
	font-weight: 500;
	padding: 0 35px 0 5px;
}

.input-box .icons {
	position: absolute;
	right: 8px;
	font-size: 1.2em;
	color: whitesmoke;
}

.remember-me {
	font-size: 0.9em;
	color: whitesmoke;
	font-weight: 500;
	margin: -15px 0 15px;
	display: flex;
	justify-content: space-between;
}

.remember-me label input {
	accent-color: whitesmoke;
	margin-right: 3px;
}

.remember-me a {
	color: whitesmoke;
	text-decoration: none;
}

.remember-me a:hover {
	text-decoration: underline;
}

.btn {
	width: 100%;
	height: 45px;
	background: #162938;
	outline: none;
	border-radius: 6px;
	border: none;
	cursor: pointer;
	font-size: 1em;
	color: #fff;
	font-weight: 500;
}

.btn:hover{
	color:#fff;
}


.login-register {
	font-size: 0.9em;
	color: #fff;
	text-align: center;
	font-weight: 500;
	margin: 25px 0 10px;
}


.login-register p{
	
}
.login-register a{
	color:#63DBDB;
	font-size: 1.2em;
}

.login-register  a:hover {
	font-style:italic;
	text-decoration: none;
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


		<div class="card ">

			<div class="form-box login">
				<h2>Student Login</h2>
				<c:if test="${not empty errorMessage}">
					<p style="color: #F08080;text-align:center">${errorMessage}</p>
				</c:if>
				<form action="StudentLogin" method="post">
					<div class="input-box">
						<span class="icons"> <ion-icon name="person"></ion-icon>
						</span> <input type="text" name="studentID" required /> <label for="">Student
							HallTicket Number</label>
					</div>
					<div class="input-box">
						<span class="icons"> <ion-icon name="lock-closed"></ion-icon>
						</span> <input type="Password" name="password" required /> <label for="">Password</label>
					</div>
					<div class="remember-me">
						<label hidden> <input type="checkbox" /> Remember me
						</label> <a href="#" hidden> Forgot Password?</a>
					</div>
					<button type="submit" class="btn">Login</button>
					<div class="login-register">
						<p>
							Don't have an account? <a href="studentSignup">Register</a>
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>