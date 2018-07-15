package Admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {
	final private static String dbname = "garen";   // データベース名
	final private static String user = "knight";      // tutorialにアクセスできるユーザ
	final private static String password = "terror"; // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;

	public boolean check(Admin admin){
		boolean result=false;
		Connection connection;
		String sql = "SELECT * FROM admin WHERE adminid = ? AND password = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, admin.getAdminID());
			pstmt.setString(2, admin.getPassword());

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
