package projectManagement.model;

import java.util.ArrayList;
import java.util.List;

public class StudentProjectManagementSystem {

	private List<Student> students;
	private List<Project> projects;
	private List<Faculty> faculties;

	public StudentProjectManagementSystem() {
		students = new ArrayList<>();
		projects = new ArrayList<>();
		faculties = new ArrayList<>();
	}

	public void addStudent(Student student) {
		students.add(student);
	}

	public void addProject(Project project) {
		projects.add(project);
	}

	public void addFaculty(Faculty faculty) {
		faculties.add(faculty);
	}

}
