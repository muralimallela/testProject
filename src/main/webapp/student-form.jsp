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
<link rel="stylesheet" type="text/css" href="css/overall.css">

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
	<div class="container container1 col-md-5 ">
		<div class="card">
			<div class="card-body">
				<c:if test="${Student != null}">
					<form action="updateStudent" method="post">
				</c:if>
				<c:if test="${Student == null}">
					<form action="insertStudent" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${Student != null}">
									Edit Student
								</c:if>
						<c:if test="${Student == null}">
									Add New Student
								</c:if>
					</h2>
				</caption>

				<c:if test="${Student != null}">
					<input type="hidden" name="StudentID"
						value="<c:out value='${Student.studentID}' />" />
				</c:if>

				<c:if test="${Student== null}">
					<fieldset class="form-group">
						<label>HallTicket Number </label> <input type="text"
							name="StudentID" id="StudentID" onblur="checkStudentID()"
							class="form-control" required="required">
					</fieldset>
					<p id="myParagraph"></p>
				</c:if>
				<fieldset class="form-group">
					<label>Password</label> <input type="text"
						value="<c:out value='${Student.password}' />" class="form-control"
						name="Password" required="required">
				</fieldset>
				<fieldset class="form-group">
					<label>First Name</label> <input type="text" id="FirstName"
						value="<c:out value='${Student.firstName}' />"
						class="form-control" name="FirstName" required="required">
				</fieldset>
				<fieldset class="form-group">
					<label>Last Name</label> <input type="text"
						value="<c:out value='${Student.lastName}' />" class="form-control"
						name="LastName" id="LastName" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Email</label> <input type="text"
						value="<c:out value='${Student.email}' />" class="form-control"
						name="Email" required>
				</fieldset>
				<fieldset class="form-group">
					<label>Pass Out Year</label> <input type="text"
						value="<c:out value='${Student.year}' />" class="form-control"
						name="Year" id="Year">
				</fieldset>

				<fieldset class="form-group">
					<label>Department</label> <input type="text"
						value="<c:out value='${Student.department}' />"
						class="form-control" name="Department" id="Department" required>
				</fieldset>
				<fieldset class="form-group">
					<label>Batch</label> <input type="text"
						value="<c:out value="${Student.batch.substring(4)}" />"
						class="form-control" name="Batch" id="Batch" required>
				</fieldset>
				<fieldset class="form-group">
					<label>Role</label> <select class="form-control" name="Role"
						required>
						<option value="" hidden>Select Role</option>
						<c:if test="${Student != null}">
							<option value="${Student.role}" selected hidden>${Student.role}</option>
						</c:if>
						<option value="Member">Member</option>
						<option value="Leader">Leader</option>
					</select>
				</fieldset>
				<fieldset class="form-group">
					<label>Contact Number</label> <input type="text"
						value="<c:out value='${Student.contactNumber}' />"
						class="form-control" name="ContactNumber" id="ContactNumber"
						required>
				</fieldset>
				<p id="numberErrorMsg" style="color: orange"></p>
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

	<script src="../js/student-form.js"></script>
</body>

</html>