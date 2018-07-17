package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Lecture.Lecture;
import Lecture.LectureManager;
import professorToLecture.ProfessorToLecture;
import professorToLecture.ProfessorToLectureManager;
import relationUnit.RelationUnit;
import relationUnit.RelationUnitManager;

/**
 * Servlet implementation class AdminLectureRegisterServlet
 */
@WebServlet("/AdminLectureRegisterServlet")
public class AdminLectureRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLectureRegisterServlet() {
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