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

import projectManagement.dao.ReviewsDAO;
import projectManagement.dao.StudentReviewDAO;
import projectManagement.model.Reviews;

@WebServlet({ "/ReviewServlet","/deleteReview", "/studentReview","/searchStudentReview","/insertReview","/updateReview","/reviewList" })
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private StudentReviewDAO studentReviewDAO;
	private ReviewsDAO reviewsDAO;
	
	public void init() {
		studentReviewDAO = new StudentReviewDAO();
		reviewsDAO = new ReviewsDAO();
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
			case "/searchStudentReview":
				searchStudent(request, response);
				break;
//			case "/newReview":
//				showNewProjectForm(request, response);
//				break;
			case "/insertReview":
				insertReview(request, response);
				break;
			case "/deleteReview":
				deleteReview(request, response);
				break;
//			case "/editReview":
//				showProjectEditForm(request, response);
//				break;
			case "/updateReview":
				updateReview(request, response);
				break;
			case "/reviewList":
				reviewList(request, response);
				break;

			}

		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	private void reviewList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String studentID = request.getParameter("studentID");
		List<Reviews> listReviews = reviewsDAO.selectAllReviews(studentID);
		request.setAttribute("listReviews", listReviews);
		RequestDispatcher dispatcher = request.getRequestDispatcher("student-review.jsp");
		dispatcher.forward(request, response);
		
	}

	private void updateReview(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		int reviewID = Integer.parseInt(request.getParameter("reviewID"));
		String studentID = request.getParameter("studentID");
		int reviewPoints = Integer.parseInt(request.getParameter("reviewPoints")) ;
		String remarks = request.getParameter("remarks");
		String reviewedDate = request.getParameter("reviewedDate");
		String reviewedFaculty = request.getParameter("reviewedFaculty");
		Reviews book = new Reviews(reviewID, studentID, reviewPoints, remarks,reviewedDate,reviewedFaculty);
		reviewsDAO.updateReview(book);
		response.sendRedirect("searchStudentReview?studentID="+studentID);
		
	}

	private void deleteReview(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		int reviewID = Integer.parseInt(request.getParameter("reviewID"));
		String studentID = request.getParameter("studentID");
		System.out.println(reviewID);
		reviewsDAO.deleteReview(reviewID);
		response.sendRedirect("searchStudentReview?studentID="+studentID);
		
	}

	private void insertReview(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		String studentID = request.getParameter("studentID");
		int reviewPoints = Integer.parseInt(request.getParameter("reviewPoints")) ;
		String remarks = request.getParameter("remarks");
		String reviewedDate = request.getParameter("reviewedDate");
		String reviewedFaculty = request.getParameter("reviewedFaculty");
		
		Reviews newReview = new Reviews(studentID, reviewPoints, remarks,reviewedDate,reviewedFaculty);
		reviewsDAO.insertReview(newReview);
		response.sendRedirect("searchStudentReview?studentID="+studentID);
		
	}

	private void searchStudent(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String studentID = request.getParameter("studentID");
		List<String> student = new ArrayList<>();
		student = studentReviewDAO.selectStudent(studentID);
		System.out.println(student);
		
		List<Reviews> listReviews = reviewsDAO.selectAllReviews(studentID);
		request.setAttribute("listReviews", listReviews);
		System.out.println(listReviews);
		request.setAttribute("student", student);
		RequestDispatcher dispatcher = request.getRequestDispatcher("student-review.jsp");
		dispatcher.forward(request, response);
	}
	private void studentReview(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("student-review.jsp");
		dispatcher.forward(request, response);
	}

}
