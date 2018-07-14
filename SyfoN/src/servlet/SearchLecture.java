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
		professor=professorManager.getProfessor(request.getParameter("ProfessorName"));
		ptlList = ptlManager.findPTLList(professor.getProfessorID());
		for(ProfessorToLecture tempPTL:ptlList){
			lectureList.add(lectureManager.getLecture(tempPTL.getLectureID()));
		}

		//次にLectureに各要素を入力して検索する
		lec.setDay(request.getParameter("Day"));
		lec.setLectureName(request.getParameter("RectureName"));
		lec.setPeriod(Integer.valueOf(request.getParameter("Period")));

		//該当学期のみ変換
		String gaitoGakki=this.AdaptGaitoGakki(request.getParameter("HaitoNen"), request.getParameter("Kaikoki"))
		lec.setGaitoGakki(request.getParameter(""));
		lectureList.addAll(lectureManager.findLecture(lec));

		//Mapに入れていく
		Map<String,String> lectureMap=new HashMap<String,String>();
		for(Lecture l:lectureList){
			lectureMap.put("day", l.getDay());
			lectureMap.put("period",Integer.toString(l.getPeriod()));
			lectureMap.put("gaitgakki", l.getGaitoGakki());
		}
		session.setAttribute("findlecture", lectureList);

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	private String AdaptorGakki(String gaitoGakki){
		String result="";
		switch(gaitoGakki){
		case "zennki1":
			result="1年前期";
			break;
		case "kouki1":
			result="1年後期";
			break;
		case "zennki2":
			result="2年前期";
			break;
		case "kouki2":
			result="2年後期";
			break;
		case "zennki3":
			result="3年前期";
			break;
		case "kouki3":
			result="3年後期";
			break;
		case "zennki4":
			result="4年前期";
			break;
		case "kouki4":
			result="4年後期";
			break;
		}
		return result;
	}
	private String AdaptGaitoGakki(String HaitoNen,String Kaikoki){
		String result="";
		return result;
	}
}

