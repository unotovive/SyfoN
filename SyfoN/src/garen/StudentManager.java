package garen;

import java.sql.SQLException;

public class StudentManager {

	private Student student;
	private StudentDAO studentDAO;

	public Student getStudent(String studentID) throws SQLException{
		student = studentDAO.getStudent(studentID);
		return student;
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
