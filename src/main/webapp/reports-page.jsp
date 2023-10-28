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
<html>
<head>
<title>reports</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/overall.css">
<link rel="stylesheet" type="text/css" href="css/reports-page.css">
<style>

</style>

</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md  navbar-dark">
			<jsp:include page="ssit-logo.jsp"></jsp:include>
			<a href="#" class="navbar-brand"> Reports </a>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<br>

	<div class="row">

		<div class="container">
			<!-- Filter Start -->
			<div class="container d-print-none"
				style="background-color: aliceblue; padding: 20px; margin-top: 20px">
				<form id="myForm" action="projectReports" method="post">
					<div class="form-row">
						<c:set var="projectType" value="${requestScope.projectType}" />
						<input name="projectType" id="projectType" value="${projectType }"
							hidden>
						<div class="col-md-3">
							<label for="branch">Branch </label> <select
								class="form-control" id="branch" name="branch">
								<option value="" hidden>Select branch</option>
								<option value="CS">CSE</option>
								<option value="EE">EEE</option>
								<option value="ME">MECH</option>
								<option value="CM">CSM</option>
								<option value="EC">ECE</option>
							</select>
						</div>
						<div class="col-md-3">
							<label for="academicYear">Academic Year </label> <select
								class="form-control" id="academic-year-select" name="academicYear">
								<option value="" hidden>Select academic year</option>
							</select>
						</div>
						<div class="col-md-4">
							<label>&nbsp</label><br>
							<button type="submit" class="btn btn-primary"
								onclick="checkInputs()">Filter</button>
						</div>
					</div>
				</form>
			</div>
			<!-- Filter End -->
			<hr>

			<table class="table-bordered" id="dataTable">
				<thead>
					<tr>
						<th>Batch No.</th>
						<th>Student ID</th>
						<th style="width: 250px">Student Name</th>
						<th>Project Name</th>
						<th>Faculty Guide</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="Reports" items="${allReports}">
						<tr>
							<td><c:out value="${Reports.batch.substring(4)}" /></td>
							<td><c:out value="${Reports.studentID}" /></td>
							<td class="left-align"><c:out value="${Reports.studentName}" /></td>
							<td class="left-align"><c:out
									value="${Reports.projectTitle}" /></td>
							<td><c:out value="${Reports.facultyName}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- page-search -->
	<script type="text/javascript" src="page-search.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="js/reports-page.js"></script>
	<script src="js/academicYearGenerator.js"></script>
</body>
</html>