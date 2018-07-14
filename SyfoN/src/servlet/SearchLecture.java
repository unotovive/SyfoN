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
import professor.Professor;
import professor.ProfessorManager;

/**
 * Servlet implementation class SearchLecture
 */
@WebServlet("/SearchLecture")
public class SearchLecture extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchLecture() {
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

	    try {

		Lecture lec = new Lecture();
	    LectureManager mane= new LectureManager();
		Professor professor=new Professor();
		ProfessorManager professorManager=new ProfessorManager();
		ProfessorToLectureManager ptlManager=new ProfessorToManager();

		professor=professorManager.getProfessor(request.getParameter("ProfessorID"));
		lec.setDay(request.getParameter("Day"));
		lec.setLectureName(request.getParameter("RectureName"));
		lec.setGaitoGakki(request.getParameter("GaitoGakki"));
		lec.setPeriod(Integer.valueOf(request.getParameter("Period")));

		ArrayList<Lecture>  lectureList = new ArrayList<Lecture>();
		lectureList = mane.findLecture(lec);

		HttpSession session = request.getSession();
		session.setAttribute("findlecture", lectureList);

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		}

	}

