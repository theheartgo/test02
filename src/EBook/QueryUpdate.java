package EBook;
import java.sql.*;

public class QueryUpdate {
	Statement stmt=null;
	Connection con=null;
	public QueryUpdate() {
		this.con=Conn.getMySQLConnect();
	}
	public void executeUpdate(String sql){
		try {
			stmt=con.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO: handle exception
			System.err.println(e.getMessage());
		}
	}
	public ResultSet executeQuery(String sql){
		ResultSet rs1=null;
		try {
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs1=stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO: handle exception
			System.err.println("executeQuery:"+e.getMessage());
		}
		return rs1;
	}
	public void close (){
		try {
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO: handle exception
			
			System.err.println(e.getMessage());
		}
	}
 
}
