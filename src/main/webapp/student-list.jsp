<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<link rel="stylesheet" type="text/css"
	href="maxcdn/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/datatables.min.css">
<link rel="stylesheet" href="css/buttons.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/overall.css">
<link rel="stylesheet" href="css/student-list.css">
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
	<jsp:include page="print-header.jsp"></jsp:include>
	<div class="row">
		<div class="container  ">
			<h3 class="text-center no-print container1">List of Students</h3>
			<hr class="no-print">
			<div class="container text-left no-print">
				<div class="row">
					<div class="col-md-6">
						<a href="<%=request.getContextPath()%>/newStudent"
							class="btn btn-success">Add New Student</a>
					</div>
				</div>
			</div>

			<!-- Filter Start -->
			<div class="container d-print-none"
				style="background-color: aliceblue; padding: 20px; margin-top: 20px">
				<form id="myForm" action="studentList" method="post">
					<div class="form-row">
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
							<label for="year">Pass Out Year </label> <select
								class="form-control" id="yearSelect" name="year">
								<option value="" hidden>Select Pass Out year</option>
							</select>
						</div>
						<div class="col-md-4">
							<label>&nbsp</label><br>
							<button type="submit" class="btn btn-primary">Filter</button>
						</div>
						<div class="col-md-2 d-flex  justify-content-end align-items-end">
							<label>&nbsp</label><br> <a type="button"
								class="btn  btn-lg"><img src="images/printer.png" width=30
								onclick="window.print()" title="Print"></a>
						</div>
					</div>
				</form>
			</div>
			<!-- Filter End -->
			<br>
			<div class="table-responsive text-nowrap ">
				<table class="table table-bordered table-striped " id="dataTable">
					<thead>
						<tr>
							<th>StudentID</th>
							<th class="no-print">Password</th>
							<th style="width: 200px">Name</th>
							<th>Email</th>
							<th class="no-print">Branch</th>
							<th class="no-print">Year</th>
							<th>Batch</th>
							<th>Role</th>
							<th>ContactNumber</th>
							<th class="no-print">Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="Student" items="${listStudent}">
							<tr>
								<td><c:out value="${Student.studentID}" /></td>
								<td class="no-print"><c:choose>
										<c:when test="${not empty Student.password}">
											<c:forEach var="char" items="${Student.password}">
												<c:out value="●●●●●●" />
											</c:forEach>
										</c:when>
										<c:otherwise>
										NULL
									</c:otherwise>
									</c:choose></td>
								<td style="width: 280px"><c:out
										value="${Student.firstName}" /> <c:out
										value="${Student.lastName}" /></td>
								<td><c:out value="${Student.email}" /></td>
								<td class="no-print"><c:out value="${Student.department}" /></td>
								<td class="no-print"><c:out value="${Student.year}" /></td>
								<td><c:out value="${Student.batch.substring(4)}" /></td>
								<td><c:out value="${Student.role}" /></td>
								<td><c:out value="${Student.contactNumber}" /></td>
								<td class="no-print"><a
									href="editStudent?StudentID=<c:out value='${Student.studentID}' />"><img
										class="image" alt="" src="images/edit.png" title="Edit"
										width=18></a>&nbsp; <a
									href="deleteStudent?StudentID=<c:out value='${Student.studentID}' />"><img
										class="image" alt="" src="images/trash.png" title="Delete"
										width=18></a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	
	<script src="jquery/jquery.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="maxcdn/bootstrap/js/bootstrap.min.js"></script>
	<script src="js/datatables.min.js"></script>
	
	<script src="js/dataTables.js"></script>
	<script type="text/javascript" src="js/yearGenerator.js"></script>
	
</body>
</html>