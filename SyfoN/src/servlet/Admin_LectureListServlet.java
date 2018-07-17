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

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//講義リストに行く

		LectureManager mane = new LectureManager();
		ProfessorManager professorManager=new ProfessorManager();
		ProfessorToLectureManager ptlManager=new ProfessorToLectureManager();
		HttpSession session = request.getSession();

		ArrayList<Lecture> result = new ArrayList<Lecture>();

		try {
			lecture = new HashMap<String , Map>();
			lectureListMap=new HashMap<String,Map>();
			System.out.println("リストの始まり");
			result = mane.getAllLecture();
			System.out.println(result.size());

			String lect = "lect";
			for(int i = 0; i < result.size(); i++) {
				//教員IDを得る
				String professorID=ptlManager.getPTL(result.get(i).getLectureID()).getProfessorID();

				//講義情報をMapに入れる
				Map<String , String> LectureDetail = new HashMap<String , String>();
				LectureDetail.put("開講曜日",this.AdaptDay(result.get(i).getDay()));
				LectureDetail.put("授業コード",Integer.toString(result.get(i).getLectureID()));
				LectureDetail.put("講義名",result.get(i).getLectureName());
				LectureDetail.put("教員名",professorManager.getProfessor(professorID).getProfessorName());
				LectureDetail.put("教室",result.get(i).getRoom());
				lect = "lect" + Integer.toString(i);
				lecture.put(lect, LectureDetail);
			}
			lectureListMap.put("lectureList", lecture);
			JSONObject lectureListJson=new JSONObject(lectureListMap);
	        System.out.println(lectureListJson);
	        session.setAttribute("lectureList",lectureListJson);

	        System.out.print("到達");
			getServletContext().getRequestDispatcher("/Admin_LectureList.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
	}
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

//		Lecture Lecture = new Lecture();
//		LectureManager mane = new LectureManager();
//		Lecture editresult = new Lecture();
//		boolean remresult = false;
//		Lecture.setLectureID((Integer.parseInt(request.getParameter("id"))));
//
//		HttpSession session = request.getSession();
//
//
//		if(request.getParameter("AddLecture")!= null){    //新規登録を押された場合
//			session.removeAttribute("editresult");    //サーバーに残っている授業コードを破棄
//			getServletContext().getRequestDispatcher("/Admin_RegisterLecture.jsp").forward(request, response);
//
//
//		}else if(request.getParameter("EditLecture")!=null){    //編集を押された場合
//			try {
//				editresult = mane.getLecture(Lecture.getLectureID());
//				session.setAttribute("editresult",editresult);  //押された講義の授業コードを保持
//			} catch (SQLException e) {
//				// TODO 自動生成された catch ブロック
//				e.printStackTrace();
//			}
//			getServletContext().getRequestDispatcher("/Admin_RegisterLecture.jsp").forward(request, response);
//
//
//
//		}else if(request.getParameter("removelecture")!=null){       //削除を押された場合
//			try {
//
//				remresult = mane.removeLecture(Lecture);
//			} catch (SQLException e) {
//				// TODO 自動生成された catch ブロック
//				e.printStackTrace();
//			}
//			getServletContext().getRequestDispatcher("/Admin_LectureList.jsp").forward(request, response);
//		}else if(request.getParameter("reviewlecture")!=null){    //講義の評価一覧へ
//			try {
//				editresult = mane.getLecture(Lecture.getLectureID());
//			} catch (SQLException e) {
//				// TODO 自動生成された catch ブロック
//				e.printStackTrace();
//			}
//			getServletContext().getRequestDispatcher("/Admin_ReviewList.jsp").forward(request, response);
//		}
		this.doGet(request, response);
	}

	private String AdaptDay(String day){
		String result="";
		switch(day){
		case "monday":
			result="月曜日";
			break;
		case "tuesday":
			result="火曜日";
			break;
		case "wednesday":
			result="水曜日";
			break;
		case "thursday":
			result="木曜日";
			break;
		case "fryday":
			result="金曜日";
			break;
		default:
			result="謎";
			break;
		}
		return result;
	}

}
