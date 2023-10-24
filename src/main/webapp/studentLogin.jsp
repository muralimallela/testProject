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
<link rel="stylesheet" href="css/studentLogin.css">

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