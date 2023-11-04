package projectManagement.model;

public class Reports {

	private String batch;
	private String studentID;
	private String studentName;
	private String projectTitle;
	private String facultyName;
	public String getBatch() {
		return batch;
	}
	public void setBatch(String batch) {
		this.batch = batch;
	}
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getProjectTitle() {
		return projectTitle;
	}
	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}
	public String getFacultyName() {
		return facultyName;
	}
	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}
	public Reports(String batch, String studentID, String studentName, String projectTitle, String facultyName) {
		super();
		this.batch = batch;
		this.studentID = studentID;
		this.studentName = studentName;
		this.projectTitle = projectTitle;
		this.facultyName = facultyName;
	}
	public Reports() {

	}

}
