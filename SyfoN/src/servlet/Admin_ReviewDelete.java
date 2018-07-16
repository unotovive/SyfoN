package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.Review;
import review.ReviewManager;

/**
 * Servlet implementation class Admin_ReviewDelete
 */
@WebServlet("/Admin_ReviewDelete")
public class Admin_ReviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_ReviewDelete() {
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
		Review review = new Review();
		ReviewManager reviewManager = new ReviewManager();
		boolean result = false;
		HttpSession session = request.getSession();

		String revID = request.getParameter("評価ID");
		try {
			System.out.println(revID);
			review=reviewManager.getReview(revID);
			result = reviewManager.removeReview(review);
		} catch (SQLException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}
		if(result){
			System.out.println("レビュー削除成功");
			getServletContext().getRequestDispatcher("/Admin_ReviewList.jsp").forward(request, response);
		}else{
			System.out.println("レビュー削除失敗");
			getServletContext().getRequestDispatcher("/Admin_ReviewList.jsp").forward(request, response);
		}
	}

}
