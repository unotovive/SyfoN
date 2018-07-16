package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.stream.Stream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Lecture.Lecture;
import Lecture.LectureManager;
import courseLecture.CourseLecture;
import courseLecture.CourseLectureManager;
import timetable.TimeTable;
import timetable.TimeTableManager;

/**
 * Servlet implementation class RegisterTimeTable
 */
@WebServlet("/RegisterTimeTable")
public class RegisterTimeTable extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterTimeTable() {
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
		String[] stringList=request.getParameterValues("idList");
		int[] lectureIdList=Stream.of(stringList).mapToInt(Integer::parseInt).toArray();

		HttpSession session = request.getSession();
		String studentID=(String)session.getAttribute("studentID");

		TimeTableManager timeTableManager=new TimeTableManager();
		ArrayList<TimeTable> timeTableList=new ArrayList<TimeTable>();
		LectureManager lectureManager=new LectureManager();
		CourseLectureManager courseLectureManager=new CourseLectureManager();

		try {
			timeTableList = timeTableManager.getTimeTableList(studentID);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try{
			ArrayList<Lecture> lectureList=new ArrayList<Lecture>();
			ArrayList<CourseLecture> coursingLecture=new ArrayList<CourseLecture>();

			//全ての履修中講義を得る
			for(TimeTable tt:timeTableList){
				String timeTableID=tt.getTimeTableID();
				coursingLecture.addAll(courseLectureManager.getCourseLectureList(timeTableID));
			}

			//履修中講義と現在の履修講義を比較して、現在にない場合削除
			for(CourseLecture cl:coursingLecture){
				//存在するか？
				boolean exist=false;
				//取得した講義のリストを回して、存在すればexistをtrueにする
				//0回ならfalse
				for(int id:lectureIdList){
					if(id==cl.getLectureID()){
						exist=true;
					}
				}

				//存在しないなら
				if(!exist){
					courseLectureManager.deleteCourseLecture(cl);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if(lectureIdList.length>0){
			try {
				for(int tempID:lectureIdList){
					if(tempID!=0){
						TimeTable targetTimeTable=new TimeTable();
						Lecture lecture =lectureManager.getLecture(tempID);
						String tempGakki =lecture.getGaitoGakki();
						//学期から該当の時間割を見つける
						for(TimeTable tt:timeTableList){
							if(tt.getTimeSemester().equals(tempGakki)){
								targetTimeTable=tt;
							}
						}

						//履修講義クラスに登録
						CourseLecture courseLecture=new CourseLecture();
						courseLecture.setLectureID(tempID);
						courseLecture.setTimeTableID(targetTimeTable.getTimeTableID());
						courseLecture.setCourseSituation("risyu");

						//履修講義クラスに登録
						//失敗したら即座にエラー表記
						System.out.println(courseLecture.getLectureID());
						if(!courseLectureManager.registerCourseLecture(courseLecture))
							System.out.println("失敗");
					}
				}
				//時間割表示のサーブレットへ
				getServletContext().getRequestDispatcher("/TimeTableServ").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		//履修講義が一つもないなら、すべて削除済みなはずなのでトップ画面を表示するサーブレット
		getServletContext().getRequestDispatcher("/TimeTableServ").forward(request, response);

	}

	private int[] parseInts(String[] s){

		int[] x = new int[s.length];
		for(int i = 0; i < s.length; i++){
			x[i] = Integer.valueOf(s[i]);
		}
		return x;
	}
}
