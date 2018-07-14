package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Student;
import model.StudentManager;

/**
 * Servlet implementation class Mypageexit
 */
@WebServlet("/Mypageedit")
public class Mypageedit extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mypageedit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Student student = new Student();
		StudentManager mane = new StudentManager();
		boolean result = false;

		student.setNickname(request.getParameter("nickname"));
		student.setGradeID(Integer.parseInt(request.getParameter("gradeid")) );
		student.setPassword(request.getParameter("pass"));
		student.setNickname(request.getParameter("nickname"));

		try {
			result = mane.editProf(student);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (result) {
			//編集に成功した場合マイページへ
			//System.out.print("dekita");
			getServletContext().getRequestDispatcher("/Mypage.jsp").forward(request, response);
		} else {
			// ログインに失敗している場合はlogin.jspへ
			//System.out.print("sippai");
			getServletContext().getRequestDispatcher("/editMypage.jsp").forward(request, response);
			}
		}}

}
