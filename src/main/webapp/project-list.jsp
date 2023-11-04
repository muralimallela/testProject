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
<title>Project Management</title>

<link rel="stylesheet" type="text/css"
	href="maxcdn/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="css/datatables.min.css">
<link rel="stylesheet" href="css/overall.css">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<jsp:include page="ssit-logo.jsp"></jsp:include>
			<a href="<%=request.getContextPath()%>/listProject"
				class="navbar-brand">&nbsp; Project Management </a> <a
				class="navbar-brand no-print" style="margin-left: 200px;">List
				of Projects</a>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<br>
	<jsp:include page="print-header.jsp"></jsp:include>
	<div class="row">
		<div class="container ">
			<h3 class="text-center no-print container1">List of Projects</h3>
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

			<!-- Filter Start -->
			<div class="container d-print-none"
				style="background-color: aliceblue; padding: 20px; margin-top: 20px">
				<form id="myForm" action="projectFilter" method="post">
					<div class="form-row">
						<div class="col-md-3">
							<label for="year">Academic Year </label> <select
								class="form-control" id="academic-year-select"
								name="academicYear">
								<option value="" hidden>Select academic year</option>
							</select>
						</div>
						<div class="col-md-3">
							<label for="branch">Branch </label> <select class="form-control"
								id="branch" name="branch">
								<option value="" hidden>Select branch</option>
								<option value="CS">CSE</option>
								<option value="EE">EEE</option>
								<option value="ME">MECH</option>
								<option value="CM">CSM</option>
								<option value="EC">ECE</option>
							</select>
						</div>
						<div class="col-md-3">
							<label for="projectType">Project Type </label> <select
								class="form-control" id="branch" name="projectType">
								<option value="" hidden>Select type of project</option>
								<option value="Mini Project">Mini Project</option>
								<option value="Major Project">Major Project</option>
								<option value="Major Project Stage-I" hidden>Major
									Project Stage-I</option>
								<option value="Major Project Stage-II" hidden>Major
									Project Stage-II</option>
							</select>
						</div>
						<div class="col-md-2">
							&nbsp;<br>
							<button type="submit" class="btn btn-primary">Filter</button>
						</div>
						<div class="col-md-1 d-flex  justify-content-end align-items-end">
							&nbsp;<br> <a type="button" class="btn  btn-lg"><img
								src="images/printer.png" width=30 onclick="window.print()"
								title="Print"></a>
						</div>
					</div>
				</form>
			</div>
			<!-- Filter End -->
			<br>
			<table class="table table-bordered text-center  table-hover"
				id="dataTable">
				<thead>
					<tr>
						<th>ProjectID</th>
						<th>Project Title</th>
						<th>ProjectType</th>
						<th>FacultyGuide</th>
						<th class="no-print">Branch</th>
						<th class="no-print">Batch</th>
						<th class="no-print">AcademicYear</th>
						<th class="no-print">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="Project" items="${listProject}">
						<tr>
							<td><c:out value="${Project.projectID}" /></td>
							<td class="text-left"><c:out value="${Project.projectTitle}" /></td>
							<td><c:out value="${Project.projectType}" /></td>
							<td><c:forEach var="Faculty" items="${listFaculty}">
									<c:if test="${Project.facultyAdvisorID ==Faculty.facultyID }">
										<c:out value="${Faculty.firstName}" />
										&ensp;
										<c:out value="${Faculty.lastName}" />
									</c:if>
								</c:forEach></td>
							<td class="no-print"><c:out value="${Project.branch}" /></td>
							<td class="no-print"><c:out
									value="${Project.batch.substring(4)}" /></td>
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

	<script src="jquery/jquery.slim.min.js"></script>
	<script src="js/popper.min.js" data-source-map="popper.min.js.map"></script>
	<script src="maxcdn/bootstrap/js/bootstrap.min.js"></script>
	<!-- page-search -->
	<script src="js/datatables.min.js"></script>
	<script src="js/dataTables.js"></script>
	<script src="js/academicYearGenerator.js"></script>
</body>
</html>