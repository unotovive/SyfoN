package timetable;

import java.io.Serializable;

public class TimeTable implements Serializable{
	private String timeTableID;
	private String timeSemester;
	private String studentID;


	public String getTimeTableID() {
		return timeTableID;
	}
	public void setTimeTableID(String timeTableID) {
		this.timeTableID = timeTableID;
	}
	public String getTimeSemester() {
		return timeSemester;
	}
	public void setTimeSemester(String timeSemester) {
		this.timeSemester = timeSemester;
	}
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}


}
