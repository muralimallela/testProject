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
<title>Faculty Managementn</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="ssit-logo.jsp"></jsp:include>
	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<a href="#" class="navbar-brand"> Faculty Management </a>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<br>

	<div class="row">
		<!--  <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Faculty</h3>
			<hr>
			<div class="container text-left">
				<div class="row">
					<div class="col-md-6">
						<a href="<%=request.getContextPath()%>/newFaculty"
							class="btn btn-success">Add New Faculty</a>
					</div>
					<!-- search input -->
					<div class="col-md-6 text-right">
						<input type="text" id="searchInput" placeholder="Search...">
					</div>
				</div>
			</div>
			<br>
			<table class="table table-bordered" id="dataTable">
				<thead>
					<tr>
						<th>Faculty ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Department</th>
						<th>ContactNumber</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="Faculty" items="${listFaculty}">

						<tr>
							<td><c:out value="${Faculty.facultyID}" /></td>
							<td><c:out value="${Faculty.firstName}" /></td>
							<td><c:out value="${Faculty.lastName}" /></td>
							<td><c:out value="${Faculty.email}" /></td>
							<td><c:out value="${Faculty.department}" /></td>
							<td><c:out value="${Faculty.contactNumber}" /></td>
							<td><a
								href="editFaculty?facultyID=<c:out value='${Faculty.facultyID}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteFaculty?facultyID=<c:out value='${Faculty.facultyID}' />">Delete</a></td>
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
</body>
</html>