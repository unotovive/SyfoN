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
import timetable.TimeTableManager;

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
		getServletContext().getRequestDispatcher("/Common_Register.jsp").forward(request, response);
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
		TimeTableManager ttManager=new TimeTableManager();

		student.setNickName(request.getParameter("name"));
		student.setStudentID(request.getParameter("studentId"));
		student.setMailAddress(request.getParameter("mail"));
		student.setPassWord(request.getParameter("pass"));
		student.setGradeID(Integer.parseInt(request.getParameter("grade")));

		boolean result = false;
		boolean ttResult=false;

		HttpSession session = request.getSession();

		//学生の新規登録と
		try {
			result=manager.registerStudent(student);
			ttResult=ttManager.registerNewTimeTable(student.getStudentID());
			if(result){
				if(ttResult){
				//新規登録に成功すればログイン画面
					System.out.println("学生作成成功、時間割作成完了");
					getServletContext().getRequestDispatcher("/Common_Login.jsp").forward(request, response);
				} else{
					System.out.println("学生作成成功、時間割作成失敗");
					// 新規登録に失敗している場合はadd.jspへ
					manager.removeStudent(student);
					getServletContext().getRequestDispatcher("/add.jsp").forward(request, response);
				}
			}else{
				if(ttResult){
				//新規登録に成功すればログイン画面
					System.out.println("学生登録失敗、時間割登録完了");
					// 時間割を削除してadd.jsp
					ttManager.removeTimeTable(student.getStudentID());
					getServletContext().getRequestDispatcher("/add.jsp").forward(request, response);
				} else{
					System.out.println("学生登録失敗、時間割登録失敗");
					// 新規登録に失敗している場合はadd.jspへ
					getServletContext().getRequestDispatcher("/add.jsp").forward(request, response);
				}
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
	}
}