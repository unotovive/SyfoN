package timetable;

import java.sql.SQLException;
import java.util.ArrayList;

import courseLecture.CourseLecture;
import courseLecture.CourseLectureManager;

public class TimeTableManager {
	private ArrayList<TimeTable> timeTableList;
	private TimeTableDAO timeTableDAO;
	private CourseLectureManager courseLectureManager;

	public TimeTableManager(){
		timeTableList = new ArrayList<TimeTable>();
		timeTableDAO = new TimeTableDAO();

	}


//新規に時間割を作成
	public boolean createTimeTable(String studentID) throws SQLException{
		boolean result = false;
		result = timeTableDAO.registerTimeTable(studentID);
		return result;
	}

	//新規登録した学生の新規の時間割を作成
	public boolean registerNewTimeTable(String studentID){
		boolean result=false;
		result=registerNewTimeTable(studentID);
		return result;
	}

	//時間割を参照
	public ArrayList<TimeTable> getTimeTableList(String studentID) throws SQLException{
		//ArrayList<TimeTable> result = new Array ;
		timeTableList = timeTableDAO.getTimeTableList(studentID);
		return timeTableList;
	}

	//時間割の講義を削除
	public boolean removeLecture(CourseLecture courseLecture) throws SQLException{
		boolean result = false;
		result = courseLectureManager.deleteCourseLecture(courseLecture);
		return result;

	}

	//時間割に講義を追加
	public boolean addCourseLecture(CourseLecture courseLecture) throws SQLException{
		boolean result = false;
		result = courseLectureManager.registerCourseLecture(courseLecture);
		return result;
	}


}
