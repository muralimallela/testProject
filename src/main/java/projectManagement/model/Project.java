package projectManagement.model;

public class Project {

	private String projectID;
	private String projectTitle;
	private String projectType;
	private String facultyAdvisorID;
	private String branch;
	private String academicYear;

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getAcademicYear() {
		return academicYear;
	}

	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}

	public Project() {

	}

	public String getProjectID() {
		return projectID;
	}

	public void setProjectID(String projectID) {
		this.projectID = projectID;
	}

	public String getProjectTitle() {
		return projectTitle;
	}

	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}

	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	public String getFacultyAdvisorID() {
		return facultyAdvisorID;
	}

	public void setFacultyAdvisorID(String facultyAdvisorID) {
		this.facultyAdvisorID = facultyAdvisorID;
	}

	public Project(String projectID, String projectTitle, String projectType, String facultyAdvisorID, String branch,
			String academicYear) {
		super();
		this.projectID = projectID;
		this.projectTitle = projectTitle;
		this.projectType = projectType;
		this.facultyAdvisorID = facultyAdvisorID;
		this.branch = branch;
		this.academicYear = academicYear;
	}

}
