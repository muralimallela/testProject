package projectManagement.model;

public class Student {
	private String studentID;
	private String password;
	private String firstName;
	private String lastName;
	private String email;
	private String department;
	private int year;
	private String batch;
	private String role;

	public String getBatch() {
		return batch;
	}

	public void setBatch(String batch) {
		this.batch = batch;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	private String contactNumber;

	public Student() {

	}

//	public Student(String studentID, String password, String firstName, String lastName, String email,
//			String department, int year, String contactNumber) {
//		super();
//		this.year = year;
//		this.studentID = studentID;
//		this.password = password;
//		this.firstName = firstName;
//		this.lastName = lastName;
//		this.email = email;
//		this.department = department;
//		this.contactNumber = contactNumber;
//	}

//	public Student( String firstName, String lastName, String email, String department, int year,
//			String contactNumber) {
//		super();
//		this.year = year;
//		this.firstName = firstName;
//		this.lastName = lastName;
//		this.email = email;
//		this.department = department;
//		this.contactNumber = contactNumber;
//	}
	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Student(String studentID, String password, String firstName, String lastName, String email,
			String department, int year, String batch, String role, String contactNumber) {
		super();
		this.studentID = studentID;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.department = department;
		this.year = year;
		this.batch = batch;
		this.role = role;
		this.contactNumber = contactNumber;
	}

}
