package Lecture;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class LectureDAO {

	final private static String dbname = "garen";   // データベース名
	final private static String user = "knight";      // tutorialにアクセスできるユーザ
	final private static String password = "terror"; // wspuserのパスワード
	final private static String driverClassName = "org.postgresql.Driver";
	final private static String url = "jdbc:postgresql://localhost/" + dbname;

	public Lecture getLecture(int lectureID) throws SQLException {
		Lecture lec = new Lecture();
		Connection connection;
		String sql = "SELECT * FROM lecture where lectureid=?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, lectureID);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){

				int lecID = resultSet.getInt("lectureid");
				lec.setLectureID(lecID);
				String lecName = resultSet.getString("lecturename");
				lec.setLectureName(lecName);
				String gakki = resultSet.getString("gaitogakki");
				lec.setGaitoGakki(gakki);
				String day = resultSet.getString("day");
				lec.setDay(day);
				int period = resultSet.getInt("period");
				lec.setPeriod(period);
				String room = resultSet.getString("room");
				lec.setRoom(room);
				int tani = resultSet.getInt("taninum");
				lec.setTaniNum(tani);
				String purpose = resultSet.getString("purpose");
				lec.setPurpose(purpose);
				String achieve = resultSet.getString("achieve");
				lec.setAchieve(achieve);
				String relation = resultSet.getString("relation");
				lec.setRelation(relation);
				String term = resultSet.getString("term");
				lec.setTerm(term);
				String text = resultSet.getString("textbook");
				lec.setTextbook(text);
				String hyoka = resultSet.getString("hyokahoho");
				lec.setHyokahoho(hyoka);
				String kyoiku = resultSet.getString("kyoikumokuhyo");
				lec.setKyoikumokuhyo(kyoiku);
				String yosyu = resultSet.getString("yosyufukusyu");
				lec.setYosyufukusyu(yosyu);
				String email = resultSet.getString("email");
				lec.setEmail(email);
				String support = resultSet.getString("support");
				lec.setSupport(support);
				String caution = resultSet.getString("caution");
				lec.setCaution(caution);
				String advice = resultSet.getString("advice");
				lec.setAdvice(advice);
				String unit = resultSet.getString("unit");
				lec.setUnit(unit);
				String type = resultSet.getString("type");
				lec.setType(type);
			}

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lec;
	}

	public ArrayList<Lecture> getLectureList() throws SQLException {
		//全ての講義を渡す

		ArrayList<Lecture> lecList = new ArrayList<Lecture>();

		Connection connection;
		String sql = "SELECT * FROM lecture";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			//pstmt.setString(1, day);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){

				Lecture lec = new Lecture();

				int lecID = resultSet.getInt("lectureid");
				lec.setLectureID(lecID);
				String lecName = resultSet.getString("lecturename");
				lec.setLectureName(lecName);
				String gakki = resultSet.getString("gaitogakki");
				lec.setGaitoGakki(gakki);
				String sday = resultSet.getString("day");
				lec.setDay(sday);
				int period = resultSet.getInt("period");
				lec.setPeriod(period);
				String room = resultSet.getString("room");
				lec.setRoom(room);
				int tani = resultSet.getInt("taninum");
				lec.setTaniNum(tani);
				String purpose = resultSet.getString("purpose");
				lec.setPurpose(purpose);
				String achieve = resultSet.getString("achieve");
				lec.setAchieve(achieve);
				String relation = resultSet.getString("relation");
				lec.setRelation(relation);
				String term = resultSet.getString("term");
				lec.setTerm(term);
				String text = resultSet.getString("textbook");
				lec.setTextbook(text);
				String hyoka = resultSet.getString("hyokahoho");
				lec.setHyokahoho(hyoka);
				String kyoiku = resultSet.getString("kyoikumokuhyo");
				lec.setKyoikumokuhyo(kyoiku);
				String yosyu = resultSet.getString("yosyufukusyu");
				lec.setYosyufukusyu(yosyu);
				String email = resultSet.getString("email");
				lec.setEmail(email);
				String support = resultSet.getString("support");
				lec.setSupport(support);
				String caution = resultSet.getString("caution");
				lec.setCaution(caution);
				String advice = resultSet.getString("advice");
				lec.setAdvice(advice);
				String unit = resultSet.getString("unit");
				lec.setUnit(unit);
				String type = resultSet.getString("type");
				lec.setType(type);

				lecList.add(lec);
			}

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lecList;
	}

	public ArrayList<Lecture> findLectureByLectureName(String lecName) throws SQLException {
		// 名前を使ってLectureを探す

		ArrayList<Lecture> lecList = new ArrayList<Lecture>();

		Connection connection;
		String sql = "SELECT * FROM lecture where lecturename Like ? ";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, '%'+lecName+'%');

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){

				Lecture lec = new Lecture();

				int lecID = resultSet.getInt("lectureid");
				lec.setLectureID(lecID);
				String sLecName = resultSet.getString("lecturename");
				lec.setLectureName(sLecName);
				String gakki = resultSet.getString("gaitogakki");
				lec.setGaitoGakki(gakki);
				String sday = resultSet.getString("day");
				lec.setDay(sday);
				int period = resultSet.getInt("period");
				lec.setPeriod(period);
				String room = resultSet.getString("room");
				lec.setRoom(room);
				int tani = resultSet.getInt("taninum");
				lec.setTaniNum(tani);
				String purpose = resultSet.getString("purpose");
				lec.setPurpose(purpose);
				String achieve = resultSet.getString("achieve");
				lec.setAchieve(achieve);
				String relation = resultSet.getString("relation");
				lec.setRelation(relation);
				String term = resultSet.getString("term");
				lec.setTerm(term);
				String text = resultSet.getString("textbook");
				lec.setTextbook(text);
				String hyoka = resultSet.getString("hyokahoho");
				lec.setHyokahoho(hyoka);
				String kyoiku = resultSet.getString("kyoikumokuhyo");
				lec.setKyoikumokuhyo(kyoiku);
				String yosyu = resultSet.getString("yosyufukusyu");
				lec.setYosyufukusyu(yosyu);
				String email = resultSet.getString("email");
				lec.setEmail(email);
				String support = resultSet.getString("support");
				lec.setSupport(support);
				String caution = resultSet.getString("caution");
				lec.setCaution(caution);
				String advice = resultSet.getString("advice");
				lec.setAdvice(advice);
				String unit = resultSet.getString("unit");
				lec.setUnit(unit);
				String type = resultSet.getString("type");
				lec.setType(type);

				lecList.add(lec);
			}

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lecList;
	}




	public ArrayList<Lecture> findLectureByDay(String day) throws SQLException {
		// memberがDBにあるかどうかを調べる

		ArrayList<Lecture> lecList = new ArrayList<Lecture>();

		Connection connection;
		String sql = "SELECT * FROM lecture where day = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, day);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){

				Lecture lec = new Lecture();

				int lecID = resultSet.getInt("lectureid");
				lec.setLectureID(lecID);
				String lecName = resultSet.getString("lecturename");
				lec.setLectureName(lecName);
				String gakki = resultSet.getString("gaitogakki");
				lec.setGaitoGakki(gakki);
				String sday = resultSet.getString("day");
				lec.setDay(sday);
				int period = resultSet.getInt("period");
				lec.setPeriod(period);
				String room = resultSet.getString("room");
				lec.setRoom(room);
				int tani = resultSet.getInt("taninum");
				lec.setTaniNum(tani);
				String proID = resultSet.getString("professorid");
				lec.setProfessorID(proID);
				String purpose = resultSet.getString("purpose");
				lec.setPurpose(purpose);
				String achieve = resultSet.getString("achieve");
				lec.setAchieve(achieve);
				String relation = resultSet.getString("relation");
				lec.setRelation(relation);
				String term = resultSet.getString("term");
				lec.setTerm(term);
				String text = resultSet.getString("textbook");
				lec.setTextbook(text);
				String hyoka = resultSet.getString("hyokahoho");
				lec.setHyokahoho(hyoka);
				String kyoiku = resultSet.getString("kyoikumokuhyo");
				lec.setKyoikumokuhyo(kyoiku);
				String yosyu = resultSet.getString("yosyufukusyu");
				lec.setYosyufukusyu(yosyu);
				String email = resultSet.getString("email");
				lec.setEmail(email);
				String support = resultSet.getString("support");
				lec.setSupport(support);
				String caution = resultSet.getString("caution");
				lec.setCaution(caution);
				String advice = resultSet.getString("advice");
				lec.setAdvice(advice);
				String unit = resultSet.getString("unit");
				lec.setUnit(unit);
				String type = resultSet.getString("type");
				lec.setType(type);

				lecList.add(lec);
			}

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lecList;
	}

	//学期による検索
	public ArrayList<Lecture> findLectureByGaitoGakki(String gaitoGakki) throws SQLException {
		ArrayList<Lecture> lecList = new ArrayList<Lecture>();

		Connection connection;
		String sql = "SELECT * FROM lecture where gaitogakki LIKE ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, gaitoGakki);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){

				Lecture lec = new Lecture();

				int lecID = resultSet.getInt("lectureid");
				lec.setLectureID(lecID);
				String lecName = resultSet.getString("lecturename");
				lec.setLectureName(lecName);
				String gakki = resultSet.getString("gaitogakki");
				lec.setGaitoGakki(gakki);
				String day = resultSet.getString("day");
				lec.setDay(day);
				int period = resultSet.getInt("period");
				lec.setPeriod(period);
				String room = resultSet.getString("room");
				lec.setRoom(room);
				int tani = resultSet.getInt("taninum");
				lec.setTaniNum(tani);
				String proID = resultSet.getString("professorid");
				lec.setProfessorID(proID);
				String purpose = resultSet.getString("purpose");
				lec.setPurpose(purpose);
				String achieve = resultSet.getString("achieve");
				lec.setAchieve(achieve);
				String relation = resultSet.getString("relation");
				lec.setRelation(relation);
				String term = resultSet.getString("term");
				lec.setTerm(term);
				String text = resultSet.getString("textbook");
				lec.setTextbook(text);
				String hyoka = resultSet.getString("hyokahoho");
				lec.setHyokahoho(hyoka);
				String kyoiku = resultSet.getString("kyoikumokuhyo");
				lec.setKyoikumokuhyo(kyoiku);
				String yosyu = resultSet.getString("yosyufukusyu");
				lec.setYosyufukusyu(yosyu);
				String email = resultSet.getString("email");
				lec.setEmail(email);
				String support = resultSet.getString("support");
				lec.setSupport(support);
				String caution = resultSet.getString("caution");
				lec.setCaution(caution);
				String advice = resultSet.getString("advice");
				lec.setAdvice(advice);
				String unit = resultSet.getString("unit");
				lec.setUnit(unit);
				String type = resultSet.getString("type");
				lec.setType(type);

				lecList.add(lec);
			}

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lecList;
	}

	//ここ、完全検索でおｋ？
	public ArrayList<Lecture> findLectureByPeriod(int period) throws SQLException {
		ArrayList<Lecture> lecList = new ArrayList<Lecture>();

		Connection connection;
		String sql = "SELECT * FROM lecture where period = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, period);

			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){

				Lecture lec = new Lecture();

				int lecID = resultSet.getInt("lectureid");
				lec.setLectureID(lecID);
				String lecName = resultSet.getString("lecturename");
				lec.setLectureName(lecName);
				String gakki = resultSet.getString("gaitogakki");
				lec.setGaitoGakki(gakki);
				String day = resultSet.getString("day");
				lec.setDay(day);
				int speriod = resultSet.getInt("period");
				lec.setPeriod(speriod);
				String room = resultSet.getString("room");
				lec.setRoom(room);
				int tani = resultSet.getInt("taninum");
				lec.setTaniNum(tani);
				String proID = resultSet.getString("professorid");
				lec.setProfessorID(proID);
				String purpose = resultSet.getString("purpose");
				lec.setPurpose(purpose);
				String achieve = resultSet.getString("achieve");
				lec.setAchieve(achieve);
				String relation = resultSet.getString("relation");
				lec.setRelation(relation);
				String term = resultSet.getString("term");
				lec.setTerm(term);
				String text = resultSet.getString("textbook");
				lec.setTextbook(text);
				String hyoka = resultSet.getString("hyokahoho");
				lec.setHyokahoho(hyoka);
				String kyoiku = resultSet.getString("kyoikumokuhyo");
				lec.setKyoikumokuhyo(kyoiku);
				String yosyu = resultSet.getString("yosyufukusyu");
				lec.setYosyufukusyu(yosyu);
				String email = resultSet.getString("email");
				lec.setEmail(email);
				String support = resultSet.getString("support");
				lec.setSupport(support);
				String caution = resultSet.getString("caution");
				lec.setCaution(caution);
				String advice = resultSet.getString("advice");
				lec.setAdvice(advice);
				String unit = resultSet.getString("unit");
				lec.setUnit(unit);
				String type = resultSet.getString("type");
				lec.setType(type);

				lecList.add(lec);
			}

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lecList;
	}

	public boolean registerLecture(Lecture lecture) throws SQLException {
		// memberがDBにあるかどうかを調べる
		boolean result = false;
		Connection connection;
		String sql = "INSERT INTO lecture VALUES (?, ?, ?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?)";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, lecture.getLectureID());
			pstmt.setString(2, lecture.getLectureName());
			pstmt.setString(3, lecture.getGaitoGakki());
			pstmt.setString(4, lecture.getDay());
			pstmt.setInt(5, lecture.getPeriod());
			pstmt.setString(6, lecture.getRoom());
			pstmt.setInt(7, lecture.getTaniNum());
			pstmt.setString(8, lecture.getProfessorID());
			pstmt.setString(9, lecture.getPurpose());
			pstmt.setString(10, lecture.getAchieve());
			pstmt.setString(11, lecture.getRelation());
			pstmt.setString(12, lecture.getTerm());
			pstmt.setString(13, lecture.getTextbook());
			pstmt.setString(14, lecture.getHyokahoho());
			pstmt.setString(15, lecture.getKyoikumokuhyo());
			pstmt.setString(16, lecture.getYosyufukusyu());
			pstmt.setString(17, lecture.getEmail());
			pstmt.setString(18, lecture.getSupport());
			pstmt.setString(19, lecture.getCaution());
			pstmt.setString(20, lecture.getAdvice());
			pstmt.setString(21, lecture.getUnit());
			pstmt.setString(22, lecture.getType());


			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()) result = true;

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean updateLecture(Lecture lecture) throws SQLException {
		// memberがDBにあるかどうかを調べる
		boolean result = false;
		Connection connection;
		String sql = "UPDATE lecture SET LectureName = ?,GaitoGakki = ?, Day = ?,"
				+ "Period = ?, Room = ?,TaniNum = ?,ProfessorID = ?,Purpose = ?,Achieve = ?,"
				+ "Relation = ?,Term = ?,Textbook = ?,Hyokahoho = ?,Kyoikumokuhyo = ?,"
				+ "Yosyufukusyu = ?,Email = ?,Support = ?,Caution = ?,Advice = ?,Unit = ?,Type =? WHERE lectureID = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setInt(22, lecture.getLectureID());
			pstmt.setString(1, lecture.getLectureName());
			pstmt.setString(2, lecture.getGaitoGakki());
			pstmt.setString(3, lecture.getDay());
			pstmt.setInt(4, lecture.getPeriod());
			pstmt.setString(5, lecture.getRoom());
			pstmt.setInt(6, lecture.getTaniNum());
			pstmt.setString(7, lecture.getProfessorID());
			pstmt.setString(8, lecture.getPurpose());
			pstmt.setString(9, lecture.getAchieve());
			pstmt.setString(10, lecture.getRelation());
			pstmt.setString(11, lecture.getTerm());
			pstmt.setString(12, lecture.getTextbook());
			pstmt.setString(13, lecture.getHyokahoho());
			pstmt.setString(14, lecture.getKyoikumokuhyo());
			pstmt.setString(15, lecture.getYosyufukusyu());
			pstmt.setString(16, lecture.getEmail());
			pstmt.setString(17, lecture.getSupport());
			pstmt.setString(18, lecture.getCaution());
			pstmt.setString(19, lecture.getAdvice());
			pstmt.setString(20, lecture.getUnit());
			pstmt.setString(21, lecture.getType());

			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()) result = true;

			resultSet.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean removeLecture(Lecture lecture) throws SQLException {
		// memberがDBにあるかどうかを調べる
		boolean result = false;
		Connection connection;
		String sql = "DELETE FROM lecture WHERE lectureID = ?";

		try {
			Class.forName(driverClassName);
			connection = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, lecture.getLectureID());

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
