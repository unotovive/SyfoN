package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Admin.Admin;
import Admin.AdminManager;

/**
 * Servlet implementation class Admin_Login
 */
@WebServlet("/Admin_Login")
public class Admin_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_Login() {
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

		Admin admin = new Admin();
		AdminManager adminmane = new AdminManager();

		admin.setAdminID(request.getParameter("adminID"));
		admin.setPassword(request.getParameter("adminPass"));

		boolean result = false;

		try {
			result = adminmane.check(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}

		HttpSession session = request.getSession();

		session.setAttribute("Admin_Login", result);
		if (result) {
			// ログインに成功している場合はtop.jspへ
			session.setAttribute("admin", admin);
			session.setAttribute("adminID", admin.getAdminID());
			System.out.print("dekita");
			getServletContext().getRequestDispatcher("/Admin_Top.jsp").forward(request, response);
		} else {
			// ログインに失敗している場合はlogin.jspへ
			System.out.print("sippai");
			getServletContext().getRequestDispatcher("/Common_Login.jsp").forward(request, response);
		}
	}
}
