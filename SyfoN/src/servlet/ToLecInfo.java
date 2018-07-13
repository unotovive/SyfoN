package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import Lecture.Lecture;
import Lecture.LectureManager;
import professor.ProfessorManager;
import professorToLecture.ProfessorToLectureManager;
import review.Review;
import review.ReviewManager;
import student.StudentManager;
/**
 * Servlet implementation class ToLecInfo
 */
@WebServlet("/ToLecInfo")
public class ToLecInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToLecInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		request.setCharacterEncoding("UTF-8");
//
//		Lecture lecture= new Lecture();
//		LectureManager lectureManager = new LectureManager();
//		ProfessorToLectureManager ptl=new ProfessorToLectureManager();
//		ProfessorManager professorManager=new ProfessorManager();
//		Map<String,Map> lectureMap=new HashMap<String,Map>();
//		Map<String,String> lectureDataMap=new HashMap<String,String>();
//
//		HttpSession session = request.getSession();
//
//		//レクチャーIDからレクチャーの情報を得る
////		lecture.setLectureID(Integer.valueOf(request.getParameter("lecutureID")));
//		lecture.setLectureID(Integer.valueOf("161001"));
//		String professorID,professorName;
//		try {
//		lecture=lectureManager.getLecture(lecture.getLectureID());
//		System.out.println(lecture.getLectureID());
//		//教授の名前を見つける
//		professorID=ptl.getPTL(lecture.getLectureID()).getProfessorID();
//		professorName=professorManager.getProfessor(professorID).getProfessorName();
//
//		//JSPに送るマップに情報を入れる
//		lectureDataMap.put("lectureid",Integer.toString(lecture.getLectureID()));
//		lectureDataMap.put("name",lecture.getLectureName());
//		lectureDataMap.put("gaitogakki",lecture.getGaitoGakki());
//		lectureDataMap.put("day",lecture.getDay());
//		lectureDataMap.put("period",Integer.toString(lecture.getPeriod()));
//		lectureDataMap.put("room",lecture.getRoom());
//		lectureDataMap.put("taninum",Integer.toString(lecture.getTaniNum()));
//		lectureDataMap.put("purpose",lecture.getPurpose());
//		lectureDataMap.put("achieve",lecture.getAchieve());
//		lectureDataMap.put("relation",lecture.getRelation());
//		lectureDataMap.put("term",lecture.getTerm());
//		lectureDataMap.put("textbook",lecture.getTextbook());
//		lectureDataMap.put("hyokahoho",lecture.getHyokahoho());
//		lectureDataMap.put("kyoikumokuhyo",lecture.getKyoikumokuhyo());
//		lectureDataMap.put("yosyufukusyu",lecture.getYosyufukusyu());
//		lectureDataMap.put("email",lecture.getEmail());
//		lectureDataMap.put("support",lecture.getSupport());
//		lectureDataMap.put("caution",lecture.getCaution());
//		lectureDataMap.put("advice",lecture.getAdvice());
//		lectureDataMap.put("unit",lecture.getUnit());
//		lectureDataMap.put("type",lecture.getType());
//		lectureDataMap.put("professorname",professorName);
//
//		lectureMap.put("lectureInfo",lectureDataMap);
//		JSONObject lectureMapJson=new JSONObject(lectureMap);
//		session.setAttribute("lectureInfo", lectureMapJson);
//		System.out.println(lectureMapJson);
//
//
//		//ここまで講義
//		//-------------------------------------------------------
//		//ここから評価
//        ReviewManager reviewManager = new ReviewManager();
//        ArrayList<Review> reviewList = new ArrayList<Review>();
//		Map<String,Map> reviewMap=new HashMap<String,Map>();
//		Map<String,Map> reviewListMap=new HashMap<String,Map>();
//
//		reviewList=reviewManager.getReviewList(lecture.getLectureID());
//		int count=0;
//		for(Review tempReview:reviewList){
//			//評価のデータが入るマップ
//			Map<String,String> reviewDataMap=new HashMap<String,String>();
//			//StudentManagerを使用してニックネームを取得
//			String studentName=new StudentManager().getStudent(tempReview.getStudentID()).getNickName();
//
//			reviewDataMap.put("studentName",studentName);
//			reviewDataMap.put("studentid",tempReview.getStudentID());
//			reviewDataMap.put("reviewid",tempReview.getReviewID());
//			reviewDataMap.put("comment",tempReview.getComment());
//			reviewDataMap.put("totalPoint",Float.toString(tempReview.getTotalPoint()));
//			reviewDataMap.put("mathPoint",Float.toString(tempReview.getMathPoint()));
//			reviewDataMap.put("programPoint",Float.toString(tempReview.getProgramPoint()));
//			reviewDataMap.put("professorPoint",Float.toString(tempReview.getProfessorPoint()));
//			reviewDataMap.put("attendPoint",Float.toString(tempReview.getAttendPoint()));
//			reviewDataMap.put("homeworkPoint",Float.toString(tempReview.getHomeworkPoint()));
//			reviewDataMap.put("groupworkPoint",Float.toString(tempReview.getGroupworkPoint()));
//
//			reviewListMap.put("review"+Integer.toString(count),reviewDataMap);
//			count++;
//		}
//
//		reviewMap.put("reviews",reviewListMap);
//		JSONObject reviewsJson=new JSONObject(reviewMap);
//		session.setAttribute("reviewJson",reviewsJson);
//		System.out.println(reviewsJson);
//		getServletContext().getRequestDispatcher("/reviewtable.jsp").forward(request, response);
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		Lecture lecture= new Lecture();
		LectureManager lectureManager = new LectureManager();
		ProfessorToLectureManager ptl=new ProfessorToLectureManager();
		ProfessorManager professorManager=new ProfessorManager();
		Map<String,Map> lectureMap=new HashMap<String,Map>();
		Map<String,String> lectureDataMap=new HashMap<String,String>();

		HttpSession session = request.getSession();

		//レクチャーIDからレクチャーの情報を得る
