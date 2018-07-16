package Lecture;

import java.sql.SQLException;
import java.util.ArrayList;


public class LectureManager {

	private Lecture lecture;
	private ArrayList<Lecture> lectureList;
	private LectureDAO lectureDAO;

	public LectureManager(){
		lectureList = new ArrayList<Lecture>();
		lectureDAO = new LectureDAO();
	}

	//講義情報を参照
	public Lecture getLecture(int lectureID) throws SQLException{
		lecture = lectureDAO.getLecture(lectureID);
		return lecture;
	}

	//講義情報を全て
	public ArrayList<Lecture> getAllLecture() throws SQLException{
		lectureList = lectureDAO.getLectureList();
		return lectureList;
	}

	//講義情報を全て
	public ArrayList<Lecture> findLecture(Lecture lecture) throws SQLException{
		lectureList=new ArrayList<Lecture>();
		if(!lecture.getLectureName().isEmpty()){
			ArrayList<Lecture> lecList = lectureDAO.findLectureByLectureName(lecture.getLectureName());
			lectureList.addAll(lecList);
			System.out.print("名前検索");
		}
		if(!lecture.getDay().isEmpty()){
			ArrayList<Lecture> lecList = lectureDAO.findLectureByDay(lecture.getDay());
			lectureList.addAll(lecList);
			System.out.print("曜日検索");
		}
		if(!lecture.getGaitoGakki().isEmpty()){
			ArrayList<Lecture> lecList = lectureDAO.findLectureByGaitoGakki(lecture.getGaitoGakki());
			lectureList.addAll(lecList);

			System.out.print("学期、検索");

		}
		return lectureList;
	}


	public boolean registetLecture(Lecture lecture) throws SQLException{
		boolean result = false;
		result = lectureDAO.registerLecture(lecture);
		return result;
	}

	public boolean editLecture(Lecture lecture) throws SQLException{
		boolean result = false;
		result = lectureDAO.updateLecture(lecture);
		return result;
	}

	public boolean removeLecture(Lecture lecture) throws SQLException{
		boolean result = false;
		result = lectureDAO.removeLecture(lecture);
		return result;
	}

}
