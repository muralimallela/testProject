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
	private static final String STUDENT_REVIEW_SEARCH = "SELECT"+" s.studentID,s.firstname,s.lastname,s.year,p.projectID,p.projecttitle,p.projectType,f.firstname,f.lastname"+
			" FROM projects p"+
			" JOIN students s ON s.batch = p.batch"+
			" JOIN faculty f ON f.facultyID = p.facultyAdvisorID"+
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
