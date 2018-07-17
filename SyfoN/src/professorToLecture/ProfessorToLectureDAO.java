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

				int lecID = resultSet.getInt("lectureid");

				ptl.setLectureID(lecID);
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

	public ArrayList<ProfessorToLecture> findPTLList(String professorID){
		ArrayList<ProfessorToLecture> ptlList=new ArrayList<ProfessorToLecture>();
		Connection connection;
		String sql = "SELECT * FROM professortolecture where professorid = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, professorID);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				ProfessorToLecture tempPtl=new ProfessorToLecture();

				int lecID = resultSet.getInt("lectureid");

				tempPtl.setLectureID(lecID);
				String proID = resultSet.getString("professorid");
				tempPtl.setProfessorID(proID);
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
		boolean result=false;
		Connection connection;
		String sql = "INSERT INTO professortolecture VALUES(?,?);";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, ptl.getProfessorID());
			pstmt.setInt(2, ptl.getLectureID());

			int rowNum = pstmt.executeUpdate();
			if (rowNum==1) result = true;

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public boolean updatePTL(ProfessorToLecture ptl){
		boolean result=false;
		Connection connection;
		String sql = "UPDATE professortolecture SET professorid =? WHERE lectureid=? ;";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, ptl.getProfessorID());
			pstmt.setInt(2, ptl.getLectureID());

			int rowNum = pstmt.executeUpdate();
			if (rowNum==1) result = true;


			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean removePTL(ProfessorToLecture ptl) {
		// TODO Auto-generated method stub
		boolean result = false;
		Connection connection;
		String sql = "DELETE FROM professortolecture WHERE lectureID = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, ptl.getLectureID());

			int rowNum = pstmt.executeUpdate();
			if (rowNum==1) result = true;

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
