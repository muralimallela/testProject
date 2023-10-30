package projectManagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projectManagement.model.Project;
import projectManagement.model.Reviews;
import projectManagement.model.Student;

public class ReviewsDAO {

	public ReviewsDAO() {

	}

	SqlConnection sqlconnection = new SqlConnection();
	private static final String INSERT_REVIEW = "INSERT INTO reviews"
			+ "(reviewID ,studentID, projectID, guide, srFaculty, HOD) VALUES " + " ( ?, ?, ?, ?, ?, ? );";
	private static final String SELECT_REVIEW_BY_ID = "select * from reviews";
	private static final String SELECT_PROJECT = "select * from projects WHERE batch = ? AND projectType = ?";
	private static final String SELECT_STUDENT = "SELECT *  FROM `students` WHERE batch = ? ";
	private static final String SELECT_ALL_REVIEWS = "select * from reviews where studentID = ? ;";
	private static final String DELETE_REVIEW = "delete from reviews where reviewID = ? ;";
	private static final String UPDATE_REVIEW = "update reviews set studentID= ?, projectID =?, guide = ?, srFaculty = ?, HOD = ? where reviewID = ? ;";

	public void insertReview(Reviews reviews) throws SQLException {
		System.out.println(INSERT_REVIEW);

		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_REVIEW)) {
			preparedStatement.setInt(1, reviews.getReviewID());
			preparedStatement.setString(2, reviews.getStudentID());
			preparedStatement.setString(3, reviews.getProjectID());
			preparedStatement.setInt(4, reviews.getGuide());
			preparedStatement.setInt(5, reviews.getSrFaculty());
			preparedStatement.setInt(6, reviews.getHod());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Reviews selectReview(int reviewID) {
		Reviews review = null;

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REVIEW_BY_ID);) {
			preparedStatement.setInt(1, reviewID);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String studentID = rs.getString("studentID");
				String projectID = rs.getString("projectID");
				int guide = rs.getInt("guide");
				int srFaculty = rs.getInt("srFaculty");
				int hod = rs.getInt("HOD");
				int avg = rs.getInt("HOD");
				int marks = rs.getInt("Marks");
				review = new Reviews(reviewID, studentID, projectID, guide, srFaculty, hod, avg, marks);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return review;
	}
	public Project selectProject(String batch, String projectType) {
		Project project = null;

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROJECT);) {
			preparedStatement.setString(1, batch);
			preparedStatement.setString(2, projectType);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String projectID = rs.getString("projectID");
				String projectTitle = rs.getString("projectTitle");
//				String projectType = rs.getString("projectType");
				String facultyAdvisorID = rs.getString("facultyAdvisorID");
				String branch = rs.getString("branch");
//				String batch = rs.getString("batch");
				String AcademicYear = rs.getString("AcademicYear");
				project = new Project(projectID, projectTitle, projectType, facultyAdvisorID, branch, batch, AcademicYear);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return project;
	}

	public List<Student> selectStudent(String batch) {
		List<Student> student = new ArrayList<>();

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENT);) {
			preparedStatement.setString(1, batch);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String studentID = rs.getString("StudentID");
				String Password = rs.getString("Password");
				String FirstName = rs.getString("FirstName");
				String LastName = rs.getString("LastName");
				String Email = rs.getString("Email");
				String Department = rs.getString("Department");
				int Year = rs.getInt("Year");
//				String batch = rs.getString("batch");
				String role = rs.getString("role");
				String ContactNumber = rs.getString("ContactNumber");
				student.add(new Student(studentID, Password, FirstName, LastName, Email, Department, Year, batch, role,
						ContactNumber));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return student;
	}

	public List<Reviews> selectAllReviews() {

		List<Reviews> reviews = new ArrayList<>();

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_REVIEWS);) {

			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int reviewID = rs.getInt("reviewID");
				String studentID = rs.getString("studentID");
				String projectID = rs.getString("projectID");
				int guide = rs.getInt("guide");
				int srFaculty = rs.getInt("srFaculty");
				int hod = rs.getInt("HOD");
				int avg = rs.getInt("avg");
				int marks = rs.getInt("Marks");
				reviews.add(new Reviews(reviewID, studentID, projectID, guide, srFaculty, hod, avg, marks));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return reviews;
	}

	public boolean deleteReview(int reviewID) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_REVIEW);) {
			statement.setInt(1, reviewID);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateReview(Reviews review) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement statement = connection.prepareStatement(UPDATE_REVIEW);) {
			System.out.println("updated Review: " + statement);

			statement.setString(1, review.getStudentID());
			statement.setString(2, review.getProjectID());
			statement.setInt(3, review.getGuide());
			statement.setInt(4, review.getSrFaculty());
			statement.setInt(5, review.getHod());
			statement.setInt(6, review.getReviewID());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}
