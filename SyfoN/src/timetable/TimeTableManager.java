package timetable;

import java.sql.SQLException;
import java.util.ArrayList;

public class TimeTableManager {
	private ArrayList<TimeTable> timeTableList;
	private TimeTableDAO timeTableDAO;

	public TimeTableManager(){
		timeTableList = new ArrayList<TimeTable>();
		timeTableDAO = new TimeTableDAO();

	}

	public boolean createTimeTable(TimeTable timeTable) throws SQLException{
		boolean result = false;
		result = timeTableDAO.registerTimeTable(timeTable);
		return result;
	}

	public ArrayList<TimeTable> getTimeTableList(String studentID) throws SQLException{
		//ArrayList<TimeTable> result = new Array ;
		timeTableList = timeTableDAO.getTimeTableList(studentID);
		return timeTableList;
	}

}
