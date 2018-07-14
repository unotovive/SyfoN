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

/**
 * Servlet implementation class Admin_LRListServret
 */
@WebServlet("/Admin_LRListServret")
public class Admin_LRListServret extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_LRListServret() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Review Review = new Review();
		ReviewManager revmane = new ReviewManager();
		ArrayList<Review> revresult = new ArrayList<Review>();

		HttpSession session = request.getSession();

		try {
			revresult = revmane.getAllReviewList();
			session.setAttribute("allunit", revresult);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Review Review = new Review();
		ReviewManager revmane = new ReviewManager();

		Boolean result = false;

        HttpSession session = request.getSession();

		try {
			result = revmane.removeReview((request.getParameter("lectureID")));
		} catch (SQLException e) {
			e.printStackTrace();
		}


		getServletContext().getRequestDispatcher("/Admin_ReviewList.jsp").forward(request, response);

	}

}
