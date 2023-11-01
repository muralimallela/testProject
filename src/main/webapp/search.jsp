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
<%@ page
	import="java.sql.*, projectManagement.dao.SqlConnection,projectManagement.dao.SearchDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<link rel="stylesheet" type="text/css" href="maxcdn/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/overall.css">
<link rel="stylesheet" href="css/search.css">

</head>
<body>

	<!-- Navigation Start -->
	<%
	String studentID = (String) request.getAttribute("studentID");
	String facultyname = (String) request.getAttribute("searchFaculty");
	String role = (String) request.getAttribute("searchRole");
	%>
	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<jsp:include page="ssit-logo.jsp"></jsp:include>
			<a href="#" class="navbar-brand"> Search </a>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<!-- Navigation End -->

	<!-- Search Start -->
	<div class="container container-edit"
		style="background-color: aliceblue; padding: 20px; ">
		<form id="myForm" action="" method="post">
			<div class="form-row">
				<div class="col-md-4">
					<label for="searchStudent">Student ID:</label> <input type="text"
						class="form-control" id="searchStudent" name="searchStudent"
						placeholder="Enter Student ID">
				</div>
				<div class="col-md-4">
					<label for="searchFaculty">Faculty Name:</label> <select
						class="form-control" id="searchFaculty" name="searchFaculty">

						<option value="" hidden>Select Faculty</option>
						<c:forEach var="Faculty" items="${listFaculty}">
							<option value="<c:out value="${Faculty.firstName}"/>"><c:out
									value="${Faculty.firstName}" />
								<c:out value="${Faculty.lastName}" />
							</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-4">
					<label for="searchRole">Role:</label> <select class="form-control"
						id="searchRole" name="searchRole">
						<option value="" hidden>Select Role</option>
						<option value="Leader">Leader</option>
						<option value="Member">Member</option>
					</select>
				</div>
			</div>

			<button type="submit" class="btn btn-primary mt-3"
				onclick="checkInputs()">Search</button>
		</form>


	</div>

	<!-- Search End -->

	<hr>
	<div class="container ">

		<p id="result"></p>
		<!-- STUDENT SEARCH TABLE BEGIN -->

		<c:if test="${stringList != null }">
			<c:if test="${stringList == '[]' }">
				<p>Student Not Found</p>
			</c:if>
			<c:if test="${stringList != '[]' }">
				<h5>Searched Students:</h5>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Student ID</th>
							<th>Student Name</th>

							<th>Project Title</th>
							<th>Faculty Name</th>

							<th>Role</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><c:out value="${stringList.get(0) }"></c:out></td>
							<td><c:out value="${stringList.get(1) }"></c:out> <c:out
									value="${stringList.get(2) }"></c:out></td>
							<td><c:out value="${stringList.get(3) }"></c:out></td>
							<td><c:out value="${stringList.get(4) }"></c:out> <c:out
									value="${stringList.get(5) }"></c:out></td>
							<td><c:out value="${stringList.get(6) }"></c:out></td>
						</tr>
					</tbody>


				</table>
			</c:if>
		</c:if>

		<!-- STUDENT SEARCH TABLE END -->


		<!-- FACULTY SEARCH TABLE BEGIN -->

		<c:if test="${subLists != null }">
			<c:if test="${subLists == '[]' }">
				<p>Project not Assigned</p>
			</c:if>
			<c:if test="${stringList != '[]' }">
				<h5>Searched Students:</h5>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Student ID</th>
							<th>Student First Name</th>
							<th>Student Last Name</th>
							<th>Project Title</th>
							<th>Faculty First Name</th>
							<th>Faculty Last Name</th>
							<th>Role</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${subLists}">
							<tr>
								<c:forEach var="cell" items="${row}" varStatus="loop">
									<td><c:out value="${cell}" /></td>
								</c:forEach>
							</tr>
						</c:forEach>
					</tbody>


				</table>
			</c:if>
		</c:if>

		<!-- FACULTY SEARCH TABLE END -->

		<!-- ROLL SEARCH TABLE BEGIN -->

		<c:if test="${ subRoleLists != null }">
			<c:if test="${subRoleLists == '[]' }">
				<p>Project not Assigned</p>
			</c:if>
			<c:if test="${subRoleLists != '[]' }">

				<h5>Searched Students:</h5>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Student ID</th>
							<th>Student First Name</th>
							<th>Student Last Name</th>
							<th>Project Title</th>
							<th>Faculty First Name</th>
							<th>Faculty Last Name</th>
							<th>Role</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${subRoleLists}">
							<tr>
								<c:forEach var="cell" items="${row}" varStatus="loop">
									<td><c:out value="${cell}" /></td>
								</c:forEach>
							</tr>
						</c:forEach>
					</tbody>


				</table>

			</c:if>
		</c:if>
		<!-- ROLL SEARCH TABLE END -->
	</div>


	<script>
		function checkInputs() {
			let searchStudent = document.getElementById("searchStudent");
			let searchFaculty = document.getElementById("searchFaculty");
			let searchRole = document.getElementById("searchRole");
			let resultElement = document.getElementById("result");

			let inputValueStudent = searchStudent.value.trim();
			let inputValueFaculty = searchFaculty.value.trim();
			let inputValueRole = searchRole.value.trim();

			if (inputValueStudent !== "" && inputValueFaculty === ""
					&& inputValueRole === "") {
				function changeAction() {
					var newAction = "searchStudent";
					var form = document.getElementById("myForm");

					form.action = newAction;
					console.log("Form action changed to: " + newAction);
				}
				changeAction();

			}
			if (inputValueStudent === "" && inputValueFaculty !== ""
					&& inputValueRole === "") {
				resultElement.textContent = "inputValueFaculty is not empty.";
				function changeAction() {
					var newAction = "searchFaculty";
					var form = document.getElementById("myForm");

					form.action = newAction;
					console.log("Form action changed to: " + newAction);
				}
				changeAction();
			}
			if (inputValueStudent === "" && inputValueFaculty === ""
					&& inputValueRole !== "") {
				resultElement.textContent = "searchRole is not empty.";
				function changeAction() {
					var newAction = "searchRole";
					var form = document.getElementById("myForm");

					form.action = newAction;
					console.log("Form action changed to: " + newAction);
				}
				changeAction();
			}
			if (inputValueStudent === "" && inputValueFaculty === ""
					&& inputValueFaculty === "null" && inputValueRole === "") {

			}
		}
	</script>
	<script src="jquery/jquery.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="maxcdn/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>