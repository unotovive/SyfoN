package relationUnit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class RelationUnitDAO {

	final private static String dbname = "garen"; //tutorial  // データベース名
	final private static String user = "knight"; //wspuser     // tutorialにアクセスできるユーザ
	final private static String password = "terror";//hogehoge  // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;

	public RelationUnit getRelationUnit(int lectureID) throws SQLException {
		// memberがDBにあるかどうかを調べる
		RelationUnit relUnit = new RelationUnit();
		Connection connection;
		String sql = "select * from relationunit where lectureid = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, lectureID);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				int lecID = resultSet.getInt("lectureid");
				relUnit.setLectureID(lecID);
				String unitID = resultSet.getString("unitid");
				relUnit.setUnitID(unitID);
			}

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return relUnit;
	}


	public boolean registerRelationUnit(RelationUnit relationUnit) throws SQLException {
		boolean result = false;
		Connection connection;
		String sql = "INSERT INTO relationunit VALUES (?, ?)";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, relationUnit.getLectureID());
			pstmt.setString(2, relationUnit.getUnitID());

			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()) result = true;

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean updateRelationUnit(RelationUnit relationUnit) throws SQLException {
		boolean result = false;
		Connection connection;
		String sql = "UPDATE relationunit SET unitid = ? where lectureid = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setInt(2, relationUnit.getLectureID());
			pstmt.setString(1, relationUnit.getUnitID());

			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()) result = true;

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean removeRelationUnit(RelationUnit relationUnit) throws SQLException {
		// memberがDBにあるかどうかを調べる
		boolean result = false;
		Connection connection;
		String sql = "DELETE FROM relationunit WHERE lectureid = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, relationUnit.getLectureID());
			//pstmt.setString(2, relationUnit.getUnitID());

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
