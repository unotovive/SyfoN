package student;

import java.sql.SQLException;

public class StudentManager {

	private Student student;
	private StudentDAO studentDAO;

	public StudentManager(){
		studentDAO=new StudentDAO();
		student=new Student();
	}

	//学生情報を参照
	public Student getStudent(String studentID) throws SQLException{
		student = studentDAO.getStudent(studentID);
		return student;
	}

	//学生のログイン判定
	public boolean check(Student student) throws SQLException{
		boolean result = false;
		result = studentDAO.check(student);
		return result;
	}

	//ユーザ登録
	public boolean registerStudent(Student student) throws SQLException{
		boolean result = false;
			result = studentDAO.registerStudent(student);
		return result;
	}

	//学生情報を変更
	public boolean editProf(Student student) throws SQLException{
		boolean result = false;
			result = studentDAO.updateStudent(student);
		return result;
	}





}