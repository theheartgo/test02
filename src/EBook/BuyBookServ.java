package EBook;
import java.io.IOException;
import java.io.PrintWriter;
import javax.swing.*;
import java.sql.ResultSet;
import EBook.CreateID;
import EBook.QueryUpdate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BuyBookServ extends HttpServlet
{
	private static final long serialVersionUID=1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
		response.setContentType("text/html;charset=GBK");
		PrintWriter out=response.getWriter();//获得向客户发送数据的输出流
		String buyid=request.getParameter("buyID");
		String coun=request.getParameter("number");
		String usna=request.getParameter("UserName");
		
		HttpSession sess=request.getSession(true);//获得向客户会话对象
		sess.setAttribute("rs1", usna);
		sess.setAttribute("rs2", buyid);
		
		int type=JOptionPane.WARNING_MESSAGE;
		int type2=JOptionPane.PLAIN_MESSAGE;
		String Message="";
	    JFrame jf=new JFrame("OptionPane");
	    
	    if(Integer.parseInt(coun)<=0)
	    {
	    	Message="订购数量小于等于0 错误\n";
	    	Message=Message.concat("点击'确定'按钮，进入'订购图书'页面重新输入\n");
	    	JOptionPane.showMessageDialog(jf, Message,"错误提示",type);
	    	response.sendRedirect("../BuyBook.jsp");
	    }
	    else
	    {
	    	String bookNa="";
	    	float pr=0;
	    	String flag1="",flag2="";//两个查询成功与否的标志
	    	CreateID cid=new CreateID();
	    	String subTime=cid.DateTime1();
	    	
	    	QueryUpdate myServ=new QueryUpdate();
	    	
	    	String sql1="SELECT * FROM users WHERE LogName='"+usna+"'";
	    	try
	    	{
	    		//查询用户ID是否已注册
	    		ResultSet rs1=myServ.executeQuery(sql1);
	    		if(rs1.next()==false)
	    		{
	    			Message="尊敬的"+usna+",你还没有注册！";
	    			Message=Message.concat("点击'确定'按钮，进入'用户注册'页面进行注册\n");
	    			JOptionPane.showMessageDialog(jf, Message,"错误提示",type);
	    			response.sendRedirect("../Register.jsp");
	    		}
	    		else
	    		{
	    			flag1="OK"; 
	    			rs1.close();
	    		}
	    	}
	    	catch(Exception e) {
	    		out.println("SQL出现异常le!");
	    		}
	    	
	    	String sql2="SELECT * FROM book";
	    	try
	    	{
	    		//查询图书订购号是否正确,正确时再获取其它字段的值
	    		ResultSet rs2=myServ.executeQuery(sql2);
	    		while(rs2.next())
	    		{
	    			String str = rs2.getString(1).substring(5,9);
	    			if(str.equalsIgnoreCase(buyid))
	    			{
	    				sess.setAttribute("rs3", rs2.getString(1));
	    				bookNa=rs2.getString(2);
	    				pr=rs2.getFloat(6)*rs2.getFloat(9);
	    				flag2="OK";
	    				rs2.close();
	    				break;
	    			}
	    			else continue;
	    		}
	    		if(!flag2.equalsIgnoreCase("OK"))
	            {
	    			Message="订购号"+buyid+",不是我们给出的订购号！\n";
	    			Message=Message.concat("点击'确定'按钮，回到'订购图书'页面\n");
	    			JOptionPane.showMessageDialog(jf, Message,"错误提示",type);
	    			response.sendRedirect("../BuyBook.jsp");
	    		}	    		
	    	}
	    	catch(Exception e)
	    	{
	    		out.println("SQL出现异常??");
	    	}
	    	
	    	if(flag1.equalsIgnoreCase("OK")&&flag2.equalsIgnoreCase("OK"))
	    	{
	    		//两个查询标志均成功 写入数据库
	    		String ordID=cid.DateToID();
	    		sess.setAttribute("rs4", ordID);
	    		
	    		int count=Integer.parseInt(coun,10);
	    		out.print(ordID+"<br>");
	    		out.print(usna+"<br>");
	    		out.print(buyid+"<br>");
	    		out.print(bookNa+"<br>");
	    		out.print(count+"<br>");
	    		out.print(pr+"<br>");
	    		out.print(subTime+"<br>");
	    		String s="'"+ordID+"','"+usna+"','"+buyid+"','"+bookNa+"','"+count+"','"+pr+"','"+subTime+"'";
	    		String sql3="insert into orderdetail values("+s+")";
	    		try
	    		{
	    			myServ.executeUpdate(sql3);
	    			Message="尊敬的"+usna+",你的订书已放入购物车！\n";
	    			Message=Message.concat("点击'确定'按钮，查看购物车中的全部订书\n");
	    			JOptionPane.showMessageDialog(jf, Message,"OK",type2);
	    			//重定向到显示购物车中图书的页面
	    			RequestDispatcher reqDisq=request.getRequestDispatcher("../OrderCart.jsp");
	    			reqDisq.forward(request,response);
	    	
	    		}
	    		catch(Exception e)
	    		{
	    			out.println("出现不能写入的异常！");	    			
	    		} 		
	    	}  	
	    }  	
	}
}
