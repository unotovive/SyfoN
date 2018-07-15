package Admin;

public class AdminManager {

	private AdminDAO adminDAO;

	public AdminManager(){
		adminDAO=new AdminDAO();
	}

	public boolean Login(Admin admin){
		boolean result=false;
		result=adminDAO.check(admin);
		return result;
	}
}
