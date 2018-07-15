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
 * Servlet implementation class AddSystem
 */
@WebServlet("/RegisterStudent")
public class RegisterStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//登録画面に行く
		getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		Student student = new Student();
		StudentManager manager= new StudentManager();

		student.setNickName(request.getParameter("name"));
		student.setStudentID(request.getParameter("studentNo"));
		student.setMailAddress(request.getParameter("mail"));
		student.setPassWord(request.getParameter("pass1"));
		student.setGradeID(Integer.parseInt(request.getParameter("Grade")));

		boolean result = false;
		try {
			result = manager.check(student);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		session.setAttribute("login", result);
		if (result) {
			// 同じIDがなかった場合
			try {
				manager.registerStudent(student);
			} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
			getServletContext().getRequestDispatcher("/Common_Login.jsp").forward(request, response);
		} else {
			// ログインに失敗している場合はlogin.jspへ
			getServletContext().getRequestDispatcher("/Common_Register.jsp").forward(request, response);
			}
		}
	}




