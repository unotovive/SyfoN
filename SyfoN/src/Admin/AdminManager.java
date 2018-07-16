package Admin;

import java.sql.SQLException;

public class AdminManager {

	private AdminDAO adminDAO;

	public AdminManager(){
		adminDAO=new AdminDAO();
	}

	public boolean check(Admin admin) throws SQLException{
		boolean result=false;
		result=adminDAO.check(admin);
		return result;
	}
}
