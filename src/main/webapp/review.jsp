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

<link rel="stylesheet" type="text/css" href="maxcdn/bootstrap/css/bootstrap.min.css">
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
		<form id="myForm" action="getBatch" method="post">
			<div class="form-row">
				<div class="col-md-3">
					<label for="year">Academic Year </label> <select
						class="form-control" id="academic-year-select" name="academicYear">
						<option value="" hidden>Select academic year</option>
					</select>
				</div>
				<div class="col-md-2">
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
					<label for="branch">Project Type </label> <select
						class="form-control" id="projectType" name="projectType">
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
					<label for="branch">Batch </label> <input class="form-control"
						id="batch" name="batch">
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
	<div class="container table-responsive text-nowrap">
		<hr>
		<h5 class="text-center ">
			<c:out value="${project.projectType}" />
			Evaluation Sheet
		</h5>
		<hr>
		<form action="insertReview" method="post">
			<input hidden name="projectID"
				value="<c:out value="${project.projectID }"/>">
			<table class="table table-borderless table-hover " id="dataTable">
				<thead class="bg-info text-white bg-gradient text-center">
					<tr>
						<th scope="col">student ID</th>
						<th scope="col" class="">Student Name</th>
						<th scope="col">Guide<small> (50M)</small></th>
						<th>SR Faculty <small> (50M)</small></th>
						<th>HOD <small> (50M)</small></th>
						<th class="no-print" hidden>Actions</th>
					</tr>
				</thead>
				<tbody class="mx-auto">
					<c:forEach var="Student" items="${studentList}">
						<tr>
							<td><input
								class="border-0 bg-transparent text-center item-center"
								value="${Student.studentID}" name="studentID[]" ></td>
							<td><c:out value="${Student.firstName}" /> <c:out
									value="${Student.lastName}" /></td>
							<td><input class="form-control col-md-8 mx-auto "
								placeholder="Enter Marks" name="guide[]"></td>
							<td><input class="form-control col-md-8 mx-auto"
								placeholder="Enter Marks" name="srFaculty[]"></td>
							<td><input class="form-control col-md-8 mx-auto"
								placeholder="Enter Marks" name="hod[]"></td>
							<td class="no-print" hidden><a
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
			<div class="d-flex justify-content-end align-items-end">
				<button type="submit" class="btn btn-success">Save & Upload</button>
			</div>

		</form>
		<hr>
		<table class="table table-borderless ">
			<tbody>
				<tr>
					<th class="col-md-2">Batch</th>
					<td><c:out value="${project.batch}" /></td>
				</tr>
				<tr>
					<th>Project Title</th>
					<td><c:out value="${project.projectTitle}" /></td>
				</tr>
				<tr>
					<th>Guide</th>
					<td><c:forEach var="Faculty" items="${listFaculty}">
							<c:if test="${project.facultyAdvisorID ==Faculty.facultyID }">
								<c:out value="${Faculty.firstName}" />
								&ensp;
								<c:out value="${Faculty.lastName}" />
							</c:if>
						</c:forEach></td>
				</tr>
			</tbody>
		</table>

	</div>

	<script src="jquery/jquery.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="maxcdn/bootstrap/js/bootstrap.min.js"></script>
	<script src="js/academicYearGenerator.js" type="text/javascript"></script>
	<script src="js/dataTables.js"></script>
</body>
</html>