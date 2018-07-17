package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Lecture.Lecture;
import Lecture.LectureManager;
import courseLecture.CourseLectureManager;

/**
 * Servlet implementation class Admin_LectureDeleteServlet
 */
@WebServlet("/Admin_LectureDeleteServlet")
public class Admin_LectureDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_LectureDeleteServlet() {
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
		int lectureID=Integer.valueOf(request.getParameter("id"));

		LectureManager lectureManager=new LectureManager();
		CourseLectureManager clManager=new CourseLectureManager();

		boolean result=false;
		Lecture deleteLecture=new Lecture();
		try {
			deleteLecture=lectureManager.getLecture(lectureID);
			result=lectureManager.removeLecture(deleteLecture);
			if(!result) System.out.println("講義削除失敗");
			result=clManager.deleteCourseLecture2(lectureID);
			if(!result) System.out.println("履修講義削除失敗");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
