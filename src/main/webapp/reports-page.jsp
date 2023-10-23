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
<title>reports</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
.table-bordered {
	text-align: center;
	padding: 10px;
}

.left-align {
	text-align: left;
	padding-left: 5px;
	border: 1px solid black;
}

@page {
	size: landscape;
	margin: none; /* Adjust margins as needed */
}

/* Example: Hide elements when printing */
@media print {
	.container .table-bordered {
		color: red;
		font-size: 12px;
	}
	.no-print {
		display: none;
	}
}
</style>

</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<jsp:include page="ssit-logo.jsp"></jsp:include>
			<a href="#" class="navbar-brand"> Reports </a>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<br>

	<div class="row">

		<div class="container">
			<!-- Search Start -->
			<div class="container"
				style="background-color: aliceblue; padding: 20px; margin-top: 20px">
				<form id="myForm" action="" method="post">
					<div class="form-row">
						<div class="col-md-3">
							<label for="branch">Branch Code:</label> <select
								class="form-control" id="branch" name="branch">
								<option value="" hidden>Select branch code</option>
								<option value="CS">CS</option>
								<option value="EE">EE</option>
								<option value="ME">ME</option>
								<option value="CM">CM</option>
								<option value="EC">EC</option>
							</select>
						</div>
						<div class="col-md-3">
							<label for="acYear">Academic Year:</label> <select
								class="form-control" id="academic-year-select">
								<option value="" hidden>Select academic year</option>
							</select>
						</div>
						<div class="col-md-4">
							<label>&nbsp</label><br>
							<button type="submit" class="btn btn-primary"
								onclick="checkInputs()">Filter</button>
						</div>


					</div>


				</form>


			</div>

			<!-- Search End -->
			<hr>

			<table class="table-bordered" id="dataTable">
				<thead>
					<tr>
						<th>Batch No.</th>
						<th>Student ID</th>
						<th style="width: 280px">Student Name</th>
						<th>Project Name</th>
						<th>Faculty Guide</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="Reports" items="${allReports}">
						<tr>
							<td><c:out value="${Reports.batch}" /></td>
							<td><c:out value="${Reports.studentID}" /></td>
							<td class="left-align"><c:out value="${Reports.studentName}" /></td>
							<td class="left-align"><c:out
									value="${Reports.projectTitle}" /></td>
							<td><c:out value="${Reports.facultyName}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- page-search -->
	<script type="text/javascript" src="page-search.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
        // Function to generate academic years dynamically
        function generateAcademicYears(startYear, endYear) {
            const academicYears = [];
            for (let year = endYear; year >= startYear; year--) {
                const academicYear = `${year}-${(year + 1).toString().slice(-2)}`;
                academicYears.push(academicYear);
            }
            return academicYears;
        }

        // Define the start and end years
        const startYear = 2000;
        const endYear = new Date().getFullYear();

        // Generate academic years
        const academicYears = generateAcademicYears(startYear, endYear);

        // Populate the select element with option tags
        const academicYearSelect = document.getElementById('academic-year-select');
        academicYears.forEach(year => {
            const option = document.createElement('option');
            option.value = year;
            option.text = year;
            academicYearSelect.appendChild(option);
        });
    </script>
</body>
</html>