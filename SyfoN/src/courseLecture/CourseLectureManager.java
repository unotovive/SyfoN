package courseLecture;

import java.sql.SQLException;
import java.util.ArrayList;



public class CourseLectureManager {
	private ArrayList<CourseLecture> courseLectureList;
	private CourseLectureDAO courseLectureDAO;

	public CourseLectureManager(){
		courseLectureList = new ArrayList<CourseLecture>();
		courseLectureDAO = new CourseLectureDAO();

	}

	public boolean registerCourseLecture(CourseLecture courseLecture) throws SQLException{
		boolean result = false;
		result = courseLectureDAO.registerCourseLecture(courseLecture);
		return result;

	}

	public boolean deleteCourseLecture(CourseLecture courseLecture) throws SQLException{
		boolean result = false;
		result = courseLectureDAO.removeCourseLecture(courseLecture);
		return result;
	}

	public boolean updateCourseLecture(CourseLecture courseLecture) throws SQLException{
		boolean result = false;
		result = courseLectureDAO.updateCourseLecture(courseLecture);
		return result;
	}


	public ArrayList<CourseLecture> getCourseLectureList(String timeTableID) throws SQLException{
		//ArrayList<CourseLecture> result = new Array ;
		courseLectureList = courseLectureDAO.getCourseLectureList(timeTableID);
		return courseLectureList;
	}

	public boolean deleteCourseLecture2(int lectureID){
		boolean result=false;
		result=courseLectureDAO.deleteCourseLecture2(lectureID);
		return result;
	}
}
