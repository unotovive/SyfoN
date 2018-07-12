package student;

import java.io.Serializable;

public class Student implements Serializable {
	public Student(){
		studentID ="";
		gradeID = 1;
		passWord ="";
		mailAddress ="";
		nickName ="";
	}

	private String studentID;
	private int gradeID;
	private String passWord;
	private String mailAddress;
	private String nickName;

	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public int getGradeID() {
		return gradeID;
	}

	public void setGradeID(int gradeID) {
		this.gradeID = gradeID;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getMailAddress() {
		return mailAddress;
	}

	public void setMailAddress(String mailAddress) {
		this.mailAddress = mailAddress;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickname) {
		this.nickName = nickname;
	}




}
