package unit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UnitDAO {

	final private static String dbname = "tutorial";   // データベース名
	final private static String user = "wspuser";      // tutorialにアクセスできるユーザ
	final private static String password = "hogehoge"; // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;

	public Unit getUnit(String unitID) throws SQLException {
		// studentがDBにあるかどうかを調べる
		Unit unit = new Unit();

		Connection connection;
		String sql = "select * from unit where unitID=?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, unitID);

			ResultSet resultSet = pstmt.executeQuery(sql);
			while(resultSet.next()){

				String unID = resultSet.getString("unitid");
				unit.setUnitID(unID);
				String unName = resultSet.getString("unitname");
				unit.setUnitName(unName);
				int unTani = resultSet.getInt("unittani");
				unit.setUnitTani(unTani);
			}
			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return unit;
	}


}
