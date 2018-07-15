package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import student.Student;

/**
 * Servlet implementation class Mypagesev
 */
@WebServlet("/Mypagesev")
public class Mypagesev extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mypagesev() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();

		Student student=(Student)session.getAttribute("student");
		Map<String, Map> studentMap=new HashMap<String,Map>();
		Map<String,String> studentDataMap=new HashMap<String,String>();

		studentDataMap.put("name", student.getNickName());
		studentDataMap.put("id", student.getStudentID());
		studentDataMap.put("grade", Integer.toString(student.getGradeID()));
		studentDataMap.put("pass",student.getPassWord());
		studentDataMap.put("mail", student.getMailAddress());

		studentMap.put("student", studentDataMap);

		//JSON形に変換
		JSONObject studentJson=new JSONObject(studentMap);
		System.out.println(studentJson);
		session.setAttribute("studentJson", studentJson);

		//トップページからマイページへ
		getServletContext().getRequestDispatcher("/Mypage.jsp").forward(request, response);

		/*
		Student student = new Student();
		StudentManager mane = new StudentManager();
		Student result =  new Student();

		try {
			result = mane.getStudent(request.getParameter("studentID"));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		session.setAttribute("Myinfo", result);
		*/

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
