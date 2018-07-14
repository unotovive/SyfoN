package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddSystem
 */
@WebServlet("/AddSystem")
public class AddSystem extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSystem() {
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
		request.setCharacterEncoding("UTF-8");

		Student student = new Student();
		StudentManager manager= new StudentManager();

		student.setName(request.getParameter("name"));
		student.setID(request.getParameter("studentNo"));
		student.setmailAddress(request.getParameter("mail"));
		student.setPass(request.getParameter("pass1"));
		student.setGrade(request.getParameter("Grade"));

		boolean result = false;
		try {
			result = manager.checkID(student);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		session.setAttribute("login", result);
		if (result) {
			// 同じIDがなかった場合
			manager.registerstudent(student);
			getServletContext().getRequestDispatcher("/Common_Login.jsp").forward(request, response);
		} else {
			// ログインに失敗している場合はlogin.jspへ
			getServletContext().getRequestDispatcher("/Common_Register.jsp").forward(request, response);
			}
		}
	}




