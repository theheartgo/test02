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
   			Mess="������<=0����\n";
			Mess=Mess.concat("���ȷ����ť������ǰһҳ����������");
			//JOptionPane.showMessageDialog(Jf, Mess, "������ʾ", type);
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
   					Mess="�û��� �� ���� ����\n ���'ȷ��'��ť������ǰһҳ����������\n";
   					//JOptionPane.showMessageDialog(Jf, Mess, "����", type);
   					response.sendRedirect("ModiNum.html");
   				}
   			
   			}catch(Exception e){out.println("��ѯʧ�ܣ�1");}
   			
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
						Mess="��û�ж����򶩵��Ų���ȷ��\n���ȷ����ť������ǰһҳ����������";
						//JOptionPane.showMessageDialog(Jf, Mess, "����", type);
						response.sendRedirect("ModiNum.html");
										
   				
   					}
   				}
   			catch(Exception e){out.println("��ѯʧ�ܣ�2");}
   			
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
   					Mess="���޸ĳɹ���\n���ȷ����ť�����ض���ͼ��ҳ��\n";
   					//JOptionPane.showMessageDialog(Jf, Mess, "�ɹ�", type);
   					response.sendRedirect("BuyBook.jsp");
   				}
   				else
   				{
   					Mess="�����Ż�ԭ��������ȷ\n���ȷ����ť������ǰһҳ����������\n";
   					//JOptionPane.showMessageDialog(Jf, Mess, "����", type);
   					response.sendRedirect("ModiNum.html");
   				}
   			}
   		catch(Exception e){out.println("��ѯʧ�ܣ�3");
   			}
   			}	
   		}
   
    %>
  </body>
</html>

