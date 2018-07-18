
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
//		HttpSession session = request.getSession();
//		session.setAttribute("studentID", "16fi888");
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
		HttpSession session = request.getSession();

		LectureManager lectureManager=new LectureManager();
		String studentID=(String)session.getAttribute("studentID");

		//現在履修中の講義を得る
		Map<String,Map> coursingLectureMap=(Map<String,Map>)session.getAttribute("tableMap");

		//全ての講義を得る
		ArrayList<Lecture> allLectureList=lectureManager.getAllLecture();



		String[] semesters={"zenki1","kouki1","zenki2","kouki2","zenki3","kouki3","zenki4","kouki4"};
		String[] days={"monday","tuesday","wednesday","thursday","fryday"};
		String[] periods={"1","2","3","4","5"};

		Map<String,Map> lectureListMap=new HashMap<String,Map>();
		Map<String,String> lectureDataMap=new HashMap<String,String>();
		Map<String,Map<String,Map<String,Map>>> table=coursingLectureMap.get("table");

		for(int i=0;i<semesters.length;i++){
			for(int p=0;p<days.length;p++){
				for(int n=0;n<periods.length;n++){
					ArrayList<Lecture> tempLectureList=new ArrayList<Lecture>();
					//全ての講義の中から該当の講義を見つける
					for(Lecture tempLect:allLectureList){
						if(tempLect.getGaitoGakki().equals(semesters[i])
								&&tempLect.getDay().equals(days[p])
								&&Integer.toString(tempLect.getPeriod()).equals(periods[n]))
						{
							tempLectureList.add(tempLect);
						}
					}

					//該当の講義が1つ以上存在すれば
					int count=1;
					System.out.println(tempLectureList.size());
					if(tempLectureList.size()>0){

						for(Lecture lc:tempLectureList){
							lectureDataMap=new HashMap<String,String>();

							lectureDataMap.put("taninum",Integer.toString(lc.getTaniNum()) );
							lectureDataMap.put("name",lc.getLectureName() );
							lectureDataMap.put("id",Integer.toString(lc.getLectureID()) );
							lectureDataMap.put("room",lc.getRoom() );
							lectureDataMap.put("type",this.AdaptType(lc.getType()));
							lectureDataMap.put("unit",lc.getUnit());
							if(lc.getType().equals("必修")){
								lectureDataMap.put("must", "true");
							}else{
								lectureDataMap.put("must", "false");
							}
							lectureListMap.put("lecture"+Integer.toString(count),lectureDataMap );
							count++;
						}
					}
					//初期化
					lectureDataMap=new HashMap<String,String>();

					lectureDataMap.put("taninum","0" );
					lectureDataMap.put("name","取らない");
					lectureDataMap.put("id","0" );
					lectureDataMap.put("room","0");
					lectureDataMap.put("type","0");
					lectureDataMap.put("unit","0000");
					lectureDataMap.put("must", "false");
					System.out.println("lectureData"+lectureDataMap.size());

					//取らないを追加する
					lectureListMap.put("lecture"+Integer.toString(count),lectureDataMap );
					//履修可能講義を現在の講義のマップに入れる
					table.get(semesters[i]).get(days[p]).get("period"+periods[n]).put("csc",lectureListMap);

					//初期化
					lectureDataMap=new HashMap<String,String>();
					lectureListMap=new HashMap<String,Map>();
				}
			}
		}
		Map<String,Map> fuckMap=new HashMap<String,Map>();
		fuckMap.put("table", table);
		JSONObject myClassesJson = new JSONObject(fuckMap);
		session.setAttribute("EditLectureList",myClassesJson);
		System.out.println(myClassesJson);
		getServletContext().getRequestDispatcher("/edit.jsp").forward(request, response);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}
	private String AdaptType(String type){
		String result="";
		switch(type){
		case "必修":
			result="mus";
			break;
		case "選択":
			result="elect";
			break;
		case "英語":
			result="eng";
			break;
		case "人科":
			result="hum";
			break;
		default:
			result="";
		}
		return result;
	}

}
