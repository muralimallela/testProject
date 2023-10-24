package projectManagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectManagement.dao.ParticipantsDAO;
import projectManagement.dao.ProjectDAO;
import projectManagement.model.Participants;
import projectManagement.model.Project;

@WebServlet({ "/ParticipantServlet", "/insertParticipant", "/updateParticipant", "/listParticipants", "/newParticipant",
		"/editParticipant", "/deleteParticipant" })
public class ParticipantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ParticipantsDAO participantsDAO;
	private ProjectDAO projectDAO;

	public void init() {
		participantsDAO = new ParticipantsDAO();
		projectDAO = new ProjectDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();
		try {
			switch (action) {

			case "/newParticipant":
				showNewParticipantForm(request, response);
				break;
			case "/insertParticipant":
				insertParticipant(request, response);
				break;
			case "/deleteParticipant":
				deleteParticipant(request, response);
				break;
			case "/editParticipant":
				showParticipantEditForm(request, response);
				break;
			case "/updateParticipant":
				updateParticipant(request, response);
				break;
			case "/listParticipants":
				listParticipants(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listParticipants(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Participants> listParticipants = participantsDAO.selectAllParticipants();
		request.setAttribute("listParticipants", listParticipants);
		List<Project> listProject = projectDAO.selectAllProjects();
		request.setAttribute("listProject", listProject);

		RequestDispatcher dispatcher = request.getRequestDispatcher("participants-list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewParticipantForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Project> listProject = projectDAO.selectAllProjects();
		request.setAttribute("listProject", listProject);
		RequestDispatcher dispatcher = request.getRequestDispatcher("participant-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showParticipantEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int participantID = Integer.parseInt(request.getParameter("participantID"));
		Participants existingParticipant = participantsDAO.selectParticipant(participantID);
		List<Project> listProject = projectDAO.selectAllProjects();
		request.setAttribute("listProject", listProject);
		RequestDispatcher dispatcher = request.getRequestDispatcher("participant-form.jsp");
		request.setAttribute("Participants", existingParticipant);
		dispatcher.forward(request, response);

	}

	private void insertParticipant(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		String projectID = request.getParameter("projectID");
		String batch = request.getParameter("batch");

		Participants newParticipant = new Participants(projectID, batch);
		participantsDAO.insertParticipant(newParticipant);
		response.sendRedirect("listParticipants");
	}

	private void updateParticipant(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String projectID = request.getParameter("projectID");
		int participantID = Integer.parseInt(request.getParameter("participantID"));
		String batch = request.getParameter("batch");
		Participants book = new Participants(participantID, projectID, batch);
		participantsDAO.updateParticipant(book);
		response.sendRedirect("listParticipants");
	}

	private void deleteParticipant(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int participantID = Integer.parseInt(request.getParameter("participantID"));
		participantsDAO.deleteParticipant(participantID);
		response.sendRedirect("listParticipants");

	}

}
