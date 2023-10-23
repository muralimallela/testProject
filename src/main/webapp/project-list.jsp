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
<title>Project Management</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs4/dt-1.10.25/datatables.min.css" />
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

@page {
	size: auto;
}

.no-display {
	display: none;
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

.container-edit {
	margin-top: 50px;
}

@media print {
	.no-print, .dataTables_info, .dataTables_paginate, label {
		display: none;
	}
	.no-display {
		display: block;
	}
	.container-edit {
		margin-top: 0px;
	}
}
</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<jsp:include page="ssit-logo.jsp"></jsp:include>
			<a href="#" class="navbar-brand">&nbsp; Project Management </a>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<br>
	<div class="row">
		<img class="no-display " src="images/SaiSpruthi.jpg"
			style="border-radius: 10px;" width=100% height=130>
		<hr class="no-display">
		<div class="no-display container">

			<h4 class="text-center">DEPARTMENT OF COMPUTER SCIENCE AND
				ENGINEERING</h4>
			<h3 class="text-center">Project Report</h3>
		</div>
		<div class="container container-edit">
			<h3 class="text-center no-print">List of Projects</h3>
			<hr class="no-print">
			<div class="container text-left no-print">
				<div class="row">
					<div class="col-md-6">
						<a href="<%=request.getContextPath()%>/newProject"
							class="btn btn-success">Add New Project</a>
					</div>
					<!-- search input
					<div class="col-md-6 text-right">
						<input type="text" id="searchInput" placeholder="Search...">
					</div>  -->
				</div>
			</div>
			<br>
			<table class="table table-bordered" id="dataTable">
				<thead>
					<tr>
						<th>ProjectID</th>
						<th>Project Title</th>
						<th>ProjectType</th>
						<th>FacultyGuide</th>
						<th class="no-print">Branch</th>
						<th class="no-print">AcademicYear</th>
						<th class="no-print">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="Project" items="${listProject}">
						<tr>
							<td><c:out value="${Project.projectID}" /></td>
							<td><c:out value="${Project.projectTitle}" /></td>
							<td><c:out value="${Project.projectType}" /></td>
							<td><c:forEach var="Faculty" items="${listFaculty}">
									<c:if test="${Project.facultyAdvisorID ==Faculty.facultyID }">
										<c:out value="${Faculty.firstName}" />
										&ensp;
										<c:out value="${Faculty.lastName}" />
									</c:if>
								</c:forEach></td>
							<td class="no-print"><c:out value="${Project.branch}" /></td>
							<td class="no-print"><c:out value="${Project.academicYear}" /></td>
							<td class="no-print"><a
								href="editProject?projectID=<c:out value='${Project.projectID}' />"><img
									class="image" alt="Edit icon" src="images/edit.png"
									title="Edit" height="18"></a> &nbsp; <a
								href="deleteProject?projectID=<c:out value='${Project.projectID}' />"><img
									class="image" alt="Delete icon" src="images/trash.png"
									title="Delete" width="18"></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- page-search -->
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