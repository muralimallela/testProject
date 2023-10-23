package projectManagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projectManagement.model.Reports;

public class ReportsDAO {
	public ReportsDAO() {
	}

	SqlConnection sqlconnection = new SqlConnection();

	private static final String ALL_REPORTS = "SELECT * FROM participants_report ORDER BY StudentBatch";

	public List<Reports> selectAllRports() {

		List<Reports> reports = new ArrayList<>();

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(ALL_REPORTS);) {
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
