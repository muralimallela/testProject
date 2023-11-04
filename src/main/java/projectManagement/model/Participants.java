package projectManagement.model;

public class Participants {

	private int participantID;
	private String projectID;
	private String batch;

	public Participants() {

	}

	public Participants( String projectID, String batch) {
		super();
		this.projectID = projectID;
		this.batch = batch;
	}

	public Participants(int participantID, String projectID, String batch) {
		super();
		this.participantID = participantID;
		this.projectID = projectID;
		this.batch = batch;
	}

	public int getParticipantID() {
		return participantID;
	}

	public void setParticipantID(int participantID) {
		this.participantID = participantID;
	}

	public String getProjectID() {
		return projectID;
	}

	public void setProjectID(String projectID) {
		this.projectID = projectID;
	}

	public String getBatch() {
		return batch;
	}

	public void setBatch(String batch) {
		this.batch = batch;
	}



}
