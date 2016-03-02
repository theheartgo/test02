package EBook;
import java.sql.*;

public class Conn {
	public static Connection getMySQLConnect(){
		//链接数据库的方法
		Connection con=null;
		String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";//驱动对象
		String userName="liushoubei";//数据库的用户名
		String userPasswd="123";//数据库的密码
		String dbName="EBook";//数据库名
	    String conURL="jdbc:sqlserver://localhost:1433;databaseName=EBook";//链接数据库的URL
	    try {
			Class.forName(driverName);//加载驱动	
		} catch (ClassNotFoundException e) {
			// TODO: handle exception
			System.out.println("err loading sql driver");
		}
	    try {
	    	//链接数据库
			con=DriverManager.getConnection(conURL,userName,userPasswd);
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return con;
	}

}
