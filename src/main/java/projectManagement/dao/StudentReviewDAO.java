package projectManagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projectManagement.model.Project;

public class StudentReviewDAO {

	public StudentReviewDAO() {

	}
	private static final String STUDENT_PROJECT = "SELECT p.ProjectID,p.ProjectTitle,p.ProjectType,p.FacultyAdvisorID,p.Branch,p.Batch,p.AcademicYear from projects p join students s on p.Batch=s.Batch where s.StudentID= ?";

	SqlConnection sqlconnection = new SqlConnection();

	public List<Project> selectStudent(String studentID) {
		List<Project> project = new ArrayList<>();
		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(STUDENT_PROJECT);) {
			preparedStatement.setString(1, studentID);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String projectID = rs.getString(1);
				System.out.println(projectID);
				String projectTitle = rs.getString(2);
				String projectType = rs.getString(3);
				String facultyAdvisorID = rs.getString(4);
				String branch = rs.getString(5);
				String batch = rs.getString(6);
				String AcademicYear = rs.getString(7);
				project.add(new Project(projectID, projectTitle, projectType, facultyAdvisorID, branch, batch, AcademicYear));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return project;
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
