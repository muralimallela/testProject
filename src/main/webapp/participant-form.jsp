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
</head>
<style>
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

#searchFaculty+.dropdown-menu {
	max-width: 200px; 
}
</style>
<body>

	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<jsp:include page="ssit-logo.jsp"></jsp:include>
			<a href="#" class="navbar-brand"> &nbsp;Participants Management </a>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<br>
	<div class="container col-md-5 container-edit">
		<div class="card">
			<div class="card-body">
				<c:if test="${Participants != null}">
					<form action="updateParticipant" method="post">
				</c:if>
				<c:if test="${Participants == null}">
					<form action="insertParticipant" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${Participants != null}">
                        Edit Assigned Project
                    </c:if>
						<c:if test="${Participants == null}">
                        Assign Project
                    </c:if>
					</h2>
				</caption>
				<c:if test="${Participants != null}">
					<input type="hidden" name="participantID"
						value="<c:out value='${Participants.participantID}' />" />
				</c:if>
				<!-- Placeholder for Academic Year field -->
				<div class="form-group">
					<label>Academic Year</label> <input type="text"
						class="form-control" name="academicYear"
						placeholder="Academic Year">
				</div>
				<div class="form-group">
					<label>Department</label> <input type="text" class="form-control"
						name="department" placeholder="Department">
				</div>
				<c:if test="${listProject != null}">
					<label for="Project">Project Title</label>
					<select class="form-control" id="projectID" name="projectID">

						<option value="" hidden>Select Project</option>

						<c:forEach var="Project" items="${listProject}">
							<c:if test="${Project.projectID ==Participants.projectID }">
								<option value="${Project.projectID}" selected hidden>${Project.projectID} - ${Project.projectTitle}</option>
							</c:if>
							<option value="<c:out value="${Project.projectID}"/>"><c:out
									value="${Project.projectID} - ${Project.projectTitle}" />
							</option>
						</c:forEach>
					</select>
				</c:if>
				<c:if test="${Participants == null}">
					<div class="form-group" id="studentInputs">
						<label>Batch</label>
						<div class="row mb-2">
							<div class="col">
								<input type="text" class="form-control" name="batch"
									placeholder="Batch" required>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${Participants != null}">
					<fieldset class="form-group">
						<label>Batch</label> <input type="text"
							value="<c:out value='${Participants.batch}' />"
							class="form-control" name="Batch" required="required">
					</fieldset>
				</c:if>
				<button type="submit" class="btn btn-success">Save</button>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
    $(document).ready(function () {
        $("#addStudent").click(function () {
            $("#studentInputs").append(`
                <div class="row mb-2">
                    <div class="col">
                        <input type="text" class="form-control" name="studentID[]" placeholder="Student ID" required>
                    </div>
                </div>
            `);

            $("#studentInputs .row:last-child").append(`
              <div class="col">
                <button type="button" class="btn btn-danger removeStudent small">Remove</button>
              </div>
            `);

            $(".removeStudent").click(function () {
                $(this).closest(".row").remove();
            });
        });
    });
</script>
</body>
</html>
