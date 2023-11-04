package projectManagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectManagement.dao.FacultyDAO;
import projectManagement.dao.SearchDAO;
import projectManagement.model.Faculty;

@WebServlet({ "/SearchServlet", "/search", "/searchStudent", "/searchFaculty", "/searchRole" })
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	SearchDAO searchDAO;
	FacultyDAO facultyDAO;

	@Override
	public void init() {
		searchDAO = new SearchDAO();
		facultyDAO = new FacultyDAO();
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
		System.out.println(action);
		try {
			switch (action) {
			case "/searchStudent":
				showStudent(request, response);
				break;
			case "/searchFaculty":
				showFaculty(request, response);
				break;
			case "/searchRole":
				showRole(request, response);
				break;
			default:
				search(request, response);
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void search(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Faculty> listFaculty = facultyDAO.selectAllFaculty();
		request.setAttribute("listFaculty", listFaculty);
		RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
		dispatcher.forward(request, response);
	}

	private void showStudent(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Faculty> listFaculty = facultyDAO.selectAllFaculty();
		request.setAttribute("listFaculty", listFaculty);
		String studentID = request.getParameter("searchStudent");
		List<String> stringList = new ArrayList<>();
		stringList = searchDAO.selectStudent(studentID);
		request.setAttribute("stringList", stringList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
		dispatcher.forward(request, response);

	}

	private void showFaculty(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Faculty> listFaculty = facultyDAO.selectAllFaculty();
		request.setAttribute("listFaculty", listFaculty);

		String searchFaculty = request.getParameter("searchFaculty");
		List<List<String>> stringList = new ArrayList<>();
		stringList = searchDAO.selectFaculty(searchFaculty);

		request.setAttribute("subLists", stringList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
		dispatcher.forward(request, response);

	}


	private void showRole(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Faculty> listFaculty = facultyDAO.selectAllFaculty();
		request.setAttribute("listFaculty", listFaculty);

		String searchRole = request.getParameter("searchRole");
		List<List<String>> stringList = new ArrayList<>();
		stringList = searchDAO.selectRole(searchRole);

		request.setAttribute("subRoleLists", stringList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
		dispatcher.forward(request, response);

	}
}
