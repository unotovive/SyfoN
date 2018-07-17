package professorToLecture;

import java.sql.SQLException;
import java.util.ArrayList;

public class ProfessorToLectureManager {
	private ProfessorToLecture ptl;
	private ArrayList<ProfessorToLecture> ptlList;
	private ProfessorToLectureDAO ptlDAO;

	public ProfessorToLectureManager(){
		ptlList = new ArrayList<ProfessorToLecture>();
		ptl=new ProfessorToLecture();
		ptlDAO=new ProfessorToLectureDAO();
	}

	public ProfessorToLecture getPTL(int lectureID) throws SQLException{
		//ProfessorToLecture ptl=new ProfessorToLecture();
		//DAOを用いてPTLをよびだす
		ptl=new ProfessorToLectureDAO().getProfessorToLecture(lectureID);
		return ptl;
	}

	public ArrayList<ProfessorToLecture> findPTLList(String professorID){
		//ArrayList<ProfessorToLecture> ptlList=new ArrayList<ProfessorToLecture>();
		ptlList=ptlDAO.findPTLList(professorID);
		return ptlList;
	}

	public boolean registerPTL(ProfessorToLecture ptl){
		boolean result = false;
		result=ptlDAO.registerPTL(ptl);
		return result;
	}
	public boolean updatePTL(ProfessorToLecture ptl){
		boolean result = false;
		result=ptlDAO.updatePTL(ptl);
		return result;
	}
<<<<<<< HEAD
=======

	public boolean removePTLOfLecture(int lectureID) throws SQLException{
		boolean result = false;
		ProfessorToLecture professorToLecture=this.getPTL(lectureID);
		result=ptlDAO.removePTL(professorToLecture);
		return result;
	}
>>>>>>> Admin3
}

