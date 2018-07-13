package MustTani;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MustTaniDAO {
	final private static String dbname = "garen";   // データベース名
	final private static String user = "knight";      // tutorialにアクセスできるユーザ
	final private static String password = "terror"; // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;
	public MustTani getMustTani(){
		MustTani mt=new MustTani();

		Connection connection;
		String sql = "SELECT * FROM musttani";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				int allMustTani = resultSet.getInt("allmt");
				mt.setAllMustTani(allMustTani);
				int electMustTani = resultSet.getInt("elmt");
				mt.setElectMustTani(electMustTani);
				int englishMustTani = resultSet.getInt("enmt");
				mt.setEnglishMustTani(englishMustTani);
				int jinkaMustTani = resultSet.getInt("jinmt");
				mt.setJinkaMustTani(jinkaMustTani);
				int hissyuMustTani = resultSet.getInt("hissyumt");
				mt.setHissyuMustTani(hissyuMustTani);
			}
			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mt;
	}
}
