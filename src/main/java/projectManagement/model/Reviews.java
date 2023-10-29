package projectManagement.model;

public class Reviews {
	private int reviewID;
	private String studentID;
	private String projectID;
	private int guide;
	private int srFaculty;
	private int hod;
	private int avg;
	private int marks;
	
	public Reviews() {}
	
	public Reviews(int reviewID, String studentID, String projectID, int guide, int srFaculty, int hod, int avg,
			int marks) {
		super();
		this.reviewID = reviewID;
		this.studentID = studentID;
		this.projectID = projectID;
		this.guide = guide;
		this.srFaculty = srFaculty;
		this.hod = hod;
		this.avg = avg;
		this.marks = marks;
	}
	
	public Reviews(int reviewID, String studentID, String projectID, int guide, int srFaculty, int hod) {
		super();
		this.reviewID = reviewID;
		this.studentID = studentID;
		this.projectID = projectID;
		this.guide = guide;
		this.srFaculty = srFaculty;
		this.hod = hod;
	}

	public int getReviewID() {
		return reviewID;
	}

	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getProjectID() {
		return projectID;
	}

	public void setProjectID(String projectID) {
		this.projectID = projectID;
	}

	public int getGuide() {
		return guide;
	}

	public void setGuide(int guide) {
		this.guide = guide;
	}

	public int getSrFaculty() {
		return srFaculty;
	}

	public void setSrFaculty(int srFaculty) {
		this.srFaculty = srFaculty;
	}

	public int getHod() {
		return hod;
	}

	public void setHod(int hod) {
		this.hod = hod;
	}

	public int getAvg() {
		return avg;
	}

	public void setAvg(int avg) {
		this.avg = avg;
	}

	public int getMarks() {
		return marks;
	}

	public void setMarks(int marks) {
		this.marks = marks;
	}

}
