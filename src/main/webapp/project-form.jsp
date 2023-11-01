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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="maxcdn/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/overall.css">
<link rel="stylesheet" type="text/css" href="css/project-form.css">
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<jsp:include page="ssit-logo.jsp"></jsp:include>
			<a href="#" class="navbar-brand"> Project Management </a>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<br>
	<div class="container col-md-5 container1">
		<div class="card">
			<div class="card-body">
				<c:if test="${Project != null}">
					<form action="updateProject" method="post">
				</c:if>
				<c:if test="${Project == null}">
					<form action="insertProject" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${Project != null}">
									Edit Project
								</c:if>
						<c:if test="${Project == null}">
									Add New Project
								</c:if>
					</h2>
				</caption>

				<c:if test="${Project != null}">
					<input type="hidden" name="projectID"
						value="<c:out value='${Project.projectID}' />" />
				</c:if>

				<c:if test="${Project== null}">
					<fieldset class="form-group" hidden>
						<label>Project ID</label> <input type="text" name="projectID"
							id="projectID" value="<c:out value='${Project.projectID}' />"
							class="form-control">
					</fieldset>
				</c:if>
				<fieldset class="form-group">
					<label for="projectTitle">Project Title</label>
					<textarea rows="1" class="form-control no-scrollbar"
						name="projectTitle" id="projectTitleInput" required="required"><c:out
							value='${Project.projectTitle}' /></textarea>
				</fieldset>
				<fieldset class="form-group">
					<label for="projectType">Project Type</label> <select
						class="form-control" name="projectType" required="required">
						<option value="" hidden>Select Project Type</option>
						<option value="Mini Project"
							<c:if test="${Project.projectType == 'Mini Project'}">selected</c:if>>Mini
							Project</option>
						<option value="Major Project"
							<c:if test="${Project.projectType == 'Major Project'}">selected</c:if>>Major
							Project</option>
						<option value="Major Project Stage-I" hidden
							<c:if test="${Project.projectType == 'Major Project Stage-I'}">selected</c:if>>Major
							Project Stage-I</option>
						<option value="Major Project Stage-II" hidden
							<c:if test="${Project.projectType == 'Major Project Stage-II'}">selected</c:if>>Major
							Project Stage-II</option>
					</select>
				</fieldset>
				<c:if test="${listFaculty != null}">
					<label for="Project">Project Faculty Guide</label>
					<select class="form-control" name="facultyAdvisorID">
						<option value="" hidden>Select Project Faculty Guide</option>
						<c:forEach var="Faculty" items="${listFaculty}">
							<c:if test="${Project.facultyAdvisorID ==Faculty.facultyID }">
								<option value="${Project.facultyAdvisorID}" selected hidden>${Faculty.firstName}&ensp;${Faculty.lastName}</option>
							</c:if>
							<option value="${Faculty.facultyID}"><c:out
									value="${Faculty.firstName}" />&ensp;
								<c:out value="${Faculty.lastName}" />
							</option>
						</c:forEach>
					</select>
				</c:if>
				<fieldset class="form-group">
					<label for="branch">Department</label> <select class="form-control"
						name="branch">
						<option value="" hidden>Select Department</option>
						<option value="CS"
							<c:if test="${Project.branch == 'CS'}">selected</c:if>>CSE</option>
						<option value="EE"
							<c:if test="${Project.branch == 'EE'}">selected</c:if>>EEE</option>
						<option value="ME"
							<c:if test="${Project.branch == 'ME'}">selected</c:if>>MECH</option>
						<option value="CM"
							<c:if test="${Project.branch == 'CM'}">selected</c:if>>CSM</option>
						<option value="EC"
							<c:if test="${Project.branch == 'EC'}">selected</c:if>>ECE</option>
					</select>
				</fieldset>
				<fieldset class="form-group">
					<label>Batch</label>
					<input class="form-control" value="${Project.batch.substring(4) }" name="batch" placeholder="Enter batch">
				</fieldset>
				<fieldset class="form-group">
					<label>Academic Year</label>
					<div class="input-group">
						<input type="text" class="form-control" name="academicYear"
							id="academicYearInput" placeholder="Ex: 2023-24"
							value="${Project.academicYear }" required="required">
						<div class="input-group-append">
							<span class="input-group-text clear-input" id="clearInput">Clear</span>
						</div>
					</div>
				</fieldset>

				<button type="submit" id="submitBtn" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
	<script src="jquery/jquery.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="maxcdn/bootstrap/js/bootstrap.min.js"></script>
	<script src="js/project-form.js"></script>
</body>
</html>