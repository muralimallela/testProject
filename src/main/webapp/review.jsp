<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
// Check if the user has an active session
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

HttpSession ses = request.getSession(false);
if (session == null || session.getAttribute("username") == null) {
	response.sendRedirect("adminLogin"); // Redirect to login page if not logged in
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student || Review</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/student-review.css">
<link rel="stylesheet" href="css/overall.css">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<jsp:include page="ssit-logo.jsp"></jsp:include>
			<a href="#" class="navbar-brand"> Student Review </a>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<br>
	<!-- Filter starts -->
	<div class="container d-print-none"
		style="background-color: aliceblue; padding: 20px; margin-top: 20px">
		<form id="myForm" action="studentList" method="post">
			<div class="form-row">
				<div class="col-md-3">
					<label for="year">Academic Year </label> <select
						class="form-control" id="academic-year-select" name="year">
						<option value="" hidden>Select academic year</option>
					</select>
				</div>
				<div class="col-md-2">
					<label for="branch">Branch </label> <select class="form-control"
						id="branch" name="branch">
						<option value="" hidden>Select branch</option>
						<option value="CSE">CSE</option>
						<option value="EEE">EEE</option>
						<option value="MECH">MECH</option>
						<option value="CSM">CSM</option>
						<option value="ECE">ECE</option>
					</select>
				</div>
				<div class="col-md-3">
					<label for="branch">Project Type </label> <select
						class="form-control" id="branch" name="branch">
						<option value="" hidden>Select type of project</option>
						<option value="Mini Project">Mini Project</option>
						<option value="Major Project">Major Project</option>
						<option value="Major Project Stage-I" hidden>Major Project
							Stage-I</option>
						<option value="Major Project Stage-II" hidden>Major Project
							Stage-II</option>
					</select>
				</div>
				<div class="col-md-2">
					<label for="branch">Batch </label> <input
						class="form-control" id="batch" name="batch">
				</div>
				<div class="col-md-1">
					<label>&nbsp</label><br>
					<button type="submit" class="btn btn-primary">Filter</button>
				</div>
				<div class="col-md-1 d-flex  justify-content-end align-items-end">
					<label>&nbsp</label><br> <a type="button" class="btn  btn-lg"><img
						src="images/printer.png" width=30 onclick="window.print()"
						title="Print"></a>
				</div>
			</div>
		</form>
	</div>
	<!-- Filter End -->
	<hr>
	
		
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="js/academicYearGenerator.js" type="text/javascript"></script>
</body>
</html>