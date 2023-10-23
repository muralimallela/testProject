package projectManagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentReviewDAO {

	public StudentReviewDAO() {
		 
	}
	private static final String STUDENT_REVIEW_SEARCH = "SELECT"+" s.studentID,s.firstname,s.lastname,s.year,pr.projectID,pr.projecttitle,pr.projectType,f.firstname,f.lastname"+
			" FROM participants pt"+
			" JOIN students s ON s.batch = pt.batch"+
			" JOIN projects pr ON pr.projectID = pt.projectID"+
			" JOIN faculty f ON f.facultyID = pr.facultyAdvisorID"+
			" WHERE s.StudentID=?;";
	
	SqlConnection sqlconnection = new SqlConnection();
	
	public List<String> selectStudent(String studentID) {
		List<String> student = new ArrayList<>();
		try (Connection connection = sqlconnection.getConnection();
				
				PreparedStatement preparedStatement = connection.prepareStatement(STUDENT_REVIEW_SEARCH);) {
			preparedStatement.setString(1, studentID);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				for (int i = 1; i <= 11; i++)
					student.add(rs.getString(i));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return student;
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
