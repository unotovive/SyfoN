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
import MustTani.MustTani;
import MustTani.MustTaniManager;
import courseLecture.CourseLecture;
import courseLecture.CourseLectureManager;
import timetable.TimeTable;
import timetable.TimeTableManager;
import unit.Unit;
import unit.UnitManager;

/**
 * Servlet implementation class TimeTableServ
 */
@WebServlet("/TimeTableServ")
public class TimeTableServ extends HttpServlet {
	private static Map<String,Map> myClasses=new HashMap<String,Map>();
	private static Map<String,Map> semester=new HashMap<String,Map>();
	private static Map<String,Map> day=new HashMap<String,Map>();
	private static Map<String,Map> period=new HashMap<String,Map>();



	private static Map<String,String> mustTaniDataMap;
	private static Map<String,Map> variousMustTani=new HashMap<String,Map>();
	private static Map<String,Map> mustTaniMap=new HashMap<String,Map>();

	private static Map<String,String> unitDataMap;
	private static Map<String,Map> variousUnit=new HashMap<String,Map>();
	private static Map<String,Map> unitMap=new HashMap<String,Map>();

	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeTableServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		TimeTableManager timeTableManager = new TimeTableManager();
	    CourseLectureManager courseLectureManager = new CourseLectureManager();
		LectureManager lectureManager=new LectureManager();
	    ArrayList<TimeTable>  timeTableList = new ArrayList<TimeTable>();
	    ArrayList<CourseLecture>   courseLectureList = new ArrayList<CourseLecture>();
	    ArrayList<Integer> lectureIdList=new ArrayList<Integer>();
	    ArrayList<Lecture> lectureList =new ArrayList<Lecture>();
	    HttpSession session=request.getSession();

	  //時間割IDを取得(8こ）
		try {
			timeTableList = timeTableManager.getTimeTableList(request.getParameter("studentID"));
		} catch (SQLException e) {
			e.printStackTrace();
		}


		//HttpSession session = request.getSession();
		//session.setAttribute("timetableID", result);

		//時間割IDからコースレクチャーを取得
		try{
		for(int i=0;i<timeTableList.size();i++){
			courseLectureList.addAll(courseLectureManager.getCourseLectureList(timeTableList.get(i).getTimeTableID())) ;
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}

		//コースレクチャーから講義IDを取得
		for(int i=0;i<courseLectureList.size();i++){
			int lectureId=courseLectureList.get(i).getLectureID();
			lectureIdList.add(lectureId);
		}

		//講義IDから講義を得る
		try {
		for(int i=0;i<lectureIdList.size();i++){
			Lecture lc;
			lc = lectureManager.getLecture(lectureIdList.get(i));
			lectureList.add(lc);
		}
		}catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		System.out.println("oi!");

		String[] semesters={"zenki1","kouki1","zenki2","kouki2","zenki3","kouki3","zenki4","kouki4"};
		String[] days={"monday","tuesday","wednesday","thursday","flyday"};
		String[] periods={"period1","period2","period3","period4","period5"};

		for(int i=0;i<semesters.length;i++){
			for(int p=0;p<days.length;p++){
				for(int n=0;n<periods.length;n++){
					Lecture lc=null;
					for(Lecture tempLect:lectureList){
						if(tempLect.getGaitoGakki().equals(semesters[i])
								&&tempLect.getDay().equals(days[p])
								&&Integer.toString(tempLect.getPeriod()).equals(periods[n])){
							lc=tempLect;
						}
					}
					Map<String,String> lectureDataMap=new HashMap<String,String>();;
					//該当の講義が存在すれば
					if(lc!=null){

						lectureDataMap.put("taninum",Integer.toString(lc.getTaniNum()) );
						lectureDataMap.put("name",lc.getLectureName() );
						lectureDataMap.put("lectureid",Integer.toString(lc.getLectureID()) );
						lectureDataMap.put("room",lc.getRoom() );
						lectureDataMap.put("type",lc.getType() );
						lectureDataMap.put("unit",lc.getUnit());
					}else{
						lectureDataMap.put("taninum",null);
						lectureDataMap.put("name",null );
						lectureDataMap.put("lectureid",null );
						lectureDataMap.put("room",null);
						lectureDataMap.put("type",null );
						lectureDataMap.put("unit",null);
					}
					period.put(periods[n], lectureDataMap);
				}
				day.put(days[p],day);
			}
			semester.put(semesters[i], semester);
		}
		myClasses.put("my-Classes", semester);
		System.out.println("oi!!");
		JSONObject lectureListJson=new JSONObject(lectureList);
		session.setAttribute("lectureList",lectureListJson);

		//ここまで、講義情報
/*------------------------------------------------------------------------*/
		//ここから、必要単位
		MustTaniManager mustTaniManager = new MustTaniManager();
		MustTani mustTani=mustTaniManager.getMustTani();

		this.initMustTani();
		mustTaniDataMap.put("num",Integer.toString(mustTani.getAllMustTani()) );
		mustTaniDataMap.put("name","卒業" );
		variousMustTani.put("All",mustTaniDataMap);

		this.initMustTani();
		mustTaniDataMap.put("num",Integer.toString(mustTani.getElectMustTani() ));
		mustTaniDataMap.put("name","選択" );
		variousMustTani.put("Elect",mustTaniDataMap);

		this.initMustTani();
		mustTaniDataMap.put("num",Integer.toString(mustTani.getEnglishMustTani() ));
		mustTaniDataMap.put("name","英語" );
		variousMustTani.put("English",mustTaniDataMap);

		this.initMustTani();
		mustTaniDataMap.put("num",Integer.toString(mustTani.getJinkaMustTani() ));
		mustTaniDataMap.put("name","人科" );
		variousMustTani.put("Jinka",mustTaniDataMap);

		this.initMustTani();
		mustTaniDataMap.put("num",Integer.toString(mustTani.getJinkaMustTani()) );
		mustTaniDataMap.put("name","必修" );
		variousMustTani.put("Hissyu",mustTaniDataMap);

		mustTaniMap.put("mustTani", variousMustTani);
		JSONObject mustTaniJson=new JSONObject(mustTaniMap);
		session.setAttribute("mustTani",mustTaniJson);

		//ここまで、必要単位
/*------------------------------------------------------------------------*/
		//ここからユニット

		UnitManager unitManager=new UnitManager();
		ArrayList<Unit> unitList=unitManager.getAllUnit();

		int count=0;
		for(Unit u:unitList){
			this.initUnit();
			unitDataMap.put("id",u.getUnitID());
			unitDataMap.put("name", u.getUnitName());
			unitDataMap.put("taninum", Integer.toString(u.getUnitTani()));
			variousUnit.put("unit"+count, unitDataMap);
		}

		unitMap.put("units", variousUnit);
		JSONObject unitListJson=new JSONObject(unitMap);
		//String unitListJson=mapper.writeValueAsString(unitMap);
		session.setAttribute("unit",unitListJson);

		getServletContext().getRequestDispatcher("/top.jsp").forward(request, response);
	}
	//

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void initMustTani(){
		mustTaniDataMap =new HashMap<String,String>();
	}

	private void initUnit(){
		unitDataMap =new HashMap<String,String>();
	}

}
