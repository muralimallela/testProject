<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Admin</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/overall.css">
<link rel="stylesheet" type="text/css" href="css/admin.css">

</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #123456;">
			<jsp:include page="ssit-logo.jsp"></jsp:include>
			<div style="padding-left: 20rem">
				<a href="#" class="navbar-brand"> Admin </a>
			</div>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<div class="container container-edit">
		<div class="row r">
		<!--  
			<div class="col-2">
				<a href="search" style="text-decoration: none">
					<button class="btn btn-primary btn-block"
						style="height: 150px; width: 180px">
						<h3>Search</h3>
					</button>
				</a>
			</div> -->
			<div class="col-2">
				<a href="studentList" style="text-decoration: none">
					<button class="btn btn-primary btn-block"
						style="height: 150px; width: 180px">
						<h3>Students</h3>
					</button>
				</a>
			</div>
			<div class="col-2">
				<a href="listFaculty" style="text-decoration: none">
					<button class="btn btn-primary btn-block"
						style="height: 150px; width: 180px">
						<h3>Faculty</h3>
					</button>
				</a>
			</div>
			<div class="col-2">
				<a href="listParticipants" style="text-decoration: none">
					<button class="btn btn-primary btn-block"
						style="height: 150px; width: 180px">
						<h3>Participants</h3>
					</button>
				</a>
			</div>
			<div class="col-2">
				<a href="listProject" style="text-decoration: none">
					<button class="btn btn-primary btn-block"
						style="height: 150px; width: 180px">
						<h3>Projects</h3>
					</button>
				</a>
			</div>
		</div>
	</div>
	<script src="bootstrap\js\bootstrap.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>