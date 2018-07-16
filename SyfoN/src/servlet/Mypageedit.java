package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import student.Student;
import student.StudentManager;

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

		Student student = new Student();
		StudentManager mane = new StudentManager();
		boolean result = false;
		HttpSession session=request.getSession();

		student.setNickName(request.getParameter("name"));
		student.setGradeID(Integer.parseInt(request.getParameter("grade")) );
		student.setPassWord(request.getParameter("pass"));
		student.setMailAddress(request.getParameter("mail"));
		student.setStudentID((String)session.getAttribute("studentID"));

		try {
			result = mane.editProf(student);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (result) {
			//編集に成功した場合マイページへ
			System.out.print("dekita");
			//セッションの学生情報を更新
			session.removeAttribute("student");
			session.setAttribute("student", student);
			getServletContext().getRequestDispatcher("/Mypagesev").forward(request, response);
		} else {
			// 編集に失敗している場合はlogin.jspへ
			System.out.print("sippai");
			getServletContext().getRequestDispatcher("/exitmypage.jsp").forward(request, response);
		}
	}
}


