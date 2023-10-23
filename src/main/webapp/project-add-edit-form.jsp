<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
// Check if the user has an active session
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

HttpSession ses = request.getSession(false);
if (session == null || session.getAttribute("studentID") == null) {
	response.sendRedirect("studentLogin"); // Redirect to login page if not logged in
}
%>
<!DOCTYPE html>
<html>

<head>
    <title>Add Project Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
    <nav class="navbar navbar-expand-md  navbar-dark" style="background-color: #123455">
        <a href="#" class="navbar-brand"> Student </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>

        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="StudentLogout">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container col-md-5 mt-4">
        <div class="card">
            <div class="card-body">
                <h2>Add Project</h2>
                <form action="process_form.php" method="post">

                    <div class="form-group">
                        <label for="projectID">Project ID:</label>
                        <input type="text" class="form-control" id="projectID" name="projectID" required>
                    </div>

                    <div class="form-group">
                        <label for="projectTitle">Project Title:</label>
                        <input type="text" class="form-control" id="projectTitle" name="projectTitle" required>
                    </div>

                    

                    <div class="form-group">
                        <label for="facultyAdvisor">Faculty Advisor Name:</label>
                        <input type="text" class="form-control" id="facultyAdvisor" name="facultyAdvisor" required>
                    </div>

                    <div class="form-group">
                        <label for="batch">Batch:</label>
                        <input type="text" class="form-control" id="batch" name="batch" required>
                    </div>

                    <div class="form-group">
                        <label for="role">Role:</label>
                        <input type="text" class="form-control" id="role" name="role" required>
                    </div>

                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                    </div>

                    <button type="submit" class="btn btn-success">Add Project</button>
                </form>
            </div>
        </div>

    </div>

</body>

</html>