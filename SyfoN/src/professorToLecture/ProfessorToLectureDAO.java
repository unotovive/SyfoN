package professorToLecture;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProfessorToLectureDAO {
	final private static String dbname = "garen";   // データベース名
	final private static String user = "knight";      // tutorialにアクセスできるユーザ
	final private static String password = "terror"; // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;

	public ProfessorToLecture getProfessorToLecture(int lectureID) throws SQLException {
		ProfessorToLecture ptl=new ProfessorToLecture();
		Connection connection;
		String sql = "SELECT * FROM professortolecture where lectureid = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, lectureID);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){

				ptl.setLectureID(lectureID);
				String professorID = resultSet.getString("professorid");
				ptl.setProfessorID(professorID);
			}
			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ptl;
	}

	public ArrayList<ProfessorToLecture> findlecture(String professorID){
		ArrayList<ProfessorToLecture> ptlList=new ArrayList<ProfessorToLecture>();
		Connection connection;
		String sql = "SELECT * FROM professortolecture where professorid = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, professorID);

			ResultSet resultSet = pstmt.executeQuery(sql);
			while(resultSet.next()){
				ProfessorToLecture tempPtl=new ProfessorToLecture();
				tempPtl.setProfessorID(professorID);
				tempPtl.setLectureID(resultSet.getInt("lectureid"));
				ptlList.add(tempPtl);
			}
			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ptlList;
	}
	public boolean registerPTL(ProfessorToLecture ptl){
		boolean result=true;

		return result;
	}
	public boolean updatePTL(ProfessorToLecture ptl){
		boolean result=true;
		return result;
	}
}