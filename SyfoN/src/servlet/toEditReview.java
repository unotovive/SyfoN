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
import review.Review;
import review.ReviewManager;

/**
 * Servlet implementation class Mypagesev
 */
@WebServlet("/toEditReview")
public class toEditReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public toEditReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//評価編集ボタン
		//テスト用
		HttpSession session =request.getSession();
		ReviewManager reviewManager=new ReviewManager();
		session.setAttribute("studentID", "16fi888");
		String studentID=(String)session.getAttribute("studentID");

		//int lectureID=(int)request.getAttribute("id");
		//テスト用
		int lectureID=161001;

		Review review=new Review();
		review.setLectureID(lectureID);
		review.setStudentID(studentID);


		try {
			boolean exist;
			exist = reviewManager.check(review);
			if(!exist){
				System.out.println("新規作成をおこないます");
				reviewManager.registerReview(review);
			}

			ArrayList<Review> allReviewList=reviewManager.getReviewList(lectureID);
			Review targetReview=null;
			for(Review tempReview:allReviewList){
				if(tempReview.getStudentID().equals(studentID)){
					targetReview=tempReview;
					break;
				}
			}

			Map<String,String> reviewMap=new HashMap<String,String>();
			if(targetReview==null){
				System.out.println("予期せぬエラー。レビューを疑え");
			}else{
				reviewMap.put("studentID",studentID);
				reviewMap.put("lectureID", Integer.toString(lectureID));
				reviewMap.put("総合", Float.toString(targetReview.getTotalPoint()));
				reviewMap.put("数学", Float.toString(targetReview.getMathPoint()));
				reviewMap.put("program", Float.toString(targetReview.getProgramPoint()));
				reviewMap.put("教授", Float.toString(targetReview.getProfessorPoint()));
				reviewMap.put("出席", Float.toString(targetReview.getAttendPoint()));
				reviewMap.put("グループワーク", Float.toString(targetReview.getGroupworkPoint()));
				reviewMap.put("コメント", targetReview.getComment());
			}
			//講義の情報を入れる
			Lecture lecture=new LectureManager().getLecture(lectureID);
			reviewMap.put("曜日",this.AdaptDay(lecture.getDay())+"曜日");
			reviewMap.put("時限",lecture.getPeriod()+"限" );
			reviewMap.put("講義名", lecture.getLectureName());

			JSONObject reviewJson=new JSONObject(reviewMap);
			session.setAttribute("reviewInfo",reviewJson);
			System.out.println(reviewJson);

			//その他情報をセッションに入れる
			session.setAttribute("tempLectureID", lectureID);
			session.setAttribute("tempReviewID",targetReview.getReviewID());
			getServletContext().getRequestDispatcher("/review.jsp").forward(request, response);


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private String AdaptDay(String day){
		String result="";
		switch(day){
		case "monday":
			result="月";
			break;
		case "tuesday":
			result="火";
			break;
		case "wednesday":
			result="水";
			break;
		case "thursday":
			result="木";
			break;
		case "fryday":
			result="金";
			break;
		}
		return result;
	}

}
