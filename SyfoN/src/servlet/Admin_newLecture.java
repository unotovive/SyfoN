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
import unit.Unit;
import unit.UnitManager;

/**
 * Servlet implementation class Admin_newLecture
 */
@WebServlet("/Admin_newLecture")
public class Admin_newLecture extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Map<String, String> lectureName = new HashMap<String,String>();
	private static Map<String,Map> professorList = new HashMap<String,Map>();
	private static Map<String,Map> unitList=new HashMap<String,Map>();

	private static Map<String,String> mustTaniDataMap;
	private static Map<String,Map> variousMustTani=new HashMap<String,Map>();
	private static Map<String,Map> mustTaniMap=new HashMap<String,Map>();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_newLecture() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		LectureManager lectureManager = new LectureManager();
		ProfessorManager profManager = new ProfessorManager();
		Professor professor = new Professor();
		Lecture editLecture = new Lecture();
		RelationUnit RelationUnit = new RelationUnit();
		RelationUnitManager unimane = new RelationUnitManager();
		ProfessorToLectureManager promane = new ProfessorToLectureManager();
		ArrayList<Professor> profList = new ArrayList<Professor>();
		ProfessorToLecture ptl = new ProfessorToLecture();



		int editLectureID=editLecture.getLectureID();

		//ユニットIDを取得
		RelationUnit strageUnit = new RelationUnit();
		Professor profbyname = new Professor();
		ArrayList<Unit> allUnitList=new ArrayList<Unit>();
		try {
			strageUnit = unimane.getRelationUnit(editLecture.getLectureID());
			ptl = promane.getPTL(editLecture.getLectureID());
			profbyname = profManager.getProfessor(ptl.getProfessorID());
			allUnitList=new UnitManager().getAllUnit();
		} catch (SQLException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}
		String unitID = strageUnit.getUnitID();
		String profname = profbyname.getProfessorName();


		try {
			professor = profManager.getProfessor(Integer.toString(editLecture.getLectureID())); //教師ID仮置き
			profList = profManager.getAllProfessors();
		}catch(SQLException e){
			e.printStackTrace();
		}

//		lectureName.put("授業コード", "");
//		lectureName.put("授業名", this.NoNull(editLecture.getLectureName()));
//		lectureName.put("担当教員", this.NoNull(professor.getProfessorID()));
//		lectureName.put("該当学期", this.NoNull(editLecture.getGaitoGakki()));
//		lectureName.put("曜日", this.NoNull(editLecture.getDay()));
//		lectureName.put("時限", this.NoNull(Integer.toString(editLecture.getPeriod())));
//		lectureName.put("教室番号", this.NoNull(editLecture.getRoom()));
//		lectureName.put("単位数", this.NoNull(Integer.toString(editLecture.getTaniNum())));
//		lectureName.put("目的概要", this.NoNull(editLecture.getPurpose()));
//		lectureName.put("達成目標", this.NoNull(editLecture.getAchieve()));
//		lectureName.put("関連科目", this.NoNull(editLecture.getRelation()));
//		lectureName.put("履修条件", this.NoNull(editLecture.getTerm()));
//		lectureName.put("教科書名", this.NoNull(editLecture.getTextbook()));
//		lectureName.put("評価方法", this.NoNull(editLecture.getHyokahoho()));
//		lectureName.put("教育目標との対応", this.NoNull(editLecture.getKyoikumokuhyo()));
//		lectureName.put("事前事後学習", this.NoNull(editLecture.getYosyufukusyu()));
//		lectureName.put("メール", this.NoNull(editLecture.getEmail()));
//		lectureName.put("質問", this.NoNull(editLecture.getSupport()));
//		lectureName.put("注意事項", this.NoNull(editLecture.getCaution()));
//		lectureName.put("助言", this.NoNull(editLecture.getAdvice()));
//		lectureName.put("ユニット", this.NoNull(editLecture.getUnit()));
//		lectureName.put("種類", this.NoNull(editLecture.getType()));

		lectureName.put("授業コード", "");
		lectureName.put("授業名", "");
		lectureName.put("担当教員", "");
		lectureName.put("該当学期", "");
		lectureName.put("曜日", "");
		lectureName.put("時限", "");
		lectureName.put("教室番号", "");
		lectureName.put("単位数", "");
		lectureName.put("目的概要", "");
		lectureName.put("達成目標", "");
		lectureName.put("関連科目", "");
		lectureName.put("履修条件", "");
		lectureName.put("教科書名", "");
		lectureName.put("評価方法", "");
		lectureName.put("教育目標との対応", "");
		lectureName.put("事前事後学習", "");
		lectureName.put("メール", "");
		lectureName.put("質問", "");
		lectureName.put("注意事項", "");
		lectureName.put("助言", "");
		lectureName.put("ユニット", "");
		lectureName.put("種類", "");

		JSONObject registLectureJson=new JSONObject(lectureName);
		System.out.println(registLectureJson);
		session.setAttribute("registLecture",registLectureJson);

		//ここまで講義
		//ここから教師一覧
		int count=0;
		for(Professor profResult: profList) {
			Map<String,String> professorMap=new HashMap<String,String>();
			professorMap.put("名前", profResult.getProfessorName());
			professorMap.put("id", profResult.getProfessorID());
			professorList.put("教員"+Integer.toString(count),professorMap);
			count++;
		}
		JSONObject professorListJson=new JSONObject(professorList);
		System.out.println(professorListJson);
		session.setAttribute("professorList",professorListJson);
		//ここまで教師
		//ここからユニット
		count=0;
		for(Unit unit:allUnitList){
			Map<String,String> unitMap=new HashMap<String,String>();
			unitMap.put("name",unit.getUnitName());
			unitMap.put("id",unit.getUnitID());
			unitList.put("unit"+Integer.toString(count),unitMap);
			count++;
		}
		JSONObject unitListJson=new JSONObject(unitList);
		System.out.println(unitListJson);
		session.setAttribute("unitList", unitListJson);


		getServletContext().getRequestDispatcher("/Admin_newRegister.jsp").forward(request, response);
	}
	private String NoNull(String str){
		if(str==null){
			return "";
		}
		return str;

	}

	private void initMustTani(){
		mustTaniDataMap =new HashMap<String,String>();
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
