
<button class="navbar-toggler" type="button" data-toggle="collapse"
	data-target="#navbarNav" aria-controls="navbarNav"
	aria-expanded="false" aria-label="Toggle navigation">
	<span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse justify-content-end" id="navbarNav">
	<ul class="navbar-nav">
		<li class="nav-item"><a
			href="<%=request.getContextPath()%>/admin" class="nav-link">Home</a></li>
		<li class="nav-item"><a
			href="<%=request.getContextPath()%>/search" class="nav-link" hidden>Search</a></li>
		<li class="nav-item"></li>

		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> Manage </a>
			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				<a class="dropdown-item"
					href="<%=request.getContextPath()%>/studentReview" class="nav-link">StudentReview</a>
				<a class="dropdown-item"
					href="<%=request.getContextPath()%>/listStudent">Students</a> <a
					class="dropdown-item"
					href="<%=request.getContextPath()%>/listFaculty">Faculty</a> <a
					class="dropdown-item"
					href="<%=request.getContextPath()%>/listParticipants">Assign
					Projects</a> <a class="dropdown-item"
					href="<%=request.getContextPath()%>/listProject">Projects</a>
			</div></li>
		<!-- REPORTS -->
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> Reports </a>
			<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLinkRight">
				<li><a class="dropdown-item" href="#">&laquo; Project Reports </a>
					<ul class="dropdown-menu dropdown-submenu dropdown-submenu-left">
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/projectReports?projectType=MiniProject">Mini Project</a></li>
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/projectReports?projectType=MajorProject">Major Project</a></li>
					</ul>
				</li>
				<li><a class="dropdown-item" href="#">&laquo; Review Reports </a>
					<ul class="dropdown-menu dropdown-submenu dropdown-submenu-left">
						<li><a class="dropdown-item" href="#">Mini Project</a></li>
						<li><a class="dropdown-item" href="#">Major Project</a></li>
					</ul>
				</li>
			</ul>
		</li>
		<!-- Reports END -->
		<li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>
	</ul>
</div>

<script>
	var currentPath = window.location.pathname;
	var navLinks = document.querySelectorAll('.navbar-nav a.nav-link');
	for (var i = 0; i < navLinks.length; i++) {
		var linkPath = navLinks[i].getAttribute('href');
		if (currentPath === linkPath) {
			navLinks[i].classList.add('active');
		}
	}
</script>
