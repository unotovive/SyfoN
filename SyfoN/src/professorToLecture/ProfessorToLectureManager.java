package professorToLecture;

import java.sql.SQLException;

public class ProfessorToLectureManager {
	ProfessorToLecture ptl;
	ProfessorToLectureDAO ptlDAO;

	public ProfessorToLectureManager(){
		ptl=new ProfessorToLecture();
		ptlDAO=new ProfessorToLectureDAO();
	}

	public ProfessorToLecture getPTL(int lectureID) throws SQLException{
		ProfessorToLecture ptl=new ProfessorToLecture();
		//DAOを用いてPTLをよびだす
		ptl=new ProfessorToLectureDAO().getProfessorToLecture(lectureID);
		return ptl;
	}

	public boolean registerPTL(ProfessorToLecture ptl){
		boolean result;
		result=ptlDAO.registerPTL(ptl);
		return result;
	}
	public boolean updatePTL(ProfessorToLecture ptl){
		boolean result;
		result=ptlDAO.updatePTL(ptl);
		return result;
	}
}
