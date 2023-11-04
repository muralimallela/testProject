package projectManagement.web;

import java.io.IOException;
//import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectManagement.dao.ReportsDAO;
import projectManagement.model.Reports;

@WebServlet({ "/ReportsServlet", "/reports", "/allReports", "/majorProjects", "/miniProjects","/projectReports"})
public class ReportsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReportsDAO reportsDAO;

	@Override
	public void init() {
		new Reports();
		reportsDAO = new ReportsDAO();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		switch (action) {

//		case "/allReports":
//			allReports(request, response);
//			break;
		case "/reports":
			reportsPage(request, response);
			break;
		case "/projectReports":
			peojectReports(request, response);
			break;

//			case "/insertProject":
//				insertProject(request, response);
//				break;
//			case "/deleteProject":
//				deleteProject(request, response);
//				break;
//			case "/editProject":
//				showProjectEditForm(request, response);
//				break;
//			case "/updateProject":
//				updateProject(request, response);
//				break;
//			case "/listProject":
//				listProject(request, response);
//				break;
		}

	}

	private void reportsPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("reports-page.jsp");
	}

	private void peojectReports(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String projectType = request.getParameter("projectType");
		String branch = request.getParameter("branch");
		String academicYear = request.getParameter("academicYear");
		List<Reports> allReports = reportsDAO.projectReports(projectType,branch,academicYear);
		request.setAttribute("allReports", allReports);
		request.setAttribute("projectType", projectType);
		RequestDispatcher dispatcher = request.getRequestDispatcher("reports-page.jsp");
		dispatcher.forward(request, response);

	}

//	private void majorProjects(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String branch = request.getParameter("branch");
//		String academicYear = request.getParameter("academicYear");
//		List<Reports> allReports = reportsDAO.selectMajorProjectRports(branch,academicYear);
//		request.setAttribute("allReports", allReports);
//
//		RequestDispatcher dispatcher = request.getRequestDispatcher("reports-page.jsp");
//		dispatcher.forward(request, response);
//
//	}
}
