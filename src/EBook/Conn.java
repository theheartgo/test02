package EBook;
import java.sql.*;

public class Conn {
	public static Connection getMySQLConnect(){
		//�������ݿ�ķ���
		Connection con=null;
		String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";//��������
		String userName="liushoubei";//���ݿ���û���
		String userPasswd="123";//���ݿ������
		String dbName="EBook";//���ݿ���
	    String conURL="jdbc:sqlserver://localhost:1433;databaseName=EBook";//�������ݿ��URL
	    try {
			Class.forName(driverName);//��������	
		} catch (ClassNotFoundException e) {
			// TODO: handle exception
			System.out.println("err loading sql driver");
		}
	    try {
	    	//�������ݿ�
			con=DriverManager.getConnection(conURL,userName,userPasswd);
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return con;
	}

}
