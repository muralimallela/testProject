package projectManagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projectManagement.model.Reports;

public class ReportsDAO {
	public ReportsDAO() {}

	SqlConnection sqlconnection = new SqlConnection();

	private static final String ALL_REPORTS = "SELECT * FROM participants_report ORDER BY StudentBatch";
	private static final String MAJOR_PROJECT_REPORTS = "SELECT * FROM major_project_report ORDER BY StudentBatch";
	private static final String MAJOR_PROJECT_REPORTS_BY_BRANCH = "SELECT * FROM major_project_report  WHERE branch = ? AND academicYear = ? ORDER BY StudentBatch";
	private static final String MINI_PROJECT_REPORTS = "SELECT * FROM mini_project_report ORDER BY StudentBatch";
	private static final String MINI_PROJECT_REPORTS_BY_BRANCH = "SELECT * FROM mini_project_report  WHERE branch = ? AND academicYear = ? ORDER BY StudentBatch";

	public List<Reports> projectReports(String projectType, String branch, String academicYear) {
		List<Reports> reports = new ArrayList<>();
		String query;

		if ("MajorProject".equalsIgnoreCase(projectType)) {
			if (branch != null && academicYear != null) {
				query = MAJOR_PROJECT_REPORTS_BY_BRANCH;
				
			} else {
				query = MAJOR_PROJECT_REPORTS;
				System.out.println("major Project");
			}
		} else if ("MiniProject".equalsIgnoreCase(projectType)) {
			if (branch != null && academicYear != null) {
				query = MINI_PROJECT_REPORTS_BY_BRANCH;
			} else {
				query = MINI_PROJECT_REPORTS;
				System.out.println("mini Project");
			}
		} else {
			// Handle invalid project types or other cases as needed
			return reports; // Return an empty list or handle the case appropriately
		}

		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query);) {
			if (branch != null && academicYear != null) {
				preparedStatement.setString(1, branch);
				preparedStatement.setString(2, academicYear);
			}

			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String batch = rs.getString("studentbatch");
				String studentID = rs.getString("studentID");
				String studentName = rs.getString("studentName");
				String projectTitle = rs.getString("projectTitle");
				String facultyName = rs.getString("facultyName");
				reports.add(new Reports(batch, studentID, studentName, projectTitle, facultyName));
				System.out.println(batch);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}

		return reports;
	}

	public List<Reports> selectMajorProjectRports(String branch, String academicYear) {
		List<Reports> reports = new ArrayList<>();

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(MAJOR_PROJECT_REPORTS);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String batch = rs.getString("studentbatch");
				String studentID = rs.getString("studentID");
				String studentName = rs.getString("studentName");
				String projectTitle = rs.getString("projectTitle");
				String facultyName = rs.getString("facultyName");
				reports.add(new Reports(batch, studentID, studentName, projectTitle, facultyName));
				System.out.println(batch);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return reports;
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
