package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import Lecture.Lecture;
import Lecture.LectureManager;
import professor.Professor;
import professor.ProfessorManager;
import professorToLecture.ProfessorToLecture;
import professorToLecture.ProfessorToLectureManager;

/**
 * Servlet implementation class SearchLecture
 */
@WebServlet("/SearchLecture")
public class SearchLecture extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchLecture() {
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
		request.setCharacterEncoding("UTF-8");

	    try {

		HttpSession session = request.getSession();

		Lecture lec = new Lecture();
	    LectureManager lectureManager= new LectureManager();
		Set<Lecture> lectureList=new HashSet<Lecture>();

		Professor professor=new Professor();
		ProfessorManager professorManager=new ProfessorManager();
		ProfessorToLectureManager ptlManager=new ProfessorToLectureManager();
		ArrayList<ProfessorToLecture>  ptlList = new ArrayList<ProfessorToLecture>();

		//まず、教師名で講義を得る
		System.out.println(request.getParameter("professorName"));
		professor=professorManager.getProfessor(request.getParameter("professorName"));
		ptlList = ptlManager.findPTLList(professor.getProfessorID());
		for(ProfessorToLecture tempPTL:ptlList){
			lectureList.add(lectureManager.getLecture(tempPTL.getLectureID()));
		}

		//次にLectureに各要素を入力して検索する
		lec.setDay(request.getParameter("day"));
		lec.setLectureName(request.getParameter("lectureName"));

		System.out.println(lectureManager.findLecture(lec).get(0).getDay());

		//該当学期のみ変換
		String gaitoGakki=this.AdaptGaitoGakki(request.getParameter("haitoNen"), request.getParameter("kaikoki"));
		lec.setGaitoGakki(gaitoGakki);

		//Lectureを取得
		lectureList.addAll(lectureManager.findLecture(lec));

		//Mapに入れていく
		Map<String,Map> lectureMap=new HashMap<String,Map>();
		Map<String,Map> lectureListMap=new HashMap<String,Map>();
		int count=1;
		for(Lecture l:lectureList){
			Map<String,String> lectureDataMap=new HashMap<String,String>();
			lectureDataMap.put("開講日", l.getDay());
			lectureDataMap.put("教科名", l.getLectureName());
			lectureDataMap.put("時限",Integer.toString(l.getPeriod())+"限");
			lectureDataMap.put("配当年学期", this.AdaptGakki(l.getGaitoGakki()));
			//教授名を取得して、入れる
			String professorName=professorManager.getProfessor(
					ptlManager.getPTL(l.getLectureID()).getProfessorID()).getProfessorName();
			lectureDataMap.put("教授名",professorName);
			lectureListMap.put("lecture"+Integer.toString(count),lectureDataMap);

			count++;
		}
		lectureMap.put("lectureList",lectureListMap);

		JSONObject lectureListJson=new JSONObject(lectureMap);
		session.setAttribute("lectureList",lectureListJson );
		System.out.println(lectureListJson);
		getServletContext().getRequestDispatcher("/Search_Lecture.jsp").forward(request, response);

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	private String AdaptGakki(String gaitoGakki){
		String result="";
		switch(gaitoGakki){
		case "zennki1":
			result="1年生前期";
			break;
		case "kouki1":
			result="1年生後期";
			break;
		case "zennki2":
			result="2年生前期";
			break;
		case "kouki2":
			result="2年生後期";
			break;
		case "zennki3":
			result="3年生前期";
			break;
		case "kouki3":
			result="3年生後期";
			break;
		case "zennki4":
			result="4年生前期";
			break;
		case "kouki4":
			result="4年生後期";
			break;
		}
		return result;
	}
	private String AdaptGaitoGakki(String HaitoNen,String Kaikoki){
		String result=HaitoNen+Kaikoki;
		switch(result){
		case "1年前期":
			result="zenki1";
			break;
		case"1年後期":
			result="kouki1";
			break;
		case"2年前期":
			result="zenki2";
			break;
		case"2年後期":
			result="kouki2";
			break;
		case "3年前期":
			result="zenki3";
			break;
		case "3年後期":
			result="kouki3";
			break;
		case "4年前期":
			result="zenki4";
			break;
		case "4年後期":
			result="kouki4";
			break;
		}
		return result;
	}

	public String AdaptDay(String day){
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

