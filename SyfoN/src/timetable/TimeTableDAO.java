package timetable;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TimeTableDAO {

	final private static String dbname = "garen";   // データベース名
	final private static String user = "knight";      // tutorialにアクセスできるユーザ
	final private static String password = "terror"; // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;

	public ArrayList<TimeTable> getTimeTableList(String studentID) throws SQLException {
		// DBにあるtimetableを引っ張ってくる
		ArrayList<TimeTable> result = new ArrayList<TimeTable>();
		Connection connection;
		String sql = "select * from timetable where studentID = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, studentID);
			System.out.println("studentID is "+studentID);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){
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

	public boolean registerTimeTable(String studentID) throws SQLException {
		// timeTableをDBに登録する
		boolean result = false;
		Connection connection;
		String[] semesters={"zenki1","kouki1","zenki2","kouki2","zenki3","kouki3","zenki4","kouki4"};

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			int max=Integer.valueOf(this.getMaxID())+1;


			for(int i=0;i<semesters.length;i++){
			String sql = "INSERT INTO timetable VALUES (?, ?, ?)";
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, Integer.toString(max)+i);
			pstmt.setString(2, studentID);
			pstmt.setString(3, semesters[i]);

			int rowNum=pstmt.executeUpdate();
			if (rowNum==1) result = true;
			}

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String getMaxID(){
		String result="0";
		final int MAXNO=1;
		Connection connection;
		String sql="SELECT MAX(timetable) FROM timetable;";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			resultSet.next();

			result=resultSet.getString(MAXNO);

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


}
