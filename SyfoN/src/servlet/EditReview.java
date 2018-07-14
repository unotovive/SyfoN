package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ExitReview
 */
@WebServlet("/ExitReview")
public class ExitReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExitReview() {
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
		Review rev = new Review();
		ReviewManager mane = new ReviewManager();

		HttpSession session = request.getSession();
		rev.setStudentID(ssession.getAttribute("studentID"));
		rev.setLectureID(request.getParameter("lectureID"));
		rev.setComment(request.getParameter("comment"));
		rev.setTotalPoint(Integer.parseInt(request.getParameter("totalpoint")));
		rev.setMathPoint(Integer.parseInt(request.getParameter("mathpoint")));
		rev.setProgramPoint(Integer.parseInt(request.getParameter("programpoint")));
		rev.setAttendPoint(Integer.parseInt(request.getParameter("attendpoint")));
		rev.setHomeworkPoint(Integer.parseInt(request.getParameter("homeworkpoint")));
		rev.setGroupworkPoint(Integer.parseInt(request.getParameter("groupworkpoint")));

		boolean result = false;
		try {
			result = mane.updateReview(rev);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (result) {
			// レビューに成功したとき
			getServletContext().getRequestDispatcher("/reviewtable.jsp").forward(request, response);
		} else {
			// ログインに失敗している場合はlogin.jspへ
			getServletContext().getRequestDispatcher("/review.jsp").forward(request, response);
			}
		}
	}


