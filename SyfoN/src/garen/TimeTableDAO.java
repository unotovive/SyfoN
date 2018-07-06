package garen;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TimeTableDAO {

	final private static String dbname = "tutorial";   // データベース名
	final private static String user = "wspuser";      // tutorialにアクセスできるユーザ
	final private static String password = "hogehoge"; // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;

	public TimeTable getTimeTable(TimeTable timeTable) throws SQLException {
		// memberがDBにあるかどうかを調べる
		TimeTable result = new TimeTable();
		Connection connection;
		String sql = "select * from timetable where timeTableID=? and timeSemester=? "
				+ "and studentID=?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, timeTable.getTimeTableID());
			pstmt.setString(2, timeTable.getTimeSemester());
			pstmt.setString(3, timeTable.getStudentID());

			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()) result = null;

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean check(TimeTable timeTable) throws SQLException {
		// memberがDBにあるかどうかを調べる
		boolean result = false;
		Connection connection;
		String sql = "select * from timeTable where timeTableID=? and timeSemester=? and studentID=?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, timeTable.getTimeTableID());
			pstmt.setString(2, timeTable.getTimeSemester());
			pstmt.setString(3, timeTable.getStudentID());

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
