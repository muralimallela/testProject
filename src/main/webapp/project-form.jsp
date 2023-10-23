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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body {
	width: 100%;
}

.no-scrollbar {
	overflow: hidden;
	resize: none;
	scrollbar-width: none; /* Firefox */
	-ms-overflow-style: none; /* Internet Explorer 10+ */
}

.clear-input {
	cursor: pointer;
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
</style>
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
	<div class="container col-md-5 container-edit">
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
						<option value="Major Project Stage-I"
							<c:if test="${Project.projectType == 'Major Project Stage-I'}">selected</c:if>>Major
							Project Stage-I</option>
						<option value="Major Project Stage-II"
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
					<label for="branch">Department Code</label> <select
						class="form-control" name="branch">
						<option value="" hidden>Select Department Code</option>
						<option value="CS"
							<c:if test="${Project.branch == 'CS'}">selected</c:if>>CS</option>
						<option value="EE"
							<c:if test="${Project.branch == 'EE'}">selected</c:if>>EE</option>
						<option value="ME"
							<c:if test="${Project.branch == 'ME'}">selected</c:if>>ME</option>
						<option value="CM"
							<c:if test="${Project.branch == 'CM'}">selected</c:if>>CM</option>
						<option value="EC"
							<c:if test="${Project.branch == 'EC'}">selected</c:if>>EC</option>
					</select>
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
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		var textarea = document.getElementById("projectTitleInput");

		textarea.addEventListener("input", function() {
			var input = this.value;
			var capitalized = input.replace(/\b\w/g, function(match) {
				return match.toUpperCase();
			});

			this.value = capitalized;

			this.style.height = "auto";
			this.style.height = (this.scrollHeight) + "px";
		});
		textarea.dispatchEvent(new Event("input"));

		// Academic Year

		var academicYearInput = document.getElementById("academicYearInput");

		academicYearInput.addEventListener("input", function() {
			var input = this.value;
			var formattedYear = formatAcademicYear(input);

			// Check if the formatted year is different from the input and not just "-"
			if (formattedYear !== input && input !== "-") {
				this.value = formattedYear;
			}
		});

		clearInput.addEventListener("click", function() {
			academicYearInput.value = "";
		});

		function formatAcademicYear(input) {
			if (input.match(/^\d{4}$/)) {
				var lastTwoDigits = input.slice(-2);
				var nextYearLastTwoDigits = (parseInt(lastTwoDigits) + 1) % 100;
				nextYearLastTwoDigits = nextYearLastTwoDigits.toString()
						.padStart(2, '0');

				return input + "-" + nextYearLastTwoDigits;
			} else {
				return input;
			}
		}
		// Trigger the input event initially to format the academic year
		academicYearInput.dispatchEvent(new Event("input"));
	</script>
</body>
</html>