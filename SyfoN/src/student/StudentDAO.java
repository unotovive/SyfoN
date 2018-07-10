package student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import garen.Student;

public class StudentDAO {

	final private static String dbname = "tutorial";   // データベース名
	final private static String user = "wspuser";      // tutorialにアクセスできるユーザ
	final private static String password = "hogehoge"; // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;

	public Student getStudent(String studentID) throws SQLException {
		// studentがDBにあるかどうかを調べる
		Student result = new Student();
		Connection connection;
		String sql = "select * from student where studentID=?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, studentID);
			/*
			pstmt.setInt(2, student.getGradeID());
			pstmt.setString(3, student.getPassWord());
			pstmt.setString(4, student.getMailAddress());
			pstmt.setString(5, student.getNickname());
			*/

			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()) result = null;

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean check(Student student) throws SQLException {
		// studentがDBにあるかどうかを調べる
		boolean result = false;
		Connection connection;
		String sql = "SELECT * FROM student WHERE studentid = ? AND password = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, student.getStudentID());
			pstmt.setString(2, student.getPassWord());

			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()) result = true;

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean registerStudent(Student student) throws SQLException {
		// memberがDBにあるかどうかを調べる
		boolean result = false;
		Connection connection;
		String sql = "INSERT INTO student VALUES(?,?,?,?,?);";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, student.getStudentID());
			pstmt.setInt(2, student.getGradeID());
			pstmt.setString(3, student.getPassWord());
			pstmt.setString(4, student.getMailAddress());
			pstmt.setString(5, student.getNickname());

			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()) result = true;

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean updateStudent(Student student) throws SQLException {
		// memberがDBにあるかどうかを調べる
		boolean result = false;
		Connection connection;
		String sql = "UPDATE student SET password = ?,mailaddress = ?  WHERE studentID = ?;";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);


			pstmt.setString(1, student.getPassWord());
			pstmt.setString(2, student.getMailAddress());
			pstmt.setString(3, student.getStudentID());


			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()) result = true;

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
