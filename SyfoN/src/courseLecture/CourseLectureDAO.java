package courseLecture;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CourseLectureDAO {

	final private static String dbname = "garen";   // データベース名
	final private static String user = "knight";      // tutorialにアクセスできるユーザ
	final private static String password = "terror"; // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;

	public ArrayList<CourseLecture> getCourseLectureList(String timeTableID) throws SQLException {
		// memberがDBにあるかどうかを調べる
		ArrayList<CourseLecture> result = new ArrayList<CourseLecture>();
		Connection connection;
		String sql = "select * from courselecture where timetableID=?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, timeTableID);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				//st = null;
				CourseLecture cl = new CourseLecture();

				String ttID = resultSet.getString("timetableid");
				cl.setTimeTableID(ttID);
				int lecID = resultSet.getInt("lectureid");
				cl.setLectureID(lecID);
				String cs = resultSet.getString("coursesituation");
				cl.setCourseSituation(cs);

				result.add(cl);
			}

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	public boolean registerCourseLecture(CourseLecture courseLecture) throws SQLException {
		// memberがDBにあるかどうかを調べる
		boolean result = false;
		Connection connection;
		String sql = "INSERT INTO courselecture VALUES (?, ?, ?)";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, courseLecture.getTimeTableID());
			pstmt.setInt(2, courseLecture.getLectureID());
			pstmt.setString(3, courseLecture.getCourseSituation());

			int rowNum=pstmt.executeUpdate();
			if (rowNum==1) result = true;
			System.out.println(result);


			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean updateCourseLecture(CourseLecture courseLecture) throws SQLException {
		// memberがDBにあるかどうかを調べる
		boolean result = false;
		Connection connection;
		String sql = "UPDATE courselecture SET lectureid = ? ,courseSituation = ? WHERE timeTableID = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(3, courseLecture.getTimeTableID());
			pstmt.setInt(1, courseLecture.getLectureID());
			pstmt.setString(2, courseLecture.getCourseSituation());

			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()) result = true;

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean removeCourseLecture(CourseLecture courseLecture) throws SQLException {
		// memberがDBにあるかどうかを調べる
		boolean result = false;
		Connection connection;
		String sql = "DELETE FROM courselecture WHERE timetableid = ? AND lectureid = ? ";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, courseLecture.getTimeTableID());
			pstmt.setInt(2, courseLecture.getLectureID());

			int rowNum = pstmt.executeUpdate();
			if (rowNum==1) result = true;

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
