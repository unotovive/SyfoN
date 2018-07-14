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
import professorToLecture.ProfessorToLecture;
import professorToLecture.ProfessorToLectureManager;
import relationUnit.RelationUnit;
import relationUnit.RelationUnitManager;

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
		Lecture editlecture = new Lecture();
		RelationUnit RelationUnit = new RelationUnit();
		RelationUnitManager unimane = new RelationUnitManager();
		ProfessorToLectureManager promane = new ProfessorToLectureManager();
		ArrayList<Professor> profList = new ArrayList<Professor>();
		ProfessorToLecture ptl = new ProfessorToLecture();

		String strageID = Integer.toString(editlecture.getLectureID());

        //ユニットIDを取得
		RelationUnit strageUnit = new RelationUnit();
		Professor profbyname = new Professor();
		try {
			 strageUnit = unimane.getRelationUnit(editlecture.getLectureID());
			 ptl = promane.getPTL(editlecture.getLectureID());
			 profbyname = profManager.getProfessor(ptl.getProfessorID());
		} catch (SQLException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}
		String unitID = strageUnit.getUnitID();
		String profname = profbyname.getProfessorName();


		try {
			editlecture = (Lecture) session.getAttribute("editresult");
			professor = profManager.getProfessor(Integer.toString(editlecture.getLectureID())); //教師ID仮置き
			profList = profManager.getAllProfessors();
		}catch(SQLException e){
			e.printStackTrace();
		}

		lectureName.put("授業コード", strageID);
		lectureName.put("授業名", editlecture.getLectureName());
		lectureName.put("担当教員", profname); //aaaaaaaaaaaaaa
		lectureName.put("該当学期", editlecture.getGaitoGakki());
		lectureName.put("曜日", editlecture.getDay());
		lectureName.put("時限", Integer.toString(editlecture.getPeriod()));
		lectureName.put("教室番号", editlecture.getRoom());
		lectureName.put("単位数", Integer.toString(editlecture.getTaniNum()));
		lectureName.put("目的概要", editlecture.getPurpose());
		lectureName.put("達成目標", editlecture.getAchieve());
		lectureName.put("関連科目", editlecture.getRelation());
		lectureName.put("履修条件", editlecture.getTerm());
		lectureName.put("教科書名", editlecture.getTextbook());
		lectureName.put("評価方法", editlecture.getHyokahoho());
		lectureName.put("教育目標との対応", editlecture.getKyoikumokuhyo());
		lectureName.put("事前事後学習", editlecture.getYosyufukusyu());
		lectureName.put("メール", editlecture.getEmail());
		lectureName.put("質問", editlecture.getSupport());
		lectureName.put("注意事項", editlecture.getCaution());
		lectureName.put("助言", editlecture.getAdvice());
		lectureName.put("ユニット", unitID);
		lectureName.put("種類", editlecture.getType());

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
		Lecture Lecture = new Lecture();
		LectureManager mane = new LectureManager();
		RelationUnit RelationUnit = new RelationUnit();
		RelationUnitManager unimane = new RelationUnitManager();
		ProfessorToLecture ptl = new ProfessorToLecture();
		ProfessorToLectureManager promane = new ProfessorToLectureManager();

		boolean result = false;
		boolean uniresult = false;
		boolean proresult = false;
		HttpSession session = request.getSession();

		int strageID = (Integer.parseInt(request.getParameter("授業コード")));


		Lecture.setLectureID(strageID);
		Lecture.setLectureName(request.getParameter("授業名"));
		Lecture.setGaitoGakki(request.getParameter("該当楽器i"));
		Lecture.setDay(request.getParameter("曜日"));
		Lecture.setPeriod(Integer.parseInt(request.getParameter("時限")));
		Lecture.setRoom(request.getParameter("教室番号"));
		Lecture.setTaniNum(Integer.parseInt(request.getParameter("単位数")));
		Lecture.setPurpose(request.getParameter("目的概要"));
		Lecture.setAchieve(request.getParameter("達成目標"));
		Lecture.setRelation(request.getParameter("関連科目"));
		Lecture.setTerm(request.getParameter("履修条件"));
		Lecture.setTextbook(request.getParameter("教科書名"));
		Lecture.setHyokahoho(request.getParameter("評価方法"));
		Lecture.setKyoikumokuhyo(request.getParameter("教育目標との対応"));
		Lecture.setYosyufukusyu(request.getParameter("事前事後学習"));
		Lecture.setEmail(request.getParameter("メール"));
		Lecture.setSupport(request.getParameter("質問"));
		Lecture.setCaution(request.getParameter("注意事項"));
		Lecture.setAdvice(request.getParameter("助言"));
		Lecture.setType(request.getParameter("種類"));
		RelationUnit.setLectureID(strageID);
		RelationUnit.setUnitID(request.getParameter("ユニット"));
	    ptl.setLectureID(strageID);
	    ptl.setProfessorID(request.getParameter("担当教員"));

		if(session.getAttribute("editresult")!=null){      //編集
	    try {
			result = mane.editLecture(Lecture);
			uniresult = unimane.editRelationUnit(RelationUnit);
			proresult = promane.updatePTL(ptl);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}else{            //新規登録
		try {
			result = mane.registetLecture(Lecture);
			uniresult = unimane.registerRelationUnit(RelationUnit);
			proresult = promane.registerPTL(ptl);
		} catch (SQLException e) {
			e.printStackTrace();
		}


		session.setAttribute("adminlec", result);

		if (result) {
			// データベースを更新成功したとき
			getServletContext().getRequestDispatcher("/Admin_LectureList.jsp").forward(request, response);
		} else {
			//失敗している場合
			getServletContext().getRequestDispatcher("/Admin_Register.jsp").forward(request, response);
			}
	}
	}
	}

