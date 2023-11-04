package projectManagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projectManagement.model.Participants;

public class ParticipantsDAO {

	public ParticipantsDAO() {

	}

	private static final String INSERT_PARTICIPANT_SQL = "INSERT INTO participants"
			+ "(participantID,projectID, batch) VALUES " + " (?, ?, ?);";
	private static final String SELECT_PARTICIPANT_BY_ID = "select * from participants where participantID = ?";
	private static final String SELECT_ALL_PARTICIPANTS = "select * from participants";
	private static final String DELETE_PARTICIPANT_SQL = "delete from participants where participantID = ?;";
	private static final String UPDATE_PARTICIPANT_SQL = "update participants set projectID= ?, batch =? where  participantID = ?;";

	SqlConnection sqlconnection = new SqlConnection();

	public void insertParticipant(Participants participants) throws SQLException {
		System.out.println(INSERT_PARTICIPANT_SQL);

		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PARTICIPANT_SQL)) {
			preparedStatement.setInt(1, participants.getParticipantID());
			preparedStatement.setString(2, participants.getProjectID());
			preparedStatement.setString(3, participants.getBatch());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Participants selectParticipant(int participantID) {
		Participants participant = null;

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PARTICIPANT_BY_ID);) {
			preparedStatement.setInt(1, participantID);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String projectID = rs.getString("projectID");
				String studentBatch = rs.getString("batch");
				participant = new Participants(participantID, projectID, studentBatch);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return participant;
	}

	public List<Participants> selectAllParticipants() {

		List<Participants> participants = new ArrayList<>();

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PARTICIPANTS);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int participantID = rs.getInt("participantID");
				String projectID = rs.getString("projectID");
				String studentBatch = rs.getString("batch");
				participants.add(new Participants(participantID, projectID, studentBatch));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return participants;
	}

	public boolean deleteParticipant(int participantID) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_PARTICIPANT_SQL);) {
			statement.setInt(1, participantID);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateParticipant(Participants participant) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement statement = connection.prepareStatement(UPDATE_PARTICIPANT_SQL);) {


			statement.setString(1, participant.getProjectID());
			statement.setString(2, participant.getBatch());
			statement.setInt(3, participant.getParticipantID());
			System.out.println("updated Project: " + statement);
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
