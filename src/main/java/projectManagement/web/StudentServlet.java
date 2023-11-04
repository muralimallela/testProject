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

import projectManagement.dao.FacultyDAO;
import projectManagement.dao.studentDAO;
import projectManagement.model.Faculty;
import projectManagement.model.Student;

@WebServlet({ "/newFaculty", "/insertFaculty", "/listFaculty", "/updateFaculty", "/editFaculty", "/deleteFaculty",
		"/newStudent", "/insertStudent", "/deleteStudent", "/editStudent", "/updateStudent", "/studentList", })
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private studentDAO studentDAO;
	private FacultyDAO facultyDAO;

	@Override
	public void init() {
		studentDAO = new studentDAO();
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

		try {
			switch (action) {

			// Student Operations

			case "/newStudent":
				showNewStudentForm(request, response);
				break;
			case "/insertStudent":
				insertStudent(request, response);
				break;
			case "/deleteStudent":
				deleteStudent(request, response);
				break;
			case "/editStudent":
				showStudentEditForm(request, response);
				break;
			case "/updateStudent":
				updateStudent(request, response);
				break;
			case "/studentList":
				studentList(request, response);
				break;

			// Faculty Operations

			case "/newFaculty":
				showNewFacultyForm(request, response);
				break;
			case "/insertFaculty":
				insertFaculty(request, response);
				break;
			case "/deleteFaculty":
				deleteFaculty(request, response);
				break;
			case "/editFaculty":
				showFacultyEditForm(request, response);
				break;
			case "/updateFaculty":
				updateFaculty(request, response);
				break;
			case "/listFaculty":
				listFaculty(request, response);
				break;

			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	// Student Methods

	private void studentList(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String year = request.getParameter("year");
		String branch = request.getParameter("branch");
		List<Student> listStudent = studentDAO.selectAllStudents(year, branch);
		request.setAttribute("listStudent", listStudent);
		RequestDispatcher dispatcher = request.getRequestDispatcher("student-list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewStudentForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("student-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showStudentEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		String StudentID = request.getParameter("StudentID");
		Student existingStudent = studentDAO.selectStudent(StudentID);
		RequestDispatcher dispatcher = request.getRequestDispatcher("student-form.jsp");
		request.setAttribute("Student", existingStudent);
		dispatcher.forward(request, response);

	}

	private void insertStudent(HttpServletRequest request, HttpServletResponse response)
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
		response.sendRedirect("studentList");
	}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response)
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
		Student book = new Student(StudentID, Password, FirstName, LastName, Email, Department, Year, batch, role,
				ContactNumber);
		studentDAO.updateStudent(book);
		response.sendRedirect("studentList");
	}

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String StudentID = request.getParameter("StudentID");
		studentDAO.deleteStudent(StudentID);
		response.sendRedirect("studentList");

	}

	// Faculty Methods

	private void listFaculty(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Faculty> listFaculty = facultyDAO.selectAllFaculty();
		request.setAttribute("listFaculty", listFaculty);
		RequestDispatcher dispatcher = request.getRequestDispatcher("faculty-list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewFacultyForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("faculty-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showFacultyEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		String facultyID = request.getParameter("facultyID");
		Faculty existingFaculty = facultyDAO.selectFaculty(facultyID);
		RequestDispatcher dispatcher = request.getRequestDispatcher("faculty-form.jsp");
		request.setAttribute("Faculty", existingFaculty);
		dispatcher.forward(request, response);

	}

	private void insertFaculty(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		String facultyID = request.getParameter("facultyID");
		String FirstName = request.getParameter("FirstName");
		String LastName = request.getParameter("LastName");
		String Email = request.getParameter("Email");
		String Department = request.getParameter("Department");
		String ContactNumber = request.getParameter("ContactNumber");

		Faculty newFaculty = new Faculty(facultyID, FirstName, LastName, Email, Department, ContactNumber);
		facultyDAO.insertFaculty(newFaculty);
		response.sendRedirect("listFaculty");
	}

	private void updateFaculty(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String facultyID = request.getParameter("facultyID");
		String FirstName = request.getParameter("FirstName");
		String LastName = request.getParameter("LastName");
		String Email = request.getParameter("Email");
		String Department = request.getParameter("Department");
		String ContactNumber = request.getParameter("ContactNumber");
		Faculty book = new Faculty(facultyID, FirstName, LastName, Email, Department, ContactNumber);
		facultyDAO.updateFaculty(book);
		response.sendRedirect("listFaculty");
	}

	private void deleteFaculty(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String facultyID = request.getParameter("facultyID");
		facultyDAO.deleteFaculty(facultyID);
		response.sendRedirect("listFaculty");

	}

}