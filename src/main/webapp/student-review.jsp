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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student || Review</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style id="aby-style">
.custom-card-review {
	max-height: 93vh;
	overflow-y: auto;
}

.custom-card-project {
	max-height: 65vh;
	overflow-y: auto;
}
</style>
</head>
<body>
	<jsp:include page="ssit-logo.jsp"></jsp:include>
	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<a href="#" class="navbar-brand"> Student Review </a>
			<jsp:include page="admin-header.jsp"></jsp:include>
		</nav>
	</header>
	<br>
	<div class="container vertical-center">
		<div class="row">
			<div class="col-md-4 mx-auto">
				<form class="d-flex justify-content-center"
					action="searchStudentReview" method="post">
					<div class="input-group">
						<label for="student-id" class="sr-only">Student ID</label> <input
							type="text" id="studentID" name="studentID"
							class="form-control search-box" placeholder="Enter Student ID">
						<div class="input-group-append">
							<button type="submit" class="btn btn-primary">Search</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<hr>
	<c:if test="${student !=null && student != '[]'}">
		<div class="container mt-4">
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Student Information</h5>
						</div>
						<div class="card-body ">
							<h5 class="card-title">
								Student ID:
								<c:out value="${student.get(0)}"></c:out>
							</h5>
							<p class="card-text">
								Student Name:
								<c:out value="${student.get(1)}"></c:out>
								<c:out value="${student.get(2)}"></c:out>
							</p>
							<p class="card-text">
								Year:
								<c:out value="${student.get(3)}"></c:out>
							</p>
						</div>
						<div class="card-header">
							<h5 class="mb-0">Project Information</h5>
						</div>
						<div class="card-body custom-card-project">
							<p class="card-text">
								Project Title:
								<c:out value="${student.get(5)}"></c:out>
							</p>

							<p>
								Batch :
								<c:out value="${student.get(7)}"></c:out>
							</p>
							<p>
								Role :
								<c:out value="${student.get(8)}"></c:out>
							</p>
							<p class="card-text">
								Faculty Name:
								<c:out value="${student.get(9)}"></c:out>
								<c:out value="${student.get(10)}"></c:out>
							</p>
							<p class="card-text">
								Project Description:
								<c:out value="${student.get(6)}"></c:out>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 ">
					<div class="card">
						<div
							class="card-header d-flex justify-content-between align-items-center">
							<h5 class="mb-0">Reviews</h5>
							<button class="btn btn-primary" data-toggle="modal"
								data-target="#addReviewModal">Add Review</button>
						</div>
						<div class="card-body custom-card-review">
							<c:forEach var="Reviews" items="${listReviews}">
								<div class="media">
									<div class="media-body">
										<p>
											Review by<br> <span
												style="font-weight: 500; font-size: 20px"><c:out
													value="${Reviews.reviewedFaculty}" /></span> on
											<c:out value="${Reviews.reviewedDate}" />
										</p>
										<p>
											Points : <strong><c:out
													value="${Reviews.reviewPoints}" /></strong>/10
										</p>
										<p>
											<c:out value="${Reviews.remarks}" />
										</p>
										<p>
											<a
												href="deleteReview?reviewID=<c:out value='${Reviews.reviewID}' />&studentID=<c:out value='${Reviews.studentID}' />">Delete</a>
										</p>
									</div>
								</div>
								<hr>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Add Review Modal -->
		<div class="modal fade" id="addReviewModal" tabindex="-1"
			role="dialog" aria-labelledby="addReviewModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="addReviewModalLabel">Add Review</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="insertReview" method="post">
							<input type="hidden" name="studentID" value="${student.get(0)}">
							<div class="form-group">
								<label for="reviewedDate">Reviewed Date</label> <input
									type="date" class="form-control" id="reviewedDate"
									name="reviewedDate" placeholder="Enter reviewed date">
							</div>
							<div class="form-group">
								<label for="reviewedFaculty">Reviewed Faculty</label> <input
									type="text" class="form-control" id="reviewedFaculty"
									name="reviewedFaculty" placeholder="Enter reviewed faculty">
							</div>
							<div class="form-group">
								<label for="reviewPoints">Review Points</label> <select
									class="form-control" id="reviewPoints" name="reviewPoints">
									<option value="" hidden>Select Review Points</option>
									<%
									for (int i = 1; i <= 10; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
									}
									%>
								</select>
							</div>
							<div class="form-group">
								<label for="remarks">Remarks</label>
								<textarea class="form-control" id="remarks" name="remarks"
									rows="3" placeholder="Enter remarks"></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Submit
									Review</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</c:if>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>