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
import professor.Professor;
import professor.ProfessorManager;

/**
 * Servlet implementation class Admin_LectureRegisterServlet
 */
@WebServlet("/Admin_LectureEditServlet")
public class Admin_LectureEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Map<String, String> lectureName = new HashMap<String,String>();
	private static Map<String,String> professorList = new HashMap<String,String>();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_LectureEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
		LectureManager lectureManager = new LectureManager();
		ProfessorManager profManager = new ProfessorManager();
		Professor professor = new Professor();
		Lecture result = new Lecture();
		ArrayList<Professor> profList = new ArrayList<Professor>();

		try {
			result = lectureManager.getLecture(334); //講義ID仮置き
			professor = profManager.getProfessor("334");  //教師ID仮置き
			profList = profManager.getAllProfessors();
		}catch(SQLException e){
			e.printStackTrace();
		}

		lectureName.put("授業コード", Integer.toString(result.getLectureID()));
		lectureName.put("授業名", result.getLectureName());
		lectureName.put("担当教員", professor.getProfessorName()); //aaaaaaaaaaaaaa
		lectureName.put("該当学期", result.getGaitoGakki());
		lectureName.put("曜日", result.getDay());
		lectureName.put("時限", Integer.toString(result.getPeriod()));
		lectureName.put("教室番号", result.getRoom());
		lectureName.put("単位数", Integer.toString(result.getTaniNum()));
		lectureName.put("目的概要", result.getPurpose());
		lectureName.put("達成目標", result.getAchieve());
		lectureName.put("関連科目", result.getRelation());
		lectureName.put("履修条件", result.getTerm());
		lectureName.put("教科書名", result.getTextbook());
		lectureName.put("評価方法", result.getHyokahoho());
		lectureName.put("教育目標との対応", result.getKyoikumokuhyo());
		lectureName.put("事前事後学習", result.getYosyufukusyu());
		lectureName.put("メール", result.getEmail());
		lectureName.put("質問", result.getSupport());
		lectureName.put("注意事項", result.getCaution());
		lectureName.put("助言", result.getAdvice());
		lectureName.put("ユニット", result.getUnit());
		lectureName.put("種類", result.getType());

		JSONObject registLectureJson=new JSONObject(lectureName);
        System.out.println(registLectureJson);
        session.setAttribute("registLecture",registLectureJson);

        //ここまで講義
        //ここから教師一覧
        for(Professor profResult: profList) {
        	professorList.put("担当教員",profResult.getProfessorName());
        }
        JSONObject professorListJson=new JSONObject(professorList);
        System.out.println(professorListJson);
        session.setAttribute("professorList",professorListJson);



	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
