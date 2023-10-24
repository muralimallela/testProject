<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

HttpSession ses = request.getSession(false);
String user = (String) session.getAttribute("studentID");
if (session == null || session.getAttribute("studentID") == null) {
	response.sendRedirect("studentLogin");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${student.firstName}"></c:out> <c:out
		value="${student.lastName}"></c:out></title>
<link rel="stylesheet" href="bootstrap\css\bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/student-page.css">
</head>
<body>
	<div class="header">
		<img src="images/SaiSpruthi.jpg" style="border-radius: 10px;"
			width=20% height=50>
		<h4 style="font-family: 'Dancing Script', cursive;">
			<c:out value="${student.firstName}"></c:out>
			<c:out value="${student.lastName}"></c:out>
		</h4>
		<nav class="navigation">
			<button class="btnlogout-user"
				onclick="window.location.href='studentLogin'">Logout</button>
		</nav>
	</div>
	<c:if test="${student !=null && student != '[]'}">

		<!-- STUDENT INFORMATION -->

		<div class="container mt-4">
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<div
							class="card-header d-flex justify-content-between align-items-center">
							<h5 class="mb-0">Student Information</h5>

							<!-- Edit Button -->
							<!--
							<form action="StudentEdit" method="post">
								<input type="text" name="studentID"
									value="${student.studentID }" hidden>
								<button class="btn btn-primary" type="submit" >Edit</button>
							</form>
							-->

						</div>

						<div class="card-body">
							<table class="table-bordered table">
								<tr>
									<th>Student ID</th>
									<td><c:out value="${fn:toUpperCase(student.studentID)}"></c:out></td>
								</tr>

								<tr>
									<th>Student Name</th>
									<td><c:out value="${student.firstName}"></c:out> <c:out
											value="${student.lastName}"></c:out></td>
								</tr>
								<tr>
									<th>Email</th>
									<td><c:out value="${student.email}"></c:out></td>
								</tr>
								<tr>
									<th>Branch</th>
									<td><c:out value="${student.department}"></c:out></td>
								</tr>
								<tr>
									<th>Joining Year</th>
									<td><c:out value="${student.year}"></c:out></td>
								</tr>
								<tr>
									<th>Role</th>
									<td><c:out value="${student.role}"></c:out></td>
								</tr>
								<tr>
									<th>Batch</th>
									<td><c:out value="${student.batch}"></c:out></td>
								</tr>
								<tr>
									<th>Contact Number</th>
									<td><c:out value="${student.contactNumber}"></c:out></td>
								</tr>
							</table>
						</div>
					</div>
					<!-- REVIEWS  -->
					<br>
				</div>

				<!-- PROJECT INFORMATION -->

				<div class="col-md-6">
					<div class="card">
						<div
							class="card-header d-flex justify-content-between align-items-center">
							<h5 class="mb-0">Project Information</h5>

							<c:if test="${ project !=null && project != '[]'}">
								<form action="ProjectEdit" method="post">
									<input type="text" name="studentID"
										value="${student.studentID }" hidden>
									<button class="btn btn-primary" type="submit" hidden>Edit</button>
								</form>
							</c:if>
							<c:if test="${project ==null || project == '[]'}">
								<form action="ProjectAdd" method="post">
									<input type="text" name="studentID"
										value="${student.studentID }" hidden>
									<button class="btn btn-primary" type="submit" hidden>ADD</button>
								</form>
							</c:if>
						</div>
						<c:if test="${ project ==null || project == '[]'}">
							<div class="card-body">
								<p>No project has been assigned yet</p>
							</div>
						</c:if>
						<c:if test="${project !=null && project != '[]'}">
							<div class="card-body custom-card-project">
								<table class="table table-bordered">
									<tr>
										<th>Project ID</th>
										<td><c:out value="${project.get(4)}"></c:out></td>
									</tr>

									<tr>
										<th>Title</th>
										<td><c:out value="${project.get(5)}"></c:out></td>
									</tr>

									<tr>
										<th>Faculty Name</th>
										<td><c:out value="${project.get(7)}"></c:out> <c:out
												value="${project.get(8)}"></c:out></td>
									</tr>
									<tr>
										<th>Description</th>
										<td><c:out value="${project.get(6)}"></c:out></td>
									</tr>
								</table>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<hr>
	</c:if>
</body>
</html>