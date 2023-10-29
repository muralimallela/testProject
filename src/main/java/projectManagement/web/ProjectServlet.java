package projectManagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectManagement.model.Faculty;
import projectManagement.model.Project;
import projectManagement.dao.FacultyDAO;
import projectManagement.dao.ProjectDAO;

@WebServlet({ "/insertProject", "/listProject", "/updateProject", "/deleteProject", "/newProject", "/editProject",
		"/insertMultipleProjects", "/projectFilter" })

public class ProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProjectDAO projectDAO;
	private FacultyDAO facultyDAO;

	public void init() {
		projectDAO = new ProjectDAO();
		facultyDAO = new FacultyDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		try {
			switch (action) {

			case "/newProject":
				showNewProjectForm(request, response);
				break;
			case "/insertProject":
				insertProject(request, response);
				break;
			case "/insertMultipleProjects":
				insertMultipleProjects(request, response);
				break;
			case "/deleteProject":
				deleteProject(request, response);
				break;
			case "/editProject":
				showProjectEditForm(request, response);
				break;
			case "/updateProject":
				updateProject(request, response);
				break;
			case "/listProject":
				listProject(request, response);
				break;
			case "/projectFilter":
				projectFilter(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void projectFilter(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String academicYear = request.getParameter("academicYear");
		String branch = request.getParameter("branch");
		String projectType = request.getParameter("projectType");

		List<Project> listProject = projectDAO.filterProjects(academicYear, branch, projectType);
		request.setAttribute("listProject", listProject);

		List<Faculty> listFaculty = facultyDAO.selectAllFaculty();
		request.setAttribute("listFaculty", listFaculty);

		RequestDispatcher dispatcher = request.getRequestDispatcher("project-list.jsp");
		dispatcher.forward(request, response);

	}

	private void insertMultipleProjects(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String ProjectID = request.getParameter("projectID");
		String academicYear = request.getParameter("academicYear");
		String branch = request.getParameter("branch");
		String projectType = request.getParameter("projectType");

		String projectTitles[] = request.getParameterValues("projectTitle[]");
		String facultyAdvisorIDs[] = request.getParameterValues("facultyAdvisorID[]");
		String batches[] = request.getParameterValues("batch[]");

		if (projectTitles != null && facultyAdvisorIDs != null && projectTitles.length == facultyAdvisorIDs.length) {
			for (int i = 0; i < projectTitles.length; i++) {
				String projectTitle = projectTitles[i];
				String facultyAdvisorID = facultyAdvisorIDs[i];
				String batch = batches[i];
				batch =  academicYear.substring(2,4) + branch.substring(0, 2) + ((batch.length() == 1) ? "0" + batch : batch);
				if (projectTitle != null && !projectTitle.isEmpty()) {
					System.out.println("projectTitles: " + projectTitle + ", facultyAdvisorID: " + facultyAdvisorID
							+ " batch : " + batch);
					Project newProject = new Project(ProjectID, projectTitle, projectType, facultyAdvisorID, branch,
							batch, academicYear);
					System.out.println(newProject);
					projectDAO.insertProject(newProject);
				}
			}
		}
		response.sendRedirect("listProject");

	}

	private void listProject(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Project> listProject = projectDAO.selectAllProjects();
		request.setAttribute("listProject", listProject);

		List<Faculty> listFaculty = facultyDAO.selectAllFaculty();
		request.setAttribute("listFaculty", listFaculty);

		RequestDispatcher dispatcher = request.getRequestDispatcher("project-list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewProjectForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Faculty> listFaculty = facultyDAO.selectAllFaculty();
		request.setAttribute("listFaculty", listFaculty);
		RequestDispatcher dispatcher = request.getRequestDispatcher("multi-project-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showProjectEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		String ProjectID = request.getParameter("projectID");
		Project existingProject = projectDAO.selectProject(ProjectID);

		List<Faculty> listFaculty = facultyDAO.selectAllFaculty();
		request.setAttribute("listFaculty", listFaculty);

		RequestDispatcher dispatcher = request.getRequestDispatcher("project-form.jsp");
		request.setAttribute("Project", existingProject);
		dispatcher.forward(request, response);

	}

	private void insertProject(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		String ProjectID = request.getParameter("projectID");
		String projectTitle = request.getParameter("projectTitle");
		String projectType = request.getParameter("projectType");
		String facultyAdvisorID = request.getParameter("facultyAdvisorID");
		String branch = request.getParameter("branch");
		String batch = request.getParameter("batch");
		String academicYear = request.getParameter("academicYear");
		batch = academicYear.substring(2,4) + branch.substring(0, 2) + ((batch.length() == 1) ? "0" + batch : batch);
		Project newProject = new Project(ProjectID, projectTitle, projectType, facultyAdvisorID, branch,batch, academicYear);
		projectDAO.insertProject(newProject);
		response.sendRedirect("listProject");
	}

	private void updateProject(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String projectID = request.getParameter("projectID");
		String projectTitle = request.getParameter("projectTitle");
		String projectType = request.getParameter("projectType");
		String facultyAdvisorID = request.getParameter("facultyAdvisorID");
		String branch = request.getParameter("branch");
		String batch = request.getParameter("batch");
		String academicYear = request.getParameter("academicYear");
		Project book = new Project(projectID, projectTitle, projectType, facultyAdvisorID, branch,batch, academicYear);
		projectDAO.updateProject(book);
		response.sendRedirect("listProject");
	}

	private void deleteProject(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String projectID = request.getParameter("projectID");
		projectDAO.deleteProject(projectID);
		response.sendRedirect("listProject");

	}

}
