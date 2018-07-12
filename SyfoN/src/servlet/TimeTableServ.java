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

import courseLecture.CourseLecture;
import courseLecture.CourseLectureManager;
import timetable.TimeTable;
import timetable.TimeTableManager;

/**
 * Servlet implementation class TimeTableServ
 */
@WebServlet("/TimeTableServ")
public class TimeTableServ extends HttpServlet {
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		TimeTable TimeTable = new TimeTable();
		TimeTableManager mane = new TimeTableManager();
		TimeTable.setStudentID(request.getParameter("studentID"));
	    CourseLecture CouseLecture = new CourseLecture();
	    CourseLectureManager Lecmane = new CourseLectureManager();
		ArrayList<TimeTable>  result = new ArrayList<TimeTable>();
	    ArrayList<CourseLecture>  result1 = null;
	    ArrayList<ArrayList<CourseLecture>> lastresult = new ArrayList<ArrayList<CourseLecture>>();

		try {
			result = mane.getTimeTableList(request.getParameter("studentID"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//時間割IDを取得(8こ）

		HttpSession session = request.getSession();
		session.setAttribute("timetableID", result);

		try{
		for(int i=0;i<8;i++){
			result1 = Lecmane.getCourseLectureList(result.get(i)) ;
			lastresult.add(result1);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		//時間割IDからコースレクチャーを取得



	}
	//

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
