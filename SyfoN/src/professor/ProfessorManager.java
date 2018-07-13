package professor;

import java.sql.SQLException;
import java.util.ArrayList;

public class ProfessorManager {
	private ArrayList<Professor> professorList;
	private Professor professor;
	private ProfessorDAO proDAO;

	public ProfessorManager(){
		professorList = new ArrayList<Professor>();
		professor = new Professor();
		proDAO = new ProfessorDAO();
	}

	public Professor getProfessor(String professorID) throws SQLException{
		professor = proDAO.getProfessor(professorID);
		return professor;
	}

	//検索用
	public ArrayList<Professor> findProfessor(String professorName) throws SQLException{
		professorList = proDAO.findProfessor(professorName);
		return professorList;
	}

	public ArrayList<Professor> getAllProfessors() throws SQLException{
		professorList = proDAO.getAllProfessors();
		return professorList;
	}

}
