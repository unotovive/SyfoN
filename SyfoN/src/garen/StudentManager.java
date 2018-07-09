package garen;

import java.sql.SQLException;

public class StudentManager {

	private Student student;
	private StudentDAO studentDAO;

	public StudentManager(){
		studentDAO=new StudentDAO();
		student=new Student();
	}

	public Student getStudent(String studentID) throws SQLException{
		student = studentDAO.getStudent(studentID);
		return student;
	}

	public boolean check(Student student) throws SQLException{
		boolean result = false;
		result = studentDAO.check(student);
		return result;

	}

	public boolean registerStudent(Student student) throws SQLException{
		boolean result = false;
			result = studentDAO.registerStudent(student);
		return result;

	}

	public boolean editProf(Student student) throws SQLException{
		boolean result = false;
			result = studentDAO.updateStudent(student);
		return result;

	}





}
