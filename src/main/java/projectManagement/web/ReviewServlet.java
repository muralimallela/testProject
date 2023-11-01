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

import projectManagement.dao.ReviewsDAO;
import projectManagement.dao.StudentReviewDAO;
import projectManagement.dao.FacultyDAO;
import projectManagement.model.Faculty;
import projectManagement.model.Project;
import projectManagement.model.Reviews;
import projectManagement.model.Student;

@WebServlet({ "/ReviewServlet", "/deleteReview", "/studentReview", "/searchStudentReview", "/insertReview",
		"/updateReview", "/getBatch" })
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReviewsDAO reviewsDAO;
	private FacultyDAO facultyDAO;

	public void init() {
		new StudentReviewDAO();
		reviewsDAO = new ReviewsDAO();
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
			case "/studentReview":
				studentReview(request, response);
				break;
//			case "/searchStudentReview":
//				searchStudent(request, response);
//				break;
//			case "/newReview":
//				showNewProjectForm(request, response);
//				break;
			case "/insertReview":
				insertReview(request, response);
				break;
			case "/deleteReview":
				deleteReview(request, response);
				break;
			case "/getBatch":
				getBatch(request, response);
				break;
//			case "/updateReview":
//				updateReview(request, response);
//				break;
//			case "/reviewList":
//				reviewList(request, response);
//				break;

			}

		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	private void getBatch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String academicYear = request.getParameter("academicYear");
		String branch = request.getParameter("branch");
		String batch = request.getParameter("batch");
		String projectType = request.getParameter("projectType");
		batch = academicYear.substring(2, 4) + branch + ((batch.length() == 1) ? "0" + batch : batch);
		List<Student> studentsList = reviewsDAO.selectStudent(batch);
		Project project = reviewsDAO.selectProject(batch, projectType);
		request.setAttribute("studentList", studentsList);
		request.setAttribute("project", project);

		List<Faculty> listFaculty = facultyDAO.selectAllFaculty();
		request.setAttribute("listFaculty", listFaculty);

		RequestDispatcher dispatcher = request.getRequestDispatcher("review.jsp");
		dispatcher.forward(request, response);

	}
//
//	private void reviewList(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {

//		String studentID = request.getParameter("studentID");
//		List<Reviews> listReviews = reviewsDAO.selectAllReviews(studentID);
//		request.setAttribute("listReviews", listReviews);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("review.jsp");
//		dispatcher.forward(request, response);
//
//	}

//	private void updateReview(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, IOException {
//
//		int reviewID = Integer.parseInt(request.getParameter("reviewID"));
//		String studentID = request.getParameter("studentID");
//		int reviewPoints = Integer.parseInt(request.getParameter("reviewPoints"));
//		String remarks = request.getParameter("remarks");
//		String reviewedDate = request.getParameter("reviewedDate");
//		String reviewedFaculty = request.getParameter("reviewedFaculty");
//		Reviews book = new Reviews(reviewID, studentID, reviewPoints, remarks, reviewedDate, reviewedFaculty);
//		reviewsDAO.updateReview(book);
//		response.sendRedirect("searchStudentReview?studentID=" + studentID);
//
//	}

	private void deleteReview(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		int reviewID = Integer.parseInt(request.getParameter("reviewID"));
		String studentID = request.getParameter("studentID");
		System.out.println(reviewID);
		reviewsDAO.deleteReview(reviewID);
		response.sendRedirect("searchStudentReview?studentID=" + studentID);

	}

	private void insertReview(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int reviewID = 0;
		String projectID = request.getParameter("projectID");
		String[] studentIDs = request.getParameterValues("studentID[]");
		String[] guideStrings = request.getParameterValues("guide[]");
		String[] srFacultys = request.getParameterValues("srFaculty[]");
		String[] hods = request.getParameterValues("hod[]");
		System.out.println(guideStrings[0]);
		System.out.println(hods[0]);
		for (int i = 0; i < studentIDs.length; i++) {
			String studentID = studentIDs[i];
			int guide = (guideStrings[i] != "" ? Integer.parseInt(guideStrings[i]) : 0);
			int srFaculty = (srFacultys[i] != "" ? Integer.parseInt(srFacultys[i]) : 0);
			int hod = (hods[i] != "" ? Integer.parseInt(hods[i]) : 0);
			if (studentID != null && !studentID.isEmpty()) {
				System.out.println("studentID: " + studentID + ", guide: " + guide + " srFaculty: " + srFaculty);
				Reviews newReview = new Reviews(reviewID, studentID, projectID, guide, srFaculty, hod);
				System.out.println(newReview);
				reviewsDAO.insertReview(newReview);
			}
		}
		response.sendRedirect("studentReview");
	}

//	private void searchStudent(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, IOException, ServletException {
//		String studentID = request.getParameter("studentID");
//		List<String> student = new ArrayList<>();
//		student = studentReviewDAO.selectStudent(studentID);
//		System.out.println(student);
//
//		List<Reviews> listReviews = reviewsDAO.selectAllReviews(studentID);
//		request.setAttribute("listReviews", listReviews);
//		System.out.println(listReviews);
//		request.setAttribute("student", student);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("review.jsp");
//		dispatcher.forward(request, response);
//	}

	private void studentReview(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("review.jsp");
		dispatcher.forward(request, response);
	}

}
