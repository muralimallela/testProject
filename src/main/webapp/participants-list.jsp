<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

HttpSession ses = request.getSession(false);
if (session == null || session.getAttribute("username") == null) {
	response.sendRedirect("adminLogin");
}
%>
<html>
<head>
<title>Participants Management</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style type="text/css">
*{
	margin : 0;
	padding : 0;
	box-sizing : border-box;
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
	<jsp:include page="ssit-logo.jsp"></jsp:include>
	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123456">
			<a href="#" class="navbar-brand"> Participants Management </a>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<br>
	<div class="row">

		<div class="container">
			<h3 class="text-center">List of Participants</h3>
			<hr>
			<div class="container text-left">
				<div class="row">
					<div class="col-md-6">
						<a href="<%=request.getContextPath()%>/newParticipant"
							class="btn btn-success disable-on-print">Assign Project </a>
					</div>
					<!-- search input -->
					<div class="col-md-6 text-right">
						<input type="text" id="searchInput" placeholder="Search...">
					</div>
				</div>
			</div>
			<br>
			<table class="table table-bordered" id="dataTable">
				<thead>
					<tr>
						<th>Batch</th>
						<th>Project Title</th>
						<th>Branch</th>
						<th>AcademicYear</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="Participants" items="${listParticipants}">
						<tr>
							<td><c:out value="${Participants.batch}" /></td>
							<td><c:forEach var="Project" items="${listProject}">
									<c:if test="${Project.projectID ==Participants.projectID }">
										<c:out value="${Project.projectTitle}" />
									</c:if>
								</c:forEach></td>
							<td><c:forEach var="Project" items="${listProject}">
									<c:if test="${Project.projectID ==Participants.projectID }">
										<c:out value="${Project.branch}" />
									</c:if>
								</c:forEach></td>
							<td><c:forEach var="Project" items="${listProject}">
									<c:if test="${Project.projectID ==Participants.projectID }">
										<c:out value="${Project.academicYear}" />
									</c:if>
								</c:forEach></td>
							<td><a
								href="editParticipant?participantID=<c:out value='${Participants.participantID}' />"><img
									class="image" alt="Edit icon" src="images/edit.png"
									title="Edit" height="18"></a> &nbsp; <a
								href="deleteParticipant?participantID=<c:out value='${Participants.participantID}' />"><img
									class="image" alt="Delete icon" src="images/trash.png"
									title="Delete" width="18"></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript" src="page-search.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>