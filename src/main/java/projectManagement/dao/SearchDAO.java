package projectManagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SearchDAO {

	public SearchDAO() {

	}

	private static final String SEARCH_STUDENT = "SELECT"
			+ " s.studentid,s.firstname, s.lastname,pr.projecttitle,f.firstName,f.lastName,pt.role "
			+ "FROM participants pt" + " JOIN students s ON s.studentid = pt.studentid "
			+ "JOIN projects pr ON pr.projectid = pt.projectid "
			+ "JOIN faculty f ON f.facultyid = pr.facultyadvisorid " + "WHERE s.studentid = ?;";
	private static final String SEARCH_FACULTY = "SELECT"
			+ " s.studentid,s.firstname, s.lastname,pr.projecttitle,f.firstName,f.lastName,pt.role "
			+ "FROM participants pt" + " JOIN students s ON s.studentid = pt.studentid "
			+ "JOIN projects pr ON pr.projectid = pt.projectid "
			+ "JOIN faculty f ON f.facultyid = pr.facultyadvisorid " + "WHERE f.FirstName=? ;";
	private static final String SEARCH_ROLE = "SELECT"
			+ " s.studentid,s.firstname, s.lastname,pr.projecttitle,f.firstName,f.lastName,pt.role "
			+ "FROM participants pt" + " JOIN students s ON s.studentid = pt.studentid "
			+ "JOIN projects pr ON pr.projectid = pt.projectid "
			+ "JOIN faculty f ON f.facultyid = pr.facultyadvisorid " + "WHERE pt.role=? ;";
	SqlConnection sqlconnection = new SqlConnection();

	public List<String> selectStudent(String studentID) {
		List<String> stringList = new ArrayList<>();


		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_STUDENT);) {
			preparedStatement.setString(1, studentID);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				for (int i = 1; i <= 7; i++)
					stringList.add(rs.getString(i));
//				stringList.add(rs.getString(2));
//				stringList.add(rs.getString(3));
//				stringList.add(rs.getString(4));
//				stringList.add(rs.getString(5));
//				stringList.add(rs.getString(6));
//				stringList.add(rs.getString(7));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}

		return stringList;
	}

	public List<List<String>> selectFaculty(String searchFaculty) {
		List<String> List = new ArrayList<>();


		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_FACULTY);) {
			preparedStatement.setString(1, searchFaculty);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				for (int i = 1; i <= 7; i++)
					List.add(rs.getString(i));
//				stringList.add(rs.getString(1));
//				stringList.add(rs.getString(2));
//				stringList.add(rs.getString(3));
//				stringList.add(rs.getString(4));
//				stringList.add(rs.getString(5));
//				stringList.add(rs.getString(6));
//				stringList.add(rs.getString(7));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		List<List<String>> subLists = splitListIntoSubLists(List, 7);

		return subLists;
	}

	public static List<List<String>> splitListIntoSubLists(List<String> originalList, int subListSize) {
		List<List<String>> subLists = new ArrayList<>();

		for (int i = 0; i < originalList.size(); i += subListSize) {
			int endIndex = Math.min(i + subListSize, originalList.size());
			subLists.add(originalList.subList(i, endIndex));
		}

		return subLists;
	}

	public List<List<String>> selectRole(String searchRole) {

		List<String> List = new ArrayList<>();

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_ROLE);) {
			preparedStatement.setString(1, searchRole);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				for (int i = 1; i <= 7; i++)
					List.add(rs.getString(i));
//			stringList.add(rs.getString(1));
//			stringList.add(rs.getString(2));
//			stringList.add(rs.getString(3));
//			stringList.add(rs.getString(4));
//			stringList.add(rs.getString(5));
//			stringList.add(rs.getString(6));
//			stringList.add(rs.getString(7));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		List<List<String>> subRoleLists = splitListIntoSubLists(List, 7);
		return subRoleLists;
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
