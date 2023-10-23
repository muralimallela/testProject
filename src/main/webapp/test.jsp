<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>Faculty Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
</head>
<body>

    <header>
        <nav class="navbar navbar-expand-md  navbar-dark" style="background-color: #123455">
            <a href="#" class="navbar-brand"> Faculty Management Application </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a href="<%=request.getContextPath()%>/admin" class="nav-link ">Home</a></li>
                    <li class="nav-item"><a href="<%=request.getContextPath()%>/search" class="nav-link ">Search</a></li>
                    <li class="nav-item"><a href="<%=request.getContextPath()%>/studentReview"
                            class="nav-link ">StudentReview</a></li>
                    <li><a href="<%=request.getContextPath()%>/listStudent" class="nav-link ">Students</a></li>
                </ul>
                <ul class="navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/listFaculty" class="nav-link active">Faculty</a></li>
                </ul>
                <ul class="navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/listParticipants" class="nav-link ">Participants</a></li>
                </ul>
                <ul class="navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/listProject" class="nav-link">Projects</a></li>
                    <li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>
                </ul>
            </div>
        </nav>
    </header>
    <br>
    
    <div class="container mt-3">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#tabFacultyList">Faculty List</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tabFacultyForm">Faculty Form</a>
            </li>
        </ul>
        
        <div class="tab-content mt-3">
            <div class="tab-pane fade show active" id="tabFacultyList">
                <!-- Faculty List Content -->
                <div class="row">
                    <div class="container">
                        <h3 class="text-center">List of Faculty</h3>
                        <hr>
                        <!-- Rest of the faculty list code -->
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="tabFacultyForm">
                <!-- Faculty Form Content -->
                <div class="container col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <!-- Rest of the faculty form code -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- FACULTY ID VALIDATION 
    <script type="text/javascript">
        const facultyID = document.getElementById("facultyID");
        const paragraphElement = document.getElementById('myParagraph');
        const submitBtn = document.getElementById('submitBtn');

        let subString = "1";
        function checkFacultyID() {
            if (!facultyID.value.includes(subString)) {
                facultyID.focus();
                paragraphElement.textContent = 'Invalid faculty ID';
                submitBtn.disabled = true;
            } else {
                paragraphElement.textContent = 'faculty ID';
                submitBtn.disabled = false;
            }
        }
    </script>
    -->
</body>
</html>
