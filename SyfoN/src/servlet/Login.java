package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.Admin;
import admin.AdminManager;
import student.Student;
import student.StudentManager;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		request.setCharacterEncoding("UTF-8");

		Student student = new Student();
		StudentManager mane = new StudentManager();
		Admin admin = new admin();
		AdminManager adminmane = new adminManager();


		student.setStudentID(request.getParameter("studentID"));
		student.setPassWord(request.getParameter("pass"));
		String ID = request.getParameter("studentID");

		admin.setadminID(request.getParameter("studentID"));
		admin.setPassWord(request.getParameter("pass"));

		boolean result = false;

		if(request.getParameter("admincheck")!=null)
		{     //管理者のログイン
		try {
			result = adminmane.check(admin);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		session.setAttribute("login", result);
		if (result) {
			// ログインに成功している場合はtop.jspへ
			session.setAttribute("admin", admin);
			session.setAttribute("adminID", ID);
			//System.out.print("dekita");
			getServletContext().getRequestDispatcher("/Admin_Top.jsp").forward(request, response);
		} else {
			// ログインに失敗している場合はlogin.jspへ
			//System.out.print("sippai");
			getServletContext().getRequestDispatcher("/Common_Login.jsp").forward(request, response);
			}
		}else{    //下は学生のログイン
			try {
				result = mane.check(student);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			HttpSession session = request.getSession();
			session.setAttribute("login", result);
			if (result) {
				// ログインに成功している場合はtop.jspへ
				session.setAttribute("student", student);
				session.setAttribute("studentID", ID);
				//System.out.print("dekita");
				getServletContext().getRequestDispatcher("/top.jsp").forward(request, response);
			} else {
				// ログインに失敗している場合はlogin.jspへ
				//System.out.print("sippai");
				getServletContext().getRequestDispatcher("/Common_Login.jsp").forward(request, response);
				}
		}
	}
}
/*ログインボタンが押されたときの処理*/



