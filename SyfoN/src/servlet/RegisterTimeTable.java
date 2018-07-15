package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

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
		int[] lectureIdList=null;
		lectureIdList=parseInts(request.getParameterValues("idList"));

		if(lectureIdList.length<=0){
			try {
				HttpSession session = request.getSession();
				String studentID=(String)session.getAttribute("studentID");

				TimeTableManager timeTableManager=new TimeTableManager();
				ArrayList<TimeTable> timeTableList=timeTableManager.getTimeTableList(studentID);
				LectureManager lectureManager=new LectureManager();
				CourseLectureManager courseLectureManager=new CourseLectureManager();

				boolean result = false;
				for(int tempID:lectureIdList){
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

					//履修講義クラスに前に履修してた講義があった場合削除
					ArrayList<CourseLecture> oldCourseLectureList=courseLectureManager.getCourseLectureList(targetTimeTable.getTimeTableID());
					for(CourseLecture tempCL:oldCourseLectureList){
						Lecture lc=lectureManager.getLecture(tempCL.getLectureID());
						if(lc.getPeriod()==lecture.getPeriod()
								&&lc.getDay().equals(lecture.getDay())){
							CourseLecture cl=new CourseLecture();
							cl.setLectureID(lc.getLectureID());
							cl.setTimeTableID(targetTimeTable.getTimeTableID());
							courseLectureManager.deleteCourseLecture(cl);
						}
					}
					//履修講義クラスに登録
					result=courseLectureManager.registerCourseLecture(courseLecture);
				}


				if (result) {
					//登録に成功したとき
					getServletContext().getRequestDispatcher("/top.jsp").forward(request, response);
				} else {
					// 登録に失敗している場合はedit.jspへ
					getServletContext().getRequestDispatcher("/edit.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}else{
			System.out.println("エラー　登録する講義がない");
			getServletContext().getRequestDispatcher("/CreateTable").forward(request, response);
		}

	}
	private int[] parseInts(String[] s){

		  int[] x = new int[s.length];
		  for(int i = 0; i < s.length; i++){
		    x[i] = Integer.valueOf(s[i]);
		  }
		  return x;
	}
}
