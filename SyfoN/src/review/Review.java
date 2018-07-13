package review;

public class Review {
	private String reviewID;
	private String studentID;
	private int lectureID;
	private String comment;
	private float totalPoint;
	private float mathPoint;
	private float programPoint;
	private float professorPoint;
	private float attendPoint;
	private float homeworkPoint;
	private float groupworkPoint;

	public String getReviewID() {
		return reviewID;
	}
	public void setReviewID(String reviewID) {
		this.reviewID = reviewID;
	}
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	public int getLectureID() {
		return lectureID;
	}
	public void setLectureID(int lectureID) {
		this.lectureID = lectureID;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public float getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(float totalPoint) {
		this.totalPoint = totalPoint;
	}
	public float getMathPoint() {
		return mathPoint;
	}
	public void setMathPoint(float mathPoint) {
		this.mathPoint = mathPoint;
	}
	public float getProgramPoint() {
		return programPoint;
	}
	public void setProgramPoint(float programPoint) {
		this.programPoint = programPoint;
	}
	public float getProfessorPoint() {
		return professorPoint;
	}
	public void setProfessorPoint(float professorPoint) {
		this.professorPoint = professorPoint;
	}
	public float getAttendPoint() {
		return attendPoint;
	}
	public void setAttendPoint(float attendPoint) {
		this.attendPoint = attendPoint;
	}
	public float getHomeworkPoint() {
		return homeworkPoint;
	}
	public void setHomeworkPoint(float homeworkPoint) {
		this.homeworkPoint = homeworkPoint;
	}
	public float getGroupworkPoint() {
		return groupworkPoint;
	}
	public void setGroupworkPoint(float groupworkPoint) {
		this.groupworkPoint = groupworkPoint;
	}

}
