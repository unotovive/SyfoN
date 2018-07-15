package Admin;

import java.io.Serializable;

public class Admin  implements Serializable {
	private String adminID;
	private String password;

	public String getAdminID() {
		return adminID;
	}
	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
