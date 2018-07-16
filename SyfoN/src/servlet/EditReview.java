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
 * Servlet implementation class ExitReview
 */
@WebServlet("/EditReview")
public class EditReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Review rev = new Review();
		ReviewManager mane = new ReviewManager();

		HttpSession session = request.getSession();
		rev.setStudentID((String)session.getAttribute("studentID"));
		rev.setLectureID((int)session.getAttribute("tempLectureID"));
		rev.setReviewID((String)session.getAttribute("tempReviewID"));
		rev.setComment(request.getParameter("comment"));
		rev.setTotalPoint(Float.parseFloat(request.getParameter("totalPoint")));
		rev.setMathPoint(Float.parseFloat(request.getParameter("mathPoint")));
		rev.setProgramPoint(Float.parseFloat(request.getParameter("programPoint")));
		rev.setAttendPoint(Float.parseFloat(request.getParameter("attendPoint")));
		rev.setGroupworkPoint(Float.parseFloat(request.getParameter("groupworkPoint")));

		boolean result = false;
		try {
			result = mane.editReview(rev);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (result) {
			// レビュー作成に成功したとき
			System.out.println("レビュー作成完了");
			//セッションの破棄
			session.removeAttribute("tempReveiwID");
			session.removeAttribute("tempLectureID");
			//detail.jspへ
			getServletContext().getRequestDispatcher("/detail.jsp").forward(request, response);
		} else {
			// ログインに失敗している場合はreview.jspへ
			System.out.println("レビュー作成失敗");
			getServletContext().getRequestDispatcher("/review.jsp").forward(request, response);
			}
		}
	}


