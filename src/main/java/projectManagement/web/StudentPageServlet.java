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
import javax.servlet.http.HttpSession;

import projectManagement.dao.FacultyDAO;
import projectManagement.dao.StudentReviewDAO;
import projectManagement.dao.studentDAO;
import projectManagement.model.Faculty;
import projectManagement.model.Project;
import projectManagement.model.Student;

@WebServlet({ "/StudentPageServlet", "/StudentLogin", "/StudentLogout", "/StudentEdit", "/StudentUpdate",
		"/signupSuccess", "/student", "/studentLogin", "/StudentSignup", "/studentSignup", })
public class StudentPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private studentDAO studentDAO;
	private FacultyDAO facultyDAO;
	private StudentReviewDAO studentReviewDAO;

	@Override
	public void init() {
		studentDAO = new studentDAO();
		facultyDAO = new FacultyDAO();
		studentReviewDAO = new StudentReviewDAO();
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
			case "/StudentLogin":
				studentLogin(request, response);
				break;
//			case "/StudentEdit":
//				showStudentEditForm(request, response);
//				break;
//			case "/StudentUpdate":
//				updateStudent(request, response);
//				break;
			case "/StudentLogout":
				Logout(request, response);
				break;
			case "/studentLogin":
				studentLoginPage(request, response);
				break;
			case "/StudentSignup":
				studentSignup(request, response);
				break;
			case "/studentSignup":
				studentSignupPage(request, response);
				break;
			case "/student":
				studentPage(request, response);
				break;
			case "/signupSuccess":
				signupSuccessPage(request, response);
				break;
			}
		} catch (Exception e) {

		}

	}

	// studentLogin

	private void studentLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String studentID = request.getParameter("studentID");
		String password = request.getParameter("password");
		System.out.println(studentID);
		boolean status = studentDAO.validate(studentID, password);
		if (status) {
			HttpSession session = request.getSession(false);
			session.setAttribute("studentID", studentID);
			int sessionTimeoutInSeconds = 60 * 60;
			session.setMaxInactiveInterval(sessionTimeoutInSeconds);
			response.sendRedirect("student");

		} else {
			request.setAttribute("errorMessage", "Incorrect HallTicket Number or password");
			request.getRequestDispatcher("studentLogin").forward(request, response);

		}
	}

	// showStudentEditForm
	/*
	 * private void showStudentEditForm(HttpServletRequest request,
	 * HttpServletResponse response) throws SQLException, ServletException,
	 * IOException { String studentID = request.getParameter("studentID"); Student
	 * existingStudent = studentDAO.selectStudent(studentID); RequestDispatcher
	 * dispatcher = request.getRequestDispatcher("studentSignup");
	 * request.setAttribute("Student", existingStudent); common(request, response,
	 * studentID);
	 *
	 * dispatcher.forward(request, response);
	 *
	 * }
	 */

	// updateStudent

	/*
	 * private void updateStudent(HttpServletRequest request, HttpServletResponse
	 * response) throws SQLException, IOException, ServletException { String
	 * StudentID = request.getParameter("StudentID"); String Password =
	 * request.getParameter("Password"); String FirstName =
	 * request.getParameter("FirstName"); String LastName =
	 * request.getParameter("LastName"); String Email =
	 * request.getParameter("Email"); String Department =
	 * request.getParameter("Department"); int Year =
	 * Integer.parseInt(request.getParameter("Year")); String ContactNumber =
	 * request.getParameter("ContactNumber"); Student book = new Student(StudentID,
	 * Password, FirstName, LastName, Email, Department, Year, ContactNumber);
	 * studentDAO.updateStudent(book); common(request, response, StudentID);
	 * RequestDispatcher dispatcher = request.getRequestDispatcher("student");
	 * dispatcher.forward(request, response); }
	 */

	// Logout

	private void Logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		response.sendRedirect("studentLogin");
	}

	// common

//	private void common(HttpServletRequest request, HttpServletResponse response, String StudentID) {
//
//		Student existingStudent = studentDAO.selectStudent(StudentID);
//		request.setAttribute("student", existingStudent);
//
//		List<String> project = new ArrayList<>();
//		project = studentReviewDAO.selectStudent(StudentID);
//		request.setAttribute("project", project);
//		System.out.println(project);
//
//		List<Reviews> reviews = new ArrayList<>();
//		reviews = reviewsDAO.selectAllReviews(StudentID);
//		request.setAttribute("listReviews", reviews);
//		System.out.println(reviews);
//	}

	// studentPage

	private void studentPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String studentID = (String) session.getAttribute("studentID");

		Student existingStudent = studentDAO.selectStudent(studentID);
		request.setAttribute("student", existingStudent);
		List<Faculty> listFaculty = facultyDAO.selectAllFaculty();
		request.setAttribute("listFaculty", listFaculty);
		List<Project> projects = studentReviewDAO.selectStudent(studentID);
		request.setAttribute("projects", projects);
		System.out.println(projects);

//		List<Reviews> reviews = new ArrayList<>();
//		reviews = reviewsDAO.selectAllReviews(studentID);
//		request.setAttribute("listReviews", reviews);
//		System.out.println(reviews);

		RequestDispatcher dispatcher = request.getRequestDispatcher("student-page.jsp");
		dispatcher.forward(request, response);

	}

	// studentSignup

	private void studentSignup(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		String StudentID = request.getParameter("StudentID");
		String Password = request.getParameter("Password");
		String FirstName = request.getParameter("FirstName");
		String LastName = request.getParameter("LastName");
		String Email = request.getParameter("Email");
		String Department = request.getParameter("Department");
		int Year = Integer.parseInt(request.getParameter("Year"));
		String batch = request.getParameter("Batch");
		batch = ((Year-1) % 100) + Department.substring(0, 2) + ((batch.length() == 1) ? "0" + batch : batch);
		String role = request.getParameter("Role");
		String ContactNumber = request.getParameter("ContactNumber");

		Student newStudent = new Student(StudentID, Password, FirstName, LastName, Email, Department, Year, batch, role,
				ContactNumber);
		studentDAO.insertStudent(newStudent);
		response.sendRedirect("signupSuccess");

	}

	// studentSignupPage

	private void studentSignupPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("studentSignup.jsp");
		dispatcher.forward(request, response);
	}

	// signupSuccessPage

	private void signupSuccessPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("signup-success.jsp");
		dispatcher.forward(request, response);

	}

	// studentLoginPage

	private void studentLoginPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("studentLogin.jsp");
		dispatcher.forward(request, response);

	}

}
