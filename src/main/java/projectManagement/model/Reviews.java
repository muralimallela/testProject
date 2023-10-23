package projectManagement.model;

public class Reviews {
	private int reviewID;
	public int getReviewID() {
		return reviewID;
	}

	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}
	private String reviewedDate;
	private String reviewedFaculty;
	public String getReviewedDate() {
		return reviewedDate;
	}

	public void setReviewedDate(String reviewedDate) {
		this.reviewedDate = reviewedDate;
	}

	public String getReviewedFaculty() {
		return reviewedFaculty;
	}

	public void setReviewedFaculty(String reviewedFaculty) {
		this.reviewedFaculty = reviewedFaculty;
	}
	private String studentID;
	private int reviewPoints;
	private String remarks;
	
	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public int getReviewPoints() {
		return reviewPoints;
	}

	public void setReviewPoints(int reviewPoints) {
		this.reviewPoints = reviewPoints;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Reviews() {
		
	}
	public Reviews(int reviewID,String studentID, int reviewPoints, String remarks,String reviewedDate,String reviewedFaculty) {
		super();
		this.reviewID= reviewID;
		this.studentID = studentID;
		this.reviewPoints = reviewPoints;
		this.remarks = remarks;
		this.reviewedDate = reviewedDate;
		this.reviewedFaculty = reviewedFaculty;
	}
	public Reviews(String studentID, int reviewPoints, String remarks,String reviewedDate,String reviewedFaculty) {
		super();
		this.studentID = studentID;
		this.reviewPoints = reviewPoints;
		this.remarks = remarks;
		this.reviewedDate = reviewedDate;
		this.reviewedFaculty = reviewedFaculty;
	}

}
