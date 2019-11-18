package db.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	private static String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
	//private static String user = "myjava";
	private static String user = "coffeam";
	private static String pwd = "tiger";
	private static String driver = "oracle.jdbc.driver.OracleDriver";

	// static 블럭 : 메모리에 가장 먼저 올라가는 블럭. main()보다도 먼저 실행된다.
	static{
		try {
			Class.forName(driver);
			System.out.println("Driver Loading Success..");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getCon() throws SQLException{
		Connection con = DriverManager.getConnection(url, user, pwd);
		return con;
	}

	// setter, getter----------------
	public static String getUrl() {return url;}
	public static void setUrl(String url) {DBUtil.url = url;}

	public static String getUser() {return user;}
	public static void setUser(String user) {DBUtil.user = user;}

	public static String getPwd() {return pwd;}
	public static void setPwd(String pwd) {DBUtil.pwd = pwd;}

	public static String getDriver() {return driver;}
	public static void setDriver(String driver) {DBUtil.driver = driver;}
}