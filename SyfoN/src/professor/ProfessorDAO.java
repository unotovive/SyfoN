package professor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class ProfessorDAO {

	final private static String dbname = "garen";   // データベース名
	final private static String user = "knight";      // tutorialにアクセスできるユーザ
	final private static String password = "terror"; // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;

	public Professor getProfessor(String professorID) throws SQLException {
		// studentがDBにあるかどうかを調べる
		Professor professor = new Professor();

		Connection connection;
		String sql = "select * from professor where professorID = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, professorID);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){

				String proID = resultSet.getString("professorid");
				professor.setProfessorID(proID);
				String proName = resultSet.getString("professorname");
				professor.setProfessorName(proName);
			}
			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return professor;
	}

	public ArrayList<Professor> findProfessor(String professorName) throws SQLException {
		Connection connection;
		String sql = "SELECT * FROM professor WHERE professorname = ?";
		ArrayList<Professor> proList=new ArrayList<Professor>();

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, "%"+professorName+"%");

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				Professor pro =new Professor();
				String proID = resultSet.getString("professorid");
				pro.setProfessorID(proID);
				String proName = resultSet.getString("professorname");
				pro.setProfessorName(proName);

				proList.add(pro);
			}
			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return proList;
	}

	public ArrayList<Professor> getAllProfessors() throws SQLException {
		Connection connection;
		String sql = "SELECT * FROM professor";
		ArrayList<Professor> proList=new ArrayList<Professor>();

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				Professor pro =new Professor();
				String proID = resultSet.getString("professorid");
				pro.setProfessorID(proID);
				String proName = resultSet.getString("professorname");
				pro.setProfessorName(proName);

				proList.add(pro);
			}
			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return proList;
	}

}
