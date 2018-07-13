package professorToLecture;

import java.sql.SQLException;

public class ProfessorToLectureManager {

	public ProfessorToLecture getPTL(int lectureID) throws SQLException{
		ProfessorToLecture ptl=new ProfessorToLecture();
		//DAOを用いてPTLをよびだす
		ptl=new ProfessorToLectureDAO().getProfessorToLecture(lectureID);
		return ptl;
	}
}
