<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

HttpSession ses = request.getSession(false);
String user = (String) session.getAttribute("studentID");
if (session == null || session.getAttribute("studentID") == null) {
	response.sendRedirect("studentLogin");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${student.firstName}"></c:out> <c:out
		value="${student.lastName}"></c:out></title>
<link rel="stylesheet" href="bootstrap\css\bootstrap.min.css"
	type="text/css">
<style id="aby-style">
@import
	url('https://fonts.googleapis.com/css2?family=Space+Grotesk&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@600&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Space Grotesk', sans-serif;
	color: white;
}

body {
	background-image: url('images/back1.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	color: white;
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

.navigation .btnlogout-user {
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

.navigation .btnlogout-user:hover {
	background: #fff;
	color: #162938;
}

.container {
	padding-top: 50px;
	color: white;
}

.card {
	border: 2px solid rgb(225, 225, 225);
	background-color: rgba(0, 0, 0, 0.2);
	padding: 7PX;
}

.custom {
	margin-top: 80px;
}

.card-header {
	color: white;
	border-color: whitesmoke;
	background: transparent;
	backdrop-filter: blur(2px);
}

.card-body {
	color: white;
	border-color: whitesmoke;
	background: white;
	background: transparent;
	backdrop-filter: blur(2px);
}

.table .table-bordered {
	background: transparent;
	color: white;
	width: "100%";
	border-collapse: collapse;
}

.container .row .col-md-6 .card .card-body .table-bordered th,
	.container .row .col-md-6 .card .card-body .table-bordered td {
	background-color: rgba(0, 0, 0, 0.1);
	color: #fff;
}

.custom-card-project {
	max-height: 118vh;
	overflow-y: auto;
}

.custom-card-review {
	max-height: 52vh;
	overflow-y: auto;
}
</style>
</head>
<body>
	<div class="header">
		<img src="images/SaiSpruthi.jpg" style="border-radius: 10px;"
			width=20% height=50>
		<h4 style="font-family: 'Dancing Script', cursive;">
			<c:out value="${student.firstName}"></c:out>
			<c:out value="${student.lastName}"></c:out>
		</h4>
		<nav class="navigation">
			<button class="btnlogout-user"
				onclick="window.location.href='studentLogin'">Logout</button>
		</nav>
	</div>
	<c:if test="${student !=null && student != '[]'}">

		<!-- STUDENT INFORMATION -->

		<div class="container mt-4">
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<div
							class="card-header d-flex justify-content-between align-items-center">
							<h5 class="mb-0">Student Information</h5>

							<!-- Edit Button -->
							<!--
							<form action="StudentEdit" method="post">
								<input type="text" name="studentID"
									value="${student.studentID }" hidden>
								<button class="btn btn-primary" type="submit" >Edit</button>
							</form>
							-->

						</div>

						<div class="card-body">
							<table class="table-bordered table">
								<tr>
									<th>Student ID</th>
									<td><c:out value="${fn:toUpperCase(student.studentID)}"></c:out></td>
								</tr>

								<tr>
									<th>Student Name</th>
									<td><c:out value="${student.firstName}"></c:out> <c:out
											value="${student.lastName}"></c:out></td>
								</tr>
								<tr>
									<th>Email</th>
									<td><c:out value="${student.email}"></c:out></td>
								</tr>
								<tr>
									<th>Branch</th>
									<td><c:out value="${student.department}"></c:out></td>
								</tr>
								<tr>
									<th>Joining Year</th>
									<td><c:out value="${student.year}"></c:out></td>
								</tr>
								<tr>
									<th>Role</th>
									<td><c:out value="${student.role}"></c:out></td>
								</tr>
								<tr>
									<th>Batch</th>
									<td><c:out value="${student.batch}"></c:out></td>
								</tr>
								<tr>
									<th>Contact Number</th>
									<td><c:out value="${student.contactNumber}"></c:out></td>
								</tr>
							</table>
						</div>
					</div>
					<!-- REVIEWS  -->
					<br>
				</div>

				<!-- PROJECT INFORMATION -->

				<div class="col-md-6">
					<div class="card">
						<div
							class="card-header d-flex justify-content-between align-items-center">
							<h5 class="mb-0">Project Information</h5>

							<c:if test="${ project !=null && project != '[]'}">
								<form action="ProjectEdit" method="post">
									<input type="text" name="studentID"
										value="${student.studentID }" hidden>
									<button class="btn btn-primary" type="submit" hidden>Edit</button>
								</form>
							</c:if>
							<c:if test="${project ==null || project == '[]'}">
								<form action="ProjectAdd" method="post">
									<input type="text" name="studentID"
										value="${student.studentID }" hidden>
									<button class="btn btn-primary" type="submit" hidden>ADD</button>
								</form>
							</c:if>
						</div>
						<c:if test="${ project ==null || project == '[]'}">
							<div class="card-body">
								<p>No project has been assigned yet</p>
							</div>
						</c:if>
						<c:if test="${project !=null && project != '[]'}">
							<div class="card-body custom-card-project">
								<table class="table table-bordered">
									<tr>
										<th>Project ID</th>
										<td><c:out value="${project.get(4)}"></c:out></td>
									</tr>

									<tr>
										<th>Title</th>
										<td><c:out value="${project.get(5)}"></c:out></td>
									</tr>

									<tr>
										<th>Faculty Name</th>
										<td><c:out value="${project.get(7)}"></c:out> <c:out
												value="${project.get(8)}"></c:out></td>
									</tr>
									<tr>
										<th>Description</th>
										<td><c:out value="${project.get(6)}"></c:out></td>
									</tr>
								</table>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<hr>
	</c:if>
</body>
</html>