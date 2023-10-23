<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Student Registration</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style type="text/css">
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

.card {
	margin-top: 60px;
	background: transparent;
	border: 2px solid whitesmoke;
	border-radius: 20px;
	backdrop-filter: blur(2px);
	box-shadow: 0 0 30px rgba(0, 0, 0, 5);
	display: flex;
	justify-content: center;
	align-items: center;
	transition: transform 0.5s, height 0.1s ease;
	background-color: rgba(0, 0, 0, 0.4);
}

.form-group .form-control {
	position: relative;
	width: 100%;
	height: 35px;
	font-size: 1.1em;
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

	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<form action="StudentSignup" method="post">
					<caption>
						<h2>Student Registration</h2>
					</caption>
					<fieldset class="form-group">
						<label>HallTicket Number </label> <input type="text"
							name="StudentID" id="StudentID" onblur="checkStudentID()"
							class="form-control" required="required">
					</fieldset>
					<p id="myParagraph" style="color: orange"></p>

					<fieldset class="form-group">
						<label>Password</label> <input type="password" id="password"
							class="form-control" required="required">
					</fieldset>
					<fieldset class="form-group">
						<label>Confirm Password</label> <input type="password"
							id="confirmPassword" oninput="checkPasswordMatch()"
							class="form-control" name="Password" required="required">
					</fieldset>
					<p id="passwordMatchMessage" style="color: orange"></p>
					<fieldset class="form-group">
						<label>First Name</label> <input type="text" class="form-control"
							name="FirstName" id="FirstName" required="required">
					</fieldset>
					<fieldset class="form-group">
						<label>Last Name / Surname</label> <input type="text"
							class="form-control" name="LastName" id="LastName"
							required="required">
					</fieldset>

					<fieldset class="form-group">
						<label>Email</label> <input type="email" class="form-control"
							name="Email" required>
					</fieldset>
					<fieldset class="form-group">
						<label>Joining Year</label> <input id="yearSelect" name="Year"
							class="form-control" required>
					</fieldset>

					<fieldset class="form-group">
						<label>Department</label> <input type="text" class="form-control"
							name="Department" id="Department" required>
					</fieldset>
					<fieldset class="form-group">
						<label>Batch</label> <input type="text"
							value="<c:out value='${Student.batch}' />" class="form-control"
							name="Batch" id="Batch" required>
					</fieldset>
					<fieldset class="form-group">
						<label>Role</label> <select class="form-control" name="Role"
							required>
							<option value="" hidden>Select Role</option>
							<c:if test="${Student != null}">
								<option value="${Student.role}" selected hidden>${Student.role}</option>
							</c:if>
							<option value="Member">Member</option>
							<option value="Leader">Leader</option>
						</select>
					</fieldset>
					<fieldset class="form-group">
						<label>Contact Number</label> <input type="text"
							class="form-control" name="ContactNumber" id="ContactNumber"
							required>
					</fieldset>
					<p id="numberErrorMsg" style="color: orange"></p>
					<button type="submit" id="submitBtn" class="btn btn-success">
						Sign UP</button>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



	<script>
	
		// STUDENT ID 
	
		let studentIDInput = document.getElementById("StudentID");
		const paragraphElement = document.getElementById('myParagraph');
		const numberErrorMsg = document.getElementById('numberErrorMsg');
		const submitBtn = document.getElementById('submitBtn');
		let subString = ["C51A","C55A"];
		const yearSelect = document.getElementById("yearSelect");
		const branchField = document.getElementById("Department");
		const batch = document.getElementById("Batch");
		
		
		//Batch
		
		batch.addEventListener("input",function(){
			batch.value = batch.value.toUpperCase();
		});
		

		studentIDInput.addEventListener("input", function() {
			const inputValue = studentIDInput.value.toUpperCase();
			submitBtn.disabled = true;
			
			// Year (Auto Complete)
			
			const firstTwoChars = inputValue.substring(0, 2);
		    const year = "20" + firstTwoChars;
		    yearSelect.value = year;
		    
		    // Department (Auto Complete)
		    
		    const branchValue = inputValue.substring(6, 8);
		    const branch = (branchValue === "05") ? "CSE" : (branchValue === "02")?"EEE":(branchValue === "04")?"ECE":(branchValue === "66")?"CSM":(branchValue === "03")?"MECH":"";
		    branchField.value = branch;
		    
			if (inputValue.length < 10) {
				studentIDInput.value = inputValue;
				paragraphElement.textContent = '';
				
			} else {
				studentIDInput.value = inputValue.slice(0, 10);
				checkStudentID();
				
			}

		});

		function checkStudentID() {
			
			 if (!subString.some(sub => studentIDInput.value.includes(sub))) {
				studentIDInput.focus();
				paragraphElement.textContent = 'Invalid student ID';
				submitBtn.disabled = true;
			} else {
				paragraphElement.textContent = '';
				submitBtn.disabled = false;
			}
			 if(studentIDInput.value.length !== 10){
				 studentIDInput.focus();
				 paragraphElement.textContent = "Student ID must be exactly 10 characters";
				 submitBtn.disabled = true;
			}
		}
		
		// FIRST NAME AND LAST NAME
		
		const firstNameInput = document.getElementById('FirstName');
		const lastNameInput = document.getElementById('LastName');

		function capitalizeFirstLetter(string) {
    		return string.split(' ').map(word => {
       	 		return word.charAt(0).toUpperCase() + word.slice(1);
    		}).join(' ');
		}

		firstNameInput.addEventListener('input', function() {
    		const currentValue = firstNameInput.value;
    		const capitalizedValue = capitalizeFirstLetter(currentValue);
    		firstNameInput.value = capitalizedValue;
		});

		lastNameInput.addEventListener('input', function() {
    		const currentValue = lastNameInput.value;
    		const capitalizedValue = capitalizeFirstLetter(currentValue);
    		lastNameInput.value = capitalizedValue;
		});

		// PASSWORDS 
	
	
		const passwordInput = document.getElementById("password");
		const confirmPasswordInput = document.getElementById("confirmPassword");
		const passwordMatchMessage = document
				.getElementById("passwordMatchMessage");

		function checkPasswordMatch() {
			const password = passwordInput.value;
			const confirmPassword = confirmPasswordInput.value;
			
			if(password.length <= confirmPassword.length){
				if (password === confirmPassword) {
					passwordMatchMessage.textContent = "";
					confirmPasswordInput.setCustomValidity("");
					submitBtn.disabled = false;
				} else {
					passwordMatchMessage.textContent = "Passwords are not match";
					confirmPasswordInput
						.setCustomValidity("Passwords are not match");
					submitBtn.disabled = true;
				}
			}
		}
	
		// YEAR 
		
		
		
		
		//Department
		
		// CONTACT NUMBER
		
		const contactNumberInput = document.getElementById("ContactNumber");
		
		contactNumberInput.addEventListener("input", function() {
			const inputValue = contactNumberInput.value;
			if (inputValue.length <= 10) {
				contactNumberInput.value = inputValue;
				numberErrorMsg.textContent ="";
				submitBtn.disabled = false;
			} else {
				contactNumberInput.value = inputValue.slice(0, 10);
			}
		});
		contactNumberInput.addEventListener("blur", function() {
		    if (contactNumberInput.value.length !== 10) {
		        numberErrorMsg.textContent = "Contact number must be exactly 10 numbers";
		        submitBtn.disabled = true;
		    } else {
		        numberErrorMsg.textContent = "";
		        submitBtn.disabled = false; 
		    }
		});
	</script>
</body>

</html>