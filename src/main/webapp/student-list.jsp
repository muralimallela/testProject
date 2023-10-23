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
<title>Student Management</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs4/dt-1.10.25/datatables.min.css" />
<style>
body{

}

header {
	position: fixed;
	background-color: #162938;
	color: #fff;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 99;
}

header nav {
	height: 53px;
}

.table {
	font-size: 15px;
	width: 100%;
}

td {
	padding: 20px;
}

th {
	text-align: center;
}

.container1 {
	margin-top: 50px;
}

.image {
	width: 18px;
	height: 18px;
}

@page {
	size: auto;
}

@media print {
	.no-print, label, .dataTables_info, .dataTables_paginate {
		display: none;
	}
}
</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<jsp:include page="ssit-logo.jsp"></jsp:include>
			<a href="#" class="navbar-brand"> Student Management </a>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<br>

	<div>
		<div class="container container1 ">
			<h3 class="text-center no-print">List of Students</h3>
			<hr class="no-print">
			<div class="container text-left no-print">
				<div class="row">
					<div class="col-md-6">
						<a href="<%=request.getContextPath()%>/newStudent"
							class="btn btn-success">Add New Student</a>
					</div>
				</div>
			</div>
			<br>
			
			<table class="table table-bordered table-striped" id="dataTable">
				<thead>
					<tr>
						<th>StudentID</th>
						<th class="no-print">Password</th>
						<th style="width: 350px">Name</th>
						<th>Email</th>
						<th class="no-print">Branch</th>
						<th class="no-print">Year</th>
						<th>Batch</th>
						<th>Role</th>
						<th>ContactNumber</th>
						<th class="no-print">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="Student" items="${listStudent}">
						<tr>
							<td><c:out value="${Student.studentID}" /></td>
							<td class="no-print"><c:choose>
									<c:when test="${not empty Student.password}">
										<c:forEach var="char" items="${Student.password}">
											<c:out value="●●●●●●" />
										</c:forEach>
									</c:when>
									<c:otherwise>
										NULL
									</c:otherwise>
								</c:choose></td>
							<td><c:out value="${Student.firstName}" /> <c:out
									value="${Student.lastName}" /></td>
							<td><c:out value="${Student.email}" /></td>
							<td class="no-print"><c:out value="${Student.department}" /></td>
							<td class="no-print"><c:out value="${Student.year}" /></td>
							<td><c:out value="${Student.batch}" /></td>
							<td><c:out value="${Student.role}" /></td>
							<td><c:out value="${Student.contactNumber}" /></td>
							<td class="no-print"><a
								href="editStudent?StudentID=<c:out value='${Student.studentID}' />"><img
									class="image" alt="" src="images/edit.png" title="Edit"></a>&nbsp;
								<a
								href="deleteStudent?StudentID=<c:out value='${Student.studentID}' />"><img
									class="image" alt="" src="images/trash.png" title="Delete"></a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>
	</div>
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.25/datatables.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#dataTable").DataTable({
				'aoColumnDefs' : [ {
					'bSortable' : false,
					'aTargets' : [ -1 ]
				/* 1st one, start by the right */
				} ]
			});
		})
	</script>
</body>
</html>