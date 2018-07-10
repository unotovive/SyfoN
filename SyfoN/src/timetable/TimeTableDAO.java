package timetable;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TimeTableDAO {

	final private static String dbname = "tutorial";   // データベース名
	final private static String user = "wspuser";      // tutorialにアクセスできるユーザ
	final private static String password = "hogehoge"; // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;

	public ArrayList<TimeTable> getTimeTableList(String studentID) throws SQLException {
		// memberがDBにあるかどうかを調べる
		ArrayList<TimeTable> result = new ArrayList<TimeTable>();
		Connection connection;
		String sql = "select * from timetable where studentID=?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, studentID);

			ResultSet resultSet = pstmt.executeQuery(sql);
			while(resultSet.next()){
				//st = null;
				TimeTable tt = new TimeTable();

				String ttID = resultSet.getString("timetableid");
				tt.setTimeTableID(ttID);
				String ts = resultSet.getString("timesemester");
				tt.setTimeSemester(ts);
				String stID = resultSet.getString("studentid");
				tt.setStudentID(stID);

				result.add(tt);
			}

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean registerTimeTable(TimeTable timeTable) throws SQLException {
		// memberがDBにあるかどうかを調べる
		boolean result = false;
		Connection connection;
		String sql = "INSERT INTO timeTable VALUES (?, ?, ?)";

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