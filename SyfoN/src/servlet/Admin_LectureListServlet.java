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

/**
 * Servlet implementation class Admin_LectureListServlet
 */
@WebServlet("/Admin_LectureListServlet")
public class Admin_LectureListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Map<String , Map> lectureListMap = new HashMap<String , Map>();
	private static Map<String , Map> lecture = new HashMap<String , Map>();




    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_LectureListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		Lecture Lecture = new Lecture();
		LectureManager mane = new LectureManager();
		HttpSession session = request.getSession();


		ArrayList<Lecture> result = new ArrayList<Lecture>();

		try {
			result = mane.getAllLecture();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("d");
		String lect = "lect";
		for(int i = 0; i < result.size(); i++) {
			lectureListMap = new HashMap<String, Map>();
			Map<String , String> LectureDetail = new HashMap<String , String>();
			LectureDetail.put("開講曜日",result.get(i).getDay());
			LectureDetail.put("授業コード",Integer.toString(result.get(i).getLectureID()));
			LectureDetail.put("講義名",result.get(i).getLectureName());
			LectureDetail.put("教員名",result.get(i).getProfessorID()); //かりおき
			LectureDetail.put("教室",result.get(i).getRoom());
			lect = "lect" + Integer.toString(i);
			lecture.put(lect, LectureDetail);
		}
		lectureListMap.put("lectureList", lecture);

		JSONObject lectureListJson=new JSONObject(lectureListMap);
        System.out.println(lectureListJson);
        session.setAttribute("lectureList",lectureListJson);

//		HttpSession session = request.getSession();
//		session.setAttribute("adminlec", result);

//		getServletContext().getRequestDispatcher("/top.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