//		lecture.setLectureID(Integer.valueOf(request.getParameter("lecutureID")));
		lecture.setLectureID(Integer.valueOf("161001"));
		String professorID,professorName;
		try {
		lecture=lectureManager.getLecture(lecture.getLectureID());
		System.out.println(lecture.getLectureID());
		//教授の名前を見つける
		professorID=ptl.getPTL(lecture.getLectureID()).getProfessorID();
		professorName=professorManager.getProfessor(professorID).getProfessorName();

		//JSPに送るマップに情報を入れる
		lectureDataMap.put("lectureid",Integer.toString(lecture.getLectureID()));
		lectureDataMap.put("name",lecture.getLectureName());
		lectureDataMap.put("gaitogakki",lecture.getGaitoGakki());
		lectureDataMap.put("day",lecture.getDay());
		lectureDataMap.put("period",Integer.toString(lecture.getPeriod()));
		lectureDataMap.put("room",lecture.getRoom());
		lectureDataMap.put("taninum",Integer.toString(lecture.getTaniNum()));
		lectureDataMap.put("purpose",lecture.getPurpose());
		lectureDataMap.put("achieve",lecture.getAchieve());
		lectureDataMap.put("relation",lecture.getRelation());
		lectureDataMap.put("term",lecture.getTerm());
		lectureDataMap.put("textbook",lecture.getTextbook());
		lectureDataMap.put("hyokahoho",lecture.getHyokahoho());
		lectureDataMap.put("kyoikumokuhyo",lecture.getKyoikumokuhyo());
		lectureDataMap.put("yosyufukusyu",lecture.getYosyufukusyu());
		lectureDataMap.put("email",lecture.getEmail());
		lectureDataMap.put("support",lecture.getSupport());
		lectureDataMap.put("caution",lecture.getCaution());
		lectureDataMap.put("advice",lecture.getAdvice());
		lectureDataMap.put("unit",lecture.getUnit());
		lectureDataMap.put("type",lecture.getType());
		lectureDataMap.put("professorname",professorName);

		lectureMap.put("lectureInfo",lectureDataMap);
		JSONObject lectureMapJson=new JSONObject(lectureMap);
		session.setAttribute("lectureInfo", lectureMapJson);
		System.out.println(lectureMapJson);


		//ここまで講義
		//-------------------------------------------------------
		//ここから評価
        ReviewManager reviewManager = new ReviewManager();
        ArrayList<Review> reviewList = new ArrayList<Review>();
		Map<String,Map> reviewMap=new HashMap<String,Map>();
		Map<String,Map> reviewListMap=new HashMap<String,Map>();

		reviewList=reviewManager.getReviewList(lecture.getLectureID());
		int count=0;
		for(Review tempReview:reviewList){
			//評価のデータが入るマップ
			Map<String,String> reviewDataMap=new HashMap<String,String>();
			//StudentManagerを使用してニックネームを取得
			String studentName=new StudentManager().getStudent(tempReview.getStudentID()).getNickName();

			reviewDataMap.put("studentName",studentName);
			reviewDataMap.put("studentid",tempReview.getStudentID());
			reviewDataMap.put("reviewid",tempReview.getReviewID());
			reviewDataMap.put("comment",tempReview.getComment());
			reviewDataMap.put("totalPoint",Float.toString(tempReview.getTotalPoint()));
			reviewDataMap.put("mathPoint",Float.toString(tempReview.getMathPoint()));
			reviewDataMap.put("programPoint",Float.toString(tempReview.getProgramPoint()));
			reviewDataMap.put("professorPoint",Float.toString(tempReview.getProfessorPoint()));
			reviewDataMap.put("attendPoint",Float.toString(tempReview.getAttendPoint()));
			reviewDataMap.put("homeworkPoint",Float.toString(tempReview.getHomeworkPoint()));
			reviewDataMap.put("groupworkPoint",Float.toString(tempReview.getGroupworkPoint()));

			reviewListMap.put("review"+Integer.toString(count),reviewDataMap);
			count++;
		}

		reviewMap.put("reviews",reviewListMap);
		JSONObject reviewsJson=new JSONObject(reviewMap);
		session.setAttribute("reviewJson",reviewsJson);
		System.out.println(reviewsJson);
		getServletContext().getRequestDispatcher("/reviewtable.jsp").forward(request, response);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}