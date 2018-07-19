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
@WebServlet("/New_AdminLectureRegisterServlet")
public class New_AdminLectureRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public New_AdminLectureRegisterServlet() {
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

		Lecture Lecture = new Lecture();
		LectureManager mane = new LectureManager();
		RelationUnit RelationUnit = new RelationUnit();
		RelationUnitManager unimane = new RelationUnitManager();
		ProfessorToLecture ptl = new ProfessorToLecture();
		ProfessorToLectureManager promane = new ProfessorToLectureManager();


		HttpSession session = request.getSession();

		//登録されたデータを得る
		Lecture.setLectureID(Integer.parseInt(request.getParameter("授業コード")));
		Lecture.setLectureName(request.getParameter("授業名"));
		Lecture.setGaitoGakki(request.getParameter("該当学期"));
		Lecture.setDay(request.getParameter("曜日"));
		Lecture.setPeriod(Integer.parseInt(NoNullforInt(request.getParameter("時限"))));
		Lecture.setRoom(NoNull(request.getParameter("教室番号")));
		Lecture.setTaniNum(Integer.parseInt(NoNullforInt(request.getParameter("単位数"))));
		Lecture.setPurpose(NoNull(request.getParameter("目的概要")));
		Lecture.setAchieve(NoNull(request.getParameter("達成目標")));
		Lecture.setRelation(NoNull(request.getParameter("関連科目")));
		Lecture.setTerm(NoNull(request.getParameter("履修条件")));
		Lecture.setTextbook(NoNull(request.getParameter("教科書名")));
		Lecture.setHyokahoho(NoNull(request.getParameter("評価方法")));
		Lecture.setKyoikumokuhyo(NoNull(request.getParameter("教育目標との対応")));
		Lecture.setYosyufukusyu(NoNull(request.getParameter("事前事後学習")));
		Lecture.setEmail(NoNull(request.getParameter("メール")));
		Lecture.setSupport(NoNull(request.getParameter("質問")));
		Lecture.setCaution(NoNull(request.getParameter("注意事項")));
		Lecture.setAdvice(NoNull(request.getParameter("助言")));
		Lecture.setType(NoNull(request.getParameter("type")));
		Lecture.setUnit(request.getParameter("unit"));
		RelationUnit.setLectureID(Lecture.getLectureID());
		RelationUnit.setUnitID(request.getParameter("unit"));
	    ptl.setLectureID(Lecture.getLectureID());
	    ptl.setProfessorID(request.getParameter("teacher"));


	    boolean uniresult = true;
		boolean proresult = true;
		boolean result = true;
	    boolean notExist=true;

	    try {
			if(mane.getLecture(Lecture.getLectureID()).getLectureID()!=0){
				notExist=false;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

			if(notExist){
				try {
					result = mane.registetLecture(Lecture);
					uniresult = unimane.registerRelationUnit(RelationUnit);
					proresult = promane.registerPTL(ptl);
				} catch (SQLException e) {
					e.printStackTrace();
				}

				if (result&&proresult&&uniresult) {
					//登録成功したとき
					getServletContext().getRequestDispatcher("/Admin_LectureListServlet").forward(request, response);
				} else {
					//失敗している場合
					System.out.println(result+","+proresult+","+uniresult);
					getServletContext().getRequestDispatcher("/Admin_newRegister.jsp").forward(request, response);
				}
			}else{
				System.out.println("存在する");
				getServletContext().getRequestDispatcher("/Admin_newRegister.jsp").forward(request, response);
			}
	}
	private String NoNull(String str){
		if(str==null){
			return "";
		}
		return str;
	}
	private String NoNullforInt(String str){
		if(str==""){
			return "0";
		}
		return str;
	}

}
