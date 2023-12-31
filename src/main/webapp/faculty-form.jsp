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
<title>Faculty Management</title>
<link rel="stylesheet"
	href="maxcdn/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/overall.css">

</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<jsp:include page="ssit-logo.jsp"></jsp:include>
			<a href="#" class="navbar-brand"> Faculty Management </a>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<br>
	<div class="container container1 col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${Faculty != null}">
					<form action="updateFaculty" method="post">
				</c:if>
				<c:if test="${Faculty == null}">
					<form action="insertFaculty" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${Faculty != null}">
            			Edit Faculty
            		</c:if>
						<c:if test="${Faculty == null}">
            			Add New Faculty
            		</c:if>
					</h2>
				</caption>

				<c:if test="${Faculty != null}">
					<input type="hidden" name="facultyID"
						value="<c:out value='${Faculty.facultyID}' />" />
				</c:if>

				<c:if test="${Faculty== null}">
					<fieldset class="form-group">
						<label>Faculty ID</label> <input type="text" name="facultyID"
							id="facultyID" value="<c:out value='${Faculty.facultyID}' />"
							class="form-control" required="required">
					</fieldset>
				</c:if>
				<fieldset class="form-group">
					<label>Faculty First Name</label> <input type="text"
						value="<c:out value='${Faculty.firstName}' />"
						class="form-control" name="FirstName" required="required">
				</fieldset>
				<fieldset class="form-group">
					<label>Faculty Last Name</label> <input type="text"
						value="<c:out value='${Faculty.lastName}' />" class="form-control"
						name="LastName" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Faculty Email</label> <input type="text"
						value="<c:out value='${Faculty.email}' />" class="form-control"
						name="Email">
				</fieldset>

				<fieldset class="form-group">
					<label>Faculty Department</label> <input type="text"
						value="<c:out value='${Faculty.department}' />"
						class="form-control" name="Department">
				</fieldset>
				<fieldset class="form-group">
					<label>Faculty Contact Number</label> <input type="text"
						value="<c:out value='${Faculty.contactNumber}' />"
						class="form-control" name="ContactNumber">
				</fieldset>

				<button type="submit" id="submitBtn" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
	<script src="jquery/jquery.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="maxcdn/bootstrap/js/bootstrap.min.js"></script>

	<!-- FACULTY ID VALIDATION 
	<script type="text/javascript">
		const facultyID = document.getElementById("facultyID");
		const paragraphElement = document.getElementById('myParagraph');
		const submitBtn = document.getElementById('submitBtn');

		let subString = "1";
		function checkFacultyID() {
			if (!facultyID.value.includes(subString)) {
				facultyID.focus();
				paragraphElement.textContent = 'Invalid faculty ID';
				submitBtn.disabled = true;

			} else {
				paragraphElement.textContent = 'faculty ID';
				submitBtn.disabled = false;
			}

		}
	</script>  -->
</body>
</html>