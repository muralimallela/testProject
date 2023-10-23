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

@WebServlet({"/ReportsServlet","/reports","/allReports"})
public class ReportsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ReportsDAO  reportsDAO;
	public void init() {
		new Reports();
		reportsDAO = new ReportsDAO();
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		switch (action) {

		case "/allReports":
			allReports(request, response);
			break;
		case "/reports":
			reportsPage(request,response);
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

	private void allReports(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Reports> allReports = reportsDAO.selectAllRports();
		request.setAttribute("allReports", allReports);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("reports-page.jsp");
		dispatcher.forward(request, response);
		
	}
}
