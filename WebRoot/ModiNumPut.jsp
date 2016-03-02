<%@ page contentType="test/html ;charset=GBK" import="java.sql.*" %>
<%@ page import="javax.swing.*" %>
<jsp:useBean id="MyBean" scope="page" class="EBook.QueryUpdate"/>

<html>
  <head> <title>My JSP 'ModiNumPut.jsp' starting page</title></head>
  <body>
   <%
   		String ab[]={"","","","","","",""};
   		ab[0]=request.getParameter("UserID");
   		ab[1]=request.getParameter("PassWo");
   		ab[2]=request.getParameter("OrderID");
   		ab[3]=request.getParameter("buyID");
   		ab[4]=request.getParameter("OldNum");
   		ab[5]=request.getParameter("NewNum");
   
   
   		String flag1 = "";
   		String flag2 = "";
   		String Mess="";
   		int type=JOptionPane.ERROR_MESSAGE;
   		int type1=JOptionPane.PLAIN_MESSAGE;
   		JFrame Jf=new JFrame("OptionPane");
   		
   		if(Integer.parseInt(ab[5])<=0)
   		{
   			Mess="新数量<=0错误\n";
			Mess=Mess.concat("点击确定按钮，返回前一页面重新输入");
			//JOptionPane.showMessageDialog(Jf, Mess, "错误提示", type);
			response.sendRedirect("ModiNum.html");	
   		}
   		else
   		{
   			String str1=ab[0]+"' AND password='"+ab[1]+"'";
   			String sql1="select * from users where LogName='"+str1;
   			try
   			{
   				ResultSet rs1 = MyBean.executeQuery(sql1);
   				if(rs1.next()!=false){flag1="OK";}
   				else
   				{
   					Mess="用户名 或 密码 错误！\n 点击'确定'按钮，返回前一页面重新输入\n";
   					//JOptionPane.showMessageDialog(Jf, Mess, "错误", type);
   					response.sendRedirect("ModiNum.html");
   				}
   			
   			}catch(Exception e){out.println("查询失败！1");}
   			
   			if(flag1.equalsIgnoreCase("OK"))
   			{
   				String str2="'"+ab[0]+"' AND OrderID='"+ab[2]+"'";
   				String sql2="select * from orderdetail where UserID="+str2;
   				try
   				{
   				ResultSet rs2=MyBean.executeQuery(sql2);
   				if(rs2.next()!=false){flag2="OK";}
   				else
   					{
						Mess="您没有订单或订单号不正确！\n点击确定按钮，返回前一页面重新输入";
						//JOptionPane.showMessageDialog(Jf, Mess, "错误", type);
						response.sendRedirect("ModiNum.html");
										
   				
   					}
   				}
   			catch(Exception e){out.println("查询失败！2");}
   			
   			}
   		
   		if(flag1.equalsIgnoreCase("OK")&&flag2.equalsIgnoreCase("OK"))
   		{
   			String str3="'"+ab[3]+"' AND BookCount='"+ab[4]+"'";
   			String sql3="select * from orderdetail where BookID="+str3;
   			try
   			{
   				ResultSet rs3=MyBean.executeQuery(sql3);
   				if(rs3.next()!=false)
   				{
   					String s1="UPDATE orderdetail set BookCount='"+ab[5]+"'";
   					String s2="WHERE BookID='"+ab[3]+"'AND BookCount='"+ab[4]+"'";
   					String sql4=s1.concat(s2);
   					
   					MyBean.executeUpdate(sql4);
   					Mess="已修改成功！\n点击确定按钮，返回订购图书页面\n";
   					//JOptionPane.showMessageDialog(Jf, Mess, "成功", type);
   					response.sendRedirect("BuyBook.jsp");
   				}
   				else
   				{
   					Mess="订购号或原数量不正确\n点击确定按钮，返回前一页面重新输入\n";
   					//JOptionPane.showMessageDialog(Jf, Mess, "错误", type);
   					response.sendRedirect("ModiNum.html");
   				}
   			}
   		catch(Exception e){out.println("查询失败！3");
   			}
   			}	
   		}
   
    %>
  </body>
</html>

