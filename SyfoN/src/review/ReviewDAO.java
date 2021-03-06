package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class ReviewDAO {
	final private static String dbname = "garen"; //tutorial  // データベース名
	final private static String user = "knight"; //wspuser     // tutorialにアクセスできるユーザ
	final private static String password = "terror";//hogehoge  // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;

	public ArrayList<Review> getReviewList(int lectureID) throws SQLException {
		ArrayList<Review> revList = new ArrayList<Review>();
		Connection connection;
		String sql = "SELECT * FROM review where lectureid = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, lectureID);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				Review rev = new Review();

				String reviewID = resultSet.getString("reviewid");
				rev.setReviewID(reviewID);
				String studentID = resultSet.getString("studentid");
				rev.setStudentID(studentID);
				int lecID = resultSet.getInt("lectureid");
				rev.setLectureID(lecID);
				String comment = resultSet.getString("comment");
				rev.setComment(comment);
				float totalP = resultSet.getFloat("totalpoint");
				rev.setTotalPoint(totalP);
				float mathP = resultSet.getFloat("mathpoint");
				rev.setMathPoint(mathP);
				float programP = resultSet.getFloat("programpoint");
				rev.setProgramPoint(programP);
				float professorP = resultSet.getFloat("professorpoint");
				rev.setProfessorPoint(professorP);
				float attendP = resultSet.getFloat("attendpoint");
				rev.setAttendPoint(attendP);
				float homeworkP = resultSet.getFloat("homeworkpoint");
				rev.setHomeworkPoint(homeworkP);
				float groupP = resultSet.getFloat("groupworkpoint");
				rev.setGroupworkPoint(groupP);
				revList.add(rev);

			}
			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return revList;
	}

	public Review getReview(String reviewID) throws SQLException {
		Review rev = new Review();
		Connection connection;
		String sql = "SELECT * FROM review where reviewid = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, reviewID);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){

				String revID = resultSet.getString("reviewid");
				rev.setReviewID(revID);
				String studentID = resultSet.getString("studentid");
				rev.setStudentID(studentID);
				int lecID = resultSet.getInt("lectureid");
				rev.setLectureID(lecID);
				String comment = resultSet.getString("comment");
				rev.setComment(comment);
				float totalP = resultSet.getFloat("totalpoint");
				rev.setTotalPoint(totalP);
				float mathP = resultSet.getFloat("mathpoint");
				rev.setMathPoint(mathP);
				float programP = resultSet.getFloat("programpoint");
				rev.setProgramPoint(programP);
				float professorP = resultSet.getFloat("professorpoint");
				rev.setProfessorPoint(professorP);
				float attendP = resultSet.getFloat("attendpoint");
				rev.setAttendPoint(attendP);
				float homeworkP = 0;
				rev.setHomeworkPoint(homeworkP);
				float groupP = resultSet.getFloat("groupworkpoint");
				rev.setGroupworkPoint(groupP);
			}
			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rev;
	}

	public ArrayList<Review> getAllReviewList() throws SQLException {
		ArrayList<Review> revList = new ArrayList<Review>();
		Connection connection;
		String sql = "SELECT * FROM review";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			//pstmt.setInt(1, lectureID);

			ResultSet resultSet = pstmt.executeQuery(sql);
			while(resultSet.next()){
				Review rev = new Review();

				String reviewID = resultSet.getString("reviewid");
				rev.setReviewID(reviewID);
				String studentID = resultSet.getString("studentid");
				rev.setStudentID(studentID);
				int lecID = resultSet.getInt("lectureid");
				rev.setLectureID(lecID);
				String comment = resultSet.getString("comment");
				rev.setComment(comment);
				float totalP = resultSet.getFloat("totalpoint");
				rev.setTotalPoint(totalP);
				float mathP = resultSet.getFloat("mathpoint");
				rev.setMathPoint(mathP);
				float programP = resultSet.getFloat("programpoint");
				rev.setProgramPoint(programP);
				float professorP = resultSet.getFloat("professorpoint");
				rev.setProfessorPoint(professorP);
				float attendP = resultSet.getFloat("attendpoint");
				rev.setAttendPoint(attendP);
				float homeworkP = resultSet.getFloat("homeworkpoint");
				rev.setHomeworkPoint(homeworkP);
				float groupP = resultSet.getFloat("grouppoint");
				rev.setGroupworkPoint(groupP);
				revList.add(rev);

			}
			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return revList;
	}

	public boolean registerReview(Review review) throws SQLException {
		// レビューを登録する
		boolean result = false;
		Connection connection;
		String sql = "INSERT INTO review VALUES(?,?,?,?,?,?,?,?,?,?,?)";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);
			String newID=Integer.toString(Integer.valueOf(this.getMaxID())+1);

			pstmt.setString(1, newID);
			pstmt.setString(2, review.getStudentID());
			pstmt.setInt(3, review.getLectureID());
			pstmt.setString(4, review.getComment());
			pstmt.setFloat(5, review.getTotalPoint());
			pstmt.setFloat(6, review.getMathPoint());
			pstmt.setFloat(7, review.getProgramPoint());
			pstmt.setFloat(8, review.getProfessorPoint());
			pstmt.setFloat(9, review.getAttendPoint());
			pstmt.setFloat(10, 0);
			pstmt.setFloat(11, review.getGroupworkPoint());


			int rowNum=pstmt.executeUpdate();
			if (rowNum==1) result = true;

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean updateReview(Review review) throws SQLException {
		// レビューの更新
		boolean result = false;
		Connection connection;
		String sql = "UPDATE review SET studentid = ?,lectureid = ?, comment = ?,"
				+ "totalpoint = ?, mathpoint = ?,programpoint = ?,professorpoint = ?,attendpoint = ?,homeworkpoint = ?,"
				+ "groupworkpoint = ? WHERE reviewID = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, review.getStudentID());
			pstmt.setInt(2, review.getLectureID());
			pstmt.setString(3, review.getComment());
			pstmt.setFloat(4, review.getTotalPoint());
			pstmt.setFloat(5, review.getMathPoint());
			pstmt.setFloat(6, review.getProgramPoint());
			pstmt.setFloat(7, review.getProfessorPoint());
			pstmt.setFloat(8, review.getAttendPoint());
			pstmt.setFloat(9, 0);
			pstmt.setFloat(10, review.getGroupworkPoint());
			pstmt.setString(11, review.getReviewID());

			int rowNum=pstmt.executeUpdate();
			System.out.println(rowNum);
			if (rowNum>=1) result = true;

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean removeReview(Review review) throws SQLException {
		// レビューを削除する
		boolean result = false;
		Connection connection;
		String sql = "DELETE FROM review WHERE reviewid = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, review.getReviewID());

			int rowNum = pstmt.executeUpdate();
			if (rowNum==1) result = true;

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean check(Review review){
		boolean result=false;
		Connection connection;
		String sql = "SELECT * FROM review WHERE studentid = ? AND lectureid = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, review.getStudentID());
			pstmt.setInt(2, review.getLectureID());

			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()) result = true;

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	private String getMaxID(){
		String result="0";
		final int MAXNO=1;
		Connection connection;
		String sql="SELECT MAX(reviewid) FROM review;";

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

