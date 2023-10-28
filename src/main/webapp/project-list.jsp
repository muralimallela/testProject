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
<link rel="stylesheet" href="css/overall.css">
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
		<img class="d-none d-print-block" src="images/SaiSpruthi.jpg"
			style="border-radius: 10px;" width=100% height=130>
		<hr class="d-none">
		<div class="d-none d-print-block container">

			<h4 class="text-center d-print-block">DEPARTMENT OF COMPUTER
				SCIENCE AND ENGINEERING</h4>
			<h3 class="text-center d-none d-print-block">Project Report</h3>
		</div>
		<div class="container container1">
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

			<!-- Filter Start -->
			<div class="container d-print-none"
				style="background-color: aliceblue; padding: 20px; margin-top: 20px">
				<form id="myForm" action="studentList" method="post">
					<div class="form-row">
						<div class="col-md-3">
							<label for="year">Joining Year </label> <select
								class="form-control" id="yearSelect" name="year">
								<option value="" hidden>Select joining year</option>
							</select>
						</div>
						<div class="col-md-3">
							<label for="branch">Branch </label> <select class="form-control"
								id="branch" name="branch">
								<option value="" hidden>Select branch code</option>
								<option value="CSE">CSE</option>
								<option value="EEE">EEE</option>
								<option value="MECH">MECH</option>
								<option value="CSM">CSM</option>
								<option value="ECE">ECE</option>
							</select>
						</div>
						<div class="col-md-3">
							<label for="branch">Project Type </label> <select class="form-control"
								id="branch" name="branch">
								<option value="" hidden>Select type of project</option>
								<option value="Mini Project">Mini Project</option>
								<option value="Major Project Stage-I">Major Project Stage-I</option>
								<option value="Major Project Stage-II">Major Project Stage-II</option>
							</select>
						</div>
						<div class="col-md-2">
							<label>&nbsp</label><br>
							<button type="submit" class="btn btn-primary">Filter</button>
						</div>
					</div>
				</form>
			</div>
			<!-- Filter End -->
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
	<script src="js/dataTables.js"></script>
</body>
</html>