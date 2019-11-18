package user.admin;

import java.io.Serializable;
import java.sql.Date;

public class AdminVO {
	private int adminNo;
	private String adminId;
	private String adminName;
	private String adminPwd;
	
	public AdminVO() {
		System.out.println("AdminVO() »ý¼º");
	}
	
	public AdminVO(int adminNo, String adminId, String adminName, String adminPwd) {
		super();
		this.adminNo = adminNo;
		this.adminId = adminId;
		this.adminName = adminName;
		this.adminPwd = adminPwd;
	}

	public int getAdminNo() {return adminNo;}
	public void setAdminNo(int adminNo) {this.adminNo = adminNo;}

	public String getAdminId() {return adminId;}
	public void setAdminId(String adminId) {this.adminId = adminId;}

	public String getAdminName() {return adminName;}
	public void setAdminName(String adminName) {this.adminName = adminName;}

	public String getAdminPwd() {return adminPwd;}
	public void setAdminPwd(String adminPwd) {this.adminPwd = adminPwd;}

	@Override
	public String toString() {
		return "AdminVO [adminNo=" + adminNo + ", adminId=" + adminId + ", adminName=" + adminName + ", adminPwd="
				+ adminPwd + "]";
	}
	
}
