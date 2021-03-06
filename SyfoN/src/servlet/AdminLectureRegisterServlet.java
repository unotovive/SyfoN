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
		request.setCharacterEncoding("UTF-8");

		Lecture Lecture = new Lecture();
		LectureManager mane = new LectureManager();
		RelationUnit RelationUnit = new RelationUnit();
		RelationUnitManager unimane = new RelationUnitManager();
		ProfessorToLecture ptl = new ProfessorToLecture();
		ProfessorToLectureManager promane = new ProfessorToLectureManager();


		HttpSession session = request.getSession();

		//古いIDをもらう
		System.out.println(request.getParameter("teacher")+","+request.getParameter("unit")+","+request.getParameter("曜日"));
		int strageID = ((int)session.getAttribute("oldID"));

		//登録されたデータを得る
		Lecture.setLectureID(Integer.parseInt(request.getParameter("授業コード")));
		Lecture.setLectureName(request.getParameter("授業名"));
		Lecture.setGaitoGakki(request.getParameter("該当学期"));
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
		RelationUnit.setLectureID(Lecture.getLectureID());
		RelationUnit.setUnitID(request.getParameter("unit"));
	    ptl.setLectureID(Lecture.getLectureID());
	    ptl.setProfessorID(request.getParameter("teacher"));


	    boolean oldResult=true;
	    boolean uniresult = true;
		boolean proresult = true;
		boolean result = false;
	    boolean isEquarls=true;
	    //授業コードが違う場合、古いデータを削除
		if(strageID!=Lecture.getLectureID()){      //編集
			try {
				isEquarls=false;
				Lecture oldLecture = mane.getLecture(strageID);
				RelationUnit oldru=unimane.getRelationUnit(strageID);
				uniresult=unimane.removeRelationUnit(oldru);
				proresult=promane.removePTLOfLecture(strageID);
				oldResult=mane.removeLecture(oldLecture);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		if(oldResult&&uniresult&&proresult){
			if(isEquarls){
				try {
					uniresult = unimane.editRelationUnit(RelationUnit);
					proresult = promane.updatePTL(ptl);
					result = mane.editLecture(Lecture);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}else{
				try {
					result = mane.registetLecture(Lecture);
					uniresult = unimane.registerRelationUnit(RelationUnit);
					proresult = promane.registerPTL(ptl);

				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			if (result&&proresult&&uniresult) {
				// データベースを更新成功したとき
				getServletContext().getRequestDispatcher("/Admin_LectureListServlet").forward(request, response);
			} else {
				//失敗している場合
				getServletContext().getRequestDispatcher("/Admin_Register.jsp").forward(request, response);
			}
		}else{
			System.out.print(oldResult+","+uniresult+","+proresult);
			System.out.println("古いデータの削除に失敗");
			getServletContext().getRequestDispatcher("/Admin_Register.jsp").forward(request, response);
		}
	}

}
