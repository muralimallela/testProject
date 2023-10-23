package projectManagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projectManagement.model.Faculty;

public class FacultyDAO {

	public FacultyDAO() {

	}

	private static final String INSERT_FACULTY_SQL = "INSERT INTO faculty"
			+ "(FacultyID,FirstName, LastName, Email,Department, ContactNumber) VALUES " + " (?, ?, ?, ?, ?, ?);";
	private static final String SELECT_FACULTY_BY_ID = "select * from faculty where facultyID = ?";
	private static final String SELECT_ALL_FACULTY = "select * from faculty";
	private static final String DELETE_FACULTY_SQL = "delete from faculty where facultyID = ?;";
	private static final String UPDATE_FACULTY_SQL = "update faculty set FirstName= ?, LastName =?, Email = ?, Department = ?, ContactNumber = ? where  FacultyID = ?;";

	SqlConnection sqlconnection = new SqlConnection();

	public void insertFaculty(Faculty faculty) throws SQLException {
		System.out.println(INSERT_FACULTY_SQL);

		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FACULTY_SQL)) {
			preparedStatement.setString(1, faculty.getFacultyID());
			preparedStatement.setString(2, faculty.getFirstName());
			preparedStatement.setString(3, faculty.getLastName());
			preparedStatement.setString(4, faculty.getEmail());
			preparedStatement.setString(5, faculty.getDepartment());
			preparedStatement.setString(6, faculty.getContactNumber());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Faculty selectFaculty(String facultyID) {
		Faculty faculty = null;

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FACULTY_BY_ID);) {
			preparedStatement.setString(1, facultyID);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String FirstName = rs.getString("FirstName");
				String LastName = rs.getString("LastName");
				String Email = rs.getString("Email");
				String Department = rs.getString("Department");
				String ContactNumber = rs.getString("ContactNumber");
				faculty = new Faculty(facultyID, FirstName, LastName, Email, Department, ContactNumber);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return faculty;
	}

	public List<Faculty> selectAllFaculty() {

		List<Faculty> faculty = new ArrayList<>();

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACULTY);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String facultyID = rs.getString("facultyID");
				String FirstName = rs.getString("FirstName");
				String LastName = rs.getString("LastName");
				String Email = rs.getString("Email");
				String Department = rs.getString("Department");
				String ContactNumber = rs.getString("ContactNumber");
				faculty.add(new Faculty(facultyID, FirstName, LastName, Email, Department, ContactNumber));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return faculty;
	}

	public boolean deleteFaculty(String facultyID) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_FACULTY_SQL);) {
			statement.setString(1, facultyID);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateFaculty(Faculty faculty) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement statement = connection.prepareStatement(UPDATE_FACULTY_SQL);) {
			System.out.println("updated Faculty: " + statement);

			statement.setString(1, faculty.getFirstName());
			statement.setString(2, faculty.getLastName());
			statement.setString(3, faculty.getEmail());
			statement.setString(4, faculty.getDepartment());
			statement.setString(5, faculty.getContactNumber());
			statement.setString(6, faculty.getFacultyID());

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
