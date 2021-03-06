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
 * Servlet implementation class Admin_reviewList
 */
@WebServlet("/Admin_reviewList")
public class Admin_reviewList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Map<String,Map> lectureMap = new HashMap<String, Map>();
	private static Map<String, Map>lectureReview = new HashMap<String,Map>();
	private static Map<String, String>lectureName = new HashMap<String,String>();


    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_reviewList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReviewManager reviewManager = new ReviewManager();
		ArrayList<Review> result = new ArrayList<Review>();
		HttpSession session = request.getSession();

		int lectureID = Integer.valueOf(request.getParameter("id"));
		Lecture lecture=null;

		try {
			lecture=new LectureManager().getLecture(lectureID);
			result = reviewManager.getReviewList(lectureID); //LectureID 仮置き


		String rev = "rev";
		for(int i = 0; i < result.size(); i++) {
			Map<String,String> reviewDetail = new HashMap<String,String>();
			reviewDetail.put("投稿者", result.get(i).getStudentID());
			reviewDetail.put("投稿内容", result.get(i).getComment());
			reviewDetail.put("id", result.get(i).getReviewID());
			rev = "rev" + Integer.toString(i);
			lectureReview.put(rev,reviewDetail);
		}
		lectureName.put("講義名", lecture.getLectureName());
		lectureMap.put("講義", lectureName);
		lectureMap.put("投稿", lectureReview);
		JSONObject lectureListJson=new JSONObject(lectureMap);
        System.out.println(lectureListJson);
        session.setAttribute("lectureList",lectureListJson);

    	getServletContext().getRequestDispatcher("/Admin_ReviewList.jsp").forward(request, response);

		}catch(SQLException e){
			e.printStackTrace();
		}

	}

}
