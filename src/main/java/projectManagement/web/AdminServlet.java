package projectManagement.web;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import projectManagement.dao.AdminDAO;

@WebServlet({ "/AdminServlet", "/adminLogin", "/AdminLogin", "/Logout", "/admin" })
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AdminDAO adminDAO;

	public void init() {
		adminDAO = new AdminDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();
		System.out.println(action);
		switch (action) {

		case "/admin":
			adminPage(request, response);
			break;
		case "/AdminLogin":
			adminLogin(request, response);
			break;
		case "/adminLogin":
			adminLoginPage(request, response);
			break;
		case "/Logout":
			Logout(request, response);
			break;

		}
	}

	private void adminLoginPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("adminLogin.jsp");
		dispatcher.forward(request, response);

	}

	private void adminPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
		dispatcher.forward(request, response);

	}

	private void adminLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username);
		boolean status = adminDAO.validate(username, password);
		if (status) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			int sessionTimeoutInSeconds = 30 * 60;
			session.setMaxInactiveInterval(sessionTimeoutInSeconds);
			response.sendRedirect("admin");
		} else {
			request.setAttribute("errorMessage", "Incorrect username or password");
			request.getRequestDispatcher("adminLogin").forward(request, response);
		}
	}

	private void Logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		response.sendRedirect("adminLogin");
	}
}
