package projectManagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projectManagement.model.Student;

public class studentDAO {

	private static final String INSERT_STUDENT_SQL = "INSERT INTO students"
			+ "(StudentID,Password,FirstName, LastName, Email,Department, Year,batch,role, ContactNumber) VALUES " + " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	private static final String SELECT_STUDENT_BY_ID = "SELECT * FROM students WHERE StudentID = ?";
	private static final String SELECT_ALL_STUDENTS = "SELECT * FROM students ORDER BY Year DESC";
	private static final String SELECT_ALL_STUDENTS_BY_BRANCH_YEAR = "SELECT * FROM students WHERE year = ? AND Department = ? ORDER BY Year DESC";
	private static final String DELETE_STUDENT_SQL = "delete from students where StudentID = ? ";
	private static final String UPDATE_STUDENT_SQL = "UPDATE students SET Password = ?, FirstName= ?, LastName =?, Email = ?, Department = ?, Year = ?, batch = ?, role = ?, ContactNumber = ? WHERE  StudentID = ?;";
	private static final String	STUDENT_LOGIN = "SELECT * FROM students WHERE studentID = ? AND password = ?; ";
	
	SqlConnection sqlconnection = new SqlConnection();

	public void insertStudent(Student student) throws SQLException {
		System.out.println(INSERT_STUDENT_SQL);

		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STUDENT_SQL)) {
			preparedStatement.setString(1, student.getStudentID());
			preparedStatement.setString(2, student.getPassword());
			preparedStatement.setString(3, student.getFirstName());
			preparedStatement.setString(4, student.getLastName());
			preparedStatement.setString(5, student.getEmail());
			preparedStatement.setString(6, student.getDepartment());
			preparedStatement.setInt(7, student.getYear());
			preparedStatement.setString(8, student.getBatch());
			preparedStatement.setString(9, student.getRole());
			preparedStatement.setString(10, student.getContactNumber());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Student selectStudent(String studentID) {
		Student student = null;

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENT_BY_ID);) {
			preparedStatement.setString(1, studentID);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String Password = rs.getString("Password");
				String FirstName = rs.getString("FirstName");
				String LastName = rs.getString("LastName");
				String Email = rs.getString("Email");
				String Department = rs.getString("Department");
				int Year = rs.getInt("Year");
				String batch = rs.getString("batch");
				String role = rs.getString("role");
				String ContactNumber = rs.getString("ContactNumber");
				student = new Student(studentID,Password, FirstName, LastName, Email, Department,Year,batch, role, ContactNumber);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return student;
	}

	public List<Student> selectAllStudents(String year,String branch) {
		String query;
		List<Student> students = new ArrayList<>();
		if(year != null && branch != null)
			query = SELECT_ALL_STUDENTS_BY_BRANCH_YEAR;
		else
			query = SELECT_ALL_STUDENTS;
		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(query);) {
			if(year != null && branch != null) {
				preparedStatement.setString(1, year);
				preparedStatement.setString(2, branch);
			}
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String StudentID = rs.getString("StudentID");
				String Password = rs.getString("Password");
				String FirstName = rs.getString("FirstName");
				String LastName = rs.getString("LastName");
				String Email = rs.getString("Email");
				String Department = rs.getString("Department");
				int Year = rs.getInt("Year");
				String batch = rs.getString("batch");
				String role = rs.getString("role");
				String ContactNumber = rs.getString("ContactNumber");
				students.add(new Student(StudentID, Password, FirstName, LastName, Email, Department,Year,batch,role, ContactNumber));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return students;
	}

	public boolean deleteStudent(String studentID) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_STUDENT_SQL);) {
			statement.setString(1, studentID);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateStudent(Student student) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement statement = connection.prepareStatement(UPDATE_STUDENT_SQL);) {
			
			
			statement.setString(1, student.getPassword());
			statement.setString(2, student.getFirstName());
			statement.setString(3, student.getLastName());
			statement.setString(4, student.getEmail());
			statement.setString(5, student.getDepartment());
			statement.setInt(6, student.getYear());
			statement.setString(7, student.getBatch());
			statement.setString(8, student.getRole());
			statement.setString(9, student.getContactNumber());
			statement.setString(10, student.getStudentID());
			System.out.println("updated Student: " + statement);
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	
	public boolean validate(String studentID, String password) {
		boolean status = false;
		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(STUDENT_LOGIN);) {
			preparedStatement.setString(1, studentID);
			preparedStatement.setString(2, password);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
		} catch (SQLException e) {
			printSQLException(e);
		}
		return status;
	}

	
	private String  printSQLException(SQLException ex) {
		String err = null;
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
			err = ((SQLException) e).getSQLState();
		}
		return err;
	}
}
