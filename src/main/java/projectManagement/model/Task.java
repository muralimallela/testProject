package projectManagement.model;

public class Task {

	private int taskID;
	private String description;
	private String deadline;
	private String status;
	private Student assignedStudent;

	public Task() {

	}

	public Task(int taskID, String description, String deadline, String status, Student assignedStudent) {
		this.taskID = taskID;
		this.description = description;
		this.deadline = deadline;
		this.status = status;
		this.assignedStudent = assignedStudent;
	}

	public int getTaskID() {
		return taskID;
	}

	public void setTaskID(int taskID) {
		this.taskID = taskID;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Student getAssignedStudent() {
		return assignedStudent;
	}

	public void setAssignedStudent(Student assignedStudent) {
		this.assignedStudent = assignedStudent;
	}

}
