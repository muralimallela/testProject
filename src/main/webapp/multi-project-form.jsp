<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
// Check if the user has an active session
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

HttpSession ses = request.getSession(false);
if (ses == null || ses.getAttribute("username") == null) {
	response.sendRedirect("adminLogin"); // Redirect to the login page if not logged in
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Project Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="maxcdn/bootstrap/css/bootstrap.min.css">s
<link rel="stylesheet" type="text/css" href="css/overall.css">
<link rel="stylesheet" type="text/css" href="css/project-form.css">
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #123455">
			<jsp:include page="ssit-logo.jsp"></jsp:include>
			<a href="#" class="navbar-brand"> Project Management </a>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<br>
	<div class="container col-md-7 container1">
		<div class="card">
			<div class="card-body">
				<c:if test="${Project != null}">
					<form action="updateProject" method="post">
				</c:if>
				<c:if test="${Project == null}">
					<form action="insertMultipleProjects" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${Project != null}">
                            Edit Project
                        </c:if>
						<c:if test="${Project == null}">
                            Add Multiple Projects
                        </c:if>
					</h2>
				</caption>

				<c:if test="${Project != null}">
					<input type="hidden" name="projectID"
						value="<c:out value='${Project.projectID}' />" />
				</c:if>

				<c:if test="${Project == null}">
					<fieldset class="form-group" hidden>
						<label for="projectID">Project ID</label> <input type="text" name="projectID"
							id="projectID" value="<c:out value='${Project.projectID}' />"
							class="form-control">
					</fieldset>
				</c:if>

				<!-- Add multiple project titles and batch IDs -->
				<div class="row">
					<div class="col-md-4">
						<fieldset class="form-group">
							<label for="projectType">Project Type</label> <select
								class="form-control" id="projectType" name="projectType" required="required">
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
					</div>
					<div class="col-md-4">
						<fieldset class="form-group">
							<label for="branch">Department</label> <select
								class="form-control" name="branch" id="branch" required="required">
								<option value="" hidden="hidden">Select Department</option>
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
					</div>
					<div class="col-md-4">
						<label for="academic-year-select">Academic Year </label> <select
							class="form-control" id="academic-year-select" name="academicYear" required="required">
							<option value="" hidden>Select academic year</option>
						</select>

					</div>
				</div>

				<!-- Your other form fields go here -->
				<div class="projectFields">
					<div class="row">
						<div class="col-md-12">
							<hr>
						</div>
						<div class="col-md-7">
							<fieldset class="form-group">
								<label for="projectTitle">Project Title</label>
								<textarea rows="1" id="projectTitle"
									class="form-control no-scrollbar projectTitleInput"
									name="projectTitle[]" required="required"></textarea>
							</fieldset>
						</div>
						<div class="col-md-4">
							<fieldset class="form-group">
								<label for="facultyAdvisorID">Project Faculty Guide</label> <select
									class="form-control" name="facultyAdvisorID[]" id="facultyAdvisorID" required>
									<option value="" hidden>Select Project Guide</option>
									<c:if test="${listFaculty != null}">
										<c:forEach var="Faculty" items="${listFaculty}">
											<c:if test="${Project.facultyAdvisorID == Faculty.facultyID}">
												<option value="${Project.facultyAdvisorID}" selected hidden="hidden">${Faculty.firstName}&ensp;${Faculty.lastName}</option>
											</c:if>
											<option value="${Faculty.facultyID}">
												<c:out value="${Faculty.firstName}" />&ensp;
												<c:out value="${Faculty.lastName}" />
											</option>
										</c:forEach>
									</c:if>
								</select>
							</fieldset>
						</div>
						<div class="col-md-3">
							<fieldset class="form-group">
								<label for="batch">Batch 
								</label> <input type="text" id="batch" class="form-control" name="batch[]" required>
							</fieldset>
						</div>
						<div class="col-md-1">
							<fieldset class="form-group">
								&nbsp;
								<button type="button"
									class="btn btn-danger btn-sm removeProject">Delete</button>
							</fieldset>
						</div>
					</div>
				</div>

				<div class="row justify-content-between">
					<div class="col-md-auto">
						<button type="button" id="addProject"
							class="btn btn-primary btn-sm">Add Another Project</button>
					</div>
					<div class="col-md-auto">
						<button type="submit" id="submitBtn"
							class="btn btn-success btn-lg">Save</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<script src="jquery/jquery.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="maxcdn/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/multi-project-form.js"></script>
	<script type="text/javascript" src="js/academicYearGenerator.js"></script>
</body>
</html>
