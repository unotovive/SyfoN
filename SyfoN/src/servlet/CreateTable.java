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
import courseLecture.CourseLecture;
import courseLecture.CourseLectureManager;
import timetable.TimeTable;
import timetable.TimeTableManager;

/**
 * Servlet implementation class CreateTable
 */
@WebServlet("/CreateTable")
public class CreateTable extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTable() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//テスト用
		HttpSession session = request.getSession();
		session.setAttribute("studentID", "16fi888");
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String semester =request.getParameter("semester");
		//テスト用
		String semester="zenki1";
		try {
	    ArrayList<TimeTable> timeTableList = new ArrayList<TimeTable>();
		ArrayList<Lecture> gakkiLectureList=new ArrayList<Lecture>();
	    ArrayList<Lecture> coursingLectureList=new ArrayList<Lecture>();
		LectureManager lectureManager=new LectureManager();
		TimeTableManager timeTableManager = new TimeTableManager();
		TimeTable timeTable=null;

		HttpSession session = request.getSession();
		String studentID=(String)session.getAttribute("studentID");

		//学生の時間割8つ
		timeTableList = timeTableManager.getTimeTableList(studentID);
		//該当学期の時間割
		for(TimeTable tempTimeTable:timeTableList){
			if(tempTimeTable.getTimeSemester().equals(semester))
				timeTable=tempTimeTable;
		}
		System.out.println(semester);
		if(timeTable==null)
			System.out.print("時間割がない！");


		//全ての講義を得た後、該当学期の講義を抽出する
		ArrayList<Lecture> allLectureList=lectureManager.getAllLecture();
		for(Lecture lc:allLectureList){
			if(lc.getGaitoGakki().equals(semester)){
				gakkiLectureList.add(lc);
			}
		}


		CourseLectureManager courseLectureManager=new CourseLectureManager();
		ArrayList<CourseLecture> courseLectureList=courseLectureManager.getCourseLectureList(timeTable.getTimeTableID());
		for(CourseLecture tempCL:courseLectureList){
			Lecture tempLecture=lectureManager.getLecture(tempCL.getLectureID());
			coursingLectureList.add(tempLecture);
		}

		String[] days={"monday","tuesday","wednesday","thursday","fryday"};
		String[] periods={"1","2","3","4","5"};

		Map<String,Map> myClassesMap=new HashMap<String,Map>();
		Map<String,Map> semesterMap=new HashMap<String,Map>();
		Map<String,Map> dayMap=new HashMap<String,Map>();
		Map<String,Map> periodMap=new HashMap<String,Map>();
		Map<String,Map> lectureListMap=new HashMap<String,Map>();
		Map<String,String> lectureDataMap=new HashMap<String,String>();


		for(int p=0;p<days.length;p++){
			periodMap=new HashMap<String,Map>();
			for(int n=0;n<periods.length;n++){

				ArrayList<Lecture> tempLectureList=new ArrayList<Lecture>();
				//全ての講義の中から該当の講義を見つける
				for(Lecture tempLect:gakkiLectureList){
//					System.out.println(tempLect.getGaitoGakki()+","+semesters[i]+","+tempLect.getDay()+","+days[p]+","+Integer.toString(tempLect.getPeriod())+","+periods[n]);
					if(tempLect.getDay().equals(days[p])
						&&Integer.toString(tempLect.getPeriod()).equals(periods[n]))
					{
						tempLectureList.add(tempLect);
					}
				}

				//該当の講義が1つ以上存在すれば
				if(tempLectureList.size()>0){
					int count=1;
					for(Lecture lc:tempLectureList){
						lectureDataMap=new HashMap<String,String>();

						lectureDataMap.put("taninum",Integer.toString(lc.getTaniNum()) );
						lectureDataMap.put("name",lc.getLectureName() );
						lectureDataMap.put("lectureid",Integer.toString(lc.getLectureID()) );
						lectureDataMap.put("room",lc.getRoom() );
						lectureDataMap.put("type",lc.getType() );
						lectureDataMap.put("unit",lc.getUnit());
						if(coursingLectureList.contains(lc)){
							lectureDataMap.put("course", "1");
						}else{
							lectureDataMap.put("course", "0");
						}

						lectureListMap.put("lecture"+Integer.toString(count),lectureDataMap );
						count++;
					}
				}
				periodMap.put("period"+periods[n], lectureDataMap);
			}
			dayMap.put(days[p],periodMap);
		}
		myClassesMap.put("table", dayMap);
		JSONObject myClassesJson = new JSONObject(myClassesMap);
		System.out.println(myClassesJson);
		session.setAttribute("lectureList",myClassesJson);

		getServletContext().getRequestDispatcher("/create.jsp").forward(request, response);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}

}
