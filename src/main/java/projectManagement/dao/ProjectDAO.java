package projectManagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projectManagement.model.Project;

public class ProjectDAO {

	public ProjectDAO() {

	}

	private static final String INSERT_PROJECT_SQL = "INSERT INTO projects"
			+ "(projectID,ProjectTitle, ProjectType, FacultyAdvisorID, Branch, batch,  AcademicYear) VALUES "
			+ " (?, ?, ?, ?, ?, ?, ?);";
	private static final String SELECT_PROJECT_BY_ID = "select * from projects where projectID = ?";
	private static final String PROJECT_FILTER = "select * from projects where AcademicYear = ? AND Branch = ? AND ProjectType = ?";
	private static final String SELECT_ALL_POJECTS = "select * from projects";
	private static final String DELETE_PROJECT_SQL = "delete from projects where projectID = ?;";
	private static final String UPDATE_PROJECT_SQL = "update projects set ProjectTitle= ?, ProjectType =?, FacultyAdvisorID = ?, Branch = ?, batch = ? AcademicYear = ? where  projectID = ?;";

	SqlConnection sqlconnection = new SqlConnection();

	public void insertProject(Project project) throws SQLException {
		System.out.println(INSERT_PROJECT_SQL);

		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PROJECT_SQL)) {
			preparedStatement.setString(1, project.getProjectID());
			preparedStatement.setString(2, project.getProjectTitle());
			preparedStatement.setString(3, project.getProjectType());
			preparedStatement.setString(4, project.getFacultyAdvisorID());
			preparedStatement.setString(5, project.getBranch());
			preparedStatement.setString(6, project.getBatch());
			preparedStatement.setString(7, project.getAcademicYear());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Project selectProject(String projectID) {
		Project project = null;

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROJECT_BY_ID);) {
			preparedStatement.setString(1, projectID);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String projectTitle = rs.getString("projectTitle");
				String projectType = rs.getString("projectType");
				String facultyAdvisorID = rs.getString("facultyAdvisorID");
				String branch = rs.getString("branch");
				String batch = rs.getString("batch");
				String AcademicYear = rs.getString("AcademicYear");
				project = new Project(projectID, projectTitle, projectType, facultyAdvisorID, branch, batch, AcademicYear);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return project;
	}
	
	public List<Project> filterProjects(String academicYear, String branch, String projectType) {
		List<Project> project = new ArrayList<>();
		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(PROJECT_FILTER);) {
			preparedStatement.setString(1, academicYear);
			preparedStatement.setString(2, branch);
			preparedStatement.setString(3, projectType);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String projectID = rs.getString("projectID");
				String projectTitle = rs.getString("projectTitle");
//				String projectType = rs.getString("projectType");
				String facultyAdvisorID = rs.getString("facultyAdvisorID");
//				String branch = rs.getString("branch");
				String batch = rs.getString("batch");
				String AcademicYear = rs.getString("AcademicYear");
				project.add(new Project(projectID, projectTitle, projectType, facultyAdvisorID, branch,batch, AcademicYear));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return project;
	}


	public List<Project> selectAllProjects() {

		List<Project> project = new ArrayList<>();

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_POJECTS);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String projectID = rs.getString("projectID");
				String projectTitle = rs.getString("projectTitle");
				String projectType = rs.getString("projectType");
				String facultyAdvisorID = rs.getString("facultyAdvisorID");
				String branch = rs.getString("branch");
				String batch = rs.getString("batch");
				String AcademicYear = rs.getString("AcademicYear");
				project.add(new Project(projectID, projectTitle, projectType, facultyAdvisorID, branch, batch, AcademicYear));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return project;
	}

	public boolean deleteProject(String projectID) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_PROJECT_SQL);) {
			statement.setString(1, projectID);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateProject(Project project) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement statement = connection.prepareStatement(UPDATE_PROJECT_SQL);) {
			System.out.println("updated Project: " + statement);

			statement.setString(1, project.getProjectTitle());
			statement.setString(2, project.getProjectType());
			statement.setString(3, project.getFacultyAdvisorID());
			statement.setString(4, project.getBranch());
			statement.setString(4, project.getBatch());
			statement.setString(5, project.getAcademicYear());
			statement.setString(6, project.getProjectID());
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
