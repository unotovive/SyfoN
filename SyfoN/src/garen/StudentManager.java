package garen;

import java.sql.SQLException;

public class StudentManager {

	private Student student;
	private StudentDAO studentDAO;

	public Student getStudent(Student studentID) throws SQLException{
		student = studentDAO.getStudent(studentID);
		return student;
	}





}
