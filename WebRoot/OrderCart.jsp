<%@ page contentType="text/html;charset=GBK" import="java.sql.*"%>
<jsp:useBean id="MyBean" scope="session" class="EBook.QueryUpdate"/>

<html>
 <head><title>OrderCart.jsp</title></head>  
  <body>
   <div align="center" style=background:#00f0f0>���Ĺ��ﳵ������ͼ������</div>
   <%
     
     String s1=session.getAttribute("rs1").toString();//LogName
     String s2=session.getAttribute("rs2").toString();//BuyID
     String s3=session.getAttribute("rs3").toString();//ISBN
     String s4=session.getAttribute("rs4").toString();//OrderID
     out.println(s1);
     out.println(s2);
     out.println(s3);
     out.println(s4);
     
     try
     {
       out.print("<table boder=1>");
       String str="'"+s1+"' AND OrderID='"+s4+"'";
       String sql4="SELECT * FROM orderdetail WHERE UserID="+str;
       ResultSet rs4=MyBean.executeQuery(sql4);
       int i=0;
       while(rs4.next())
       {
       	 i++;
         float xiaoj=Integer.parseInt(rs4.getString(5))*Float.parseFloat(rs4.getString(6));
         out.println("<tr>");
         out.println("<td bgcolor=#f0f0f0 >������</td>");
         out.println("<td>"+rs4.getString(1)+"</td>");
         out.println("<td bgcolor=#f0f0f0 >�û�ID</td>");
         out.println("<td>"+rs4.getString(2)+"</td>");
         out.println("<td bgcolor=#f0f0f0 >�������</td>");
         out.println("<td>"+rs4.getString(3)+"</td>");
         out.println("<td bgcolor=#f0f0f0 >����</td>");
         out.println("<td>"+rs4.getString(4)+"</td>");
         out.println("</tr>");
         
         out.println("<tr>");
         out.println("<td bgcolor=#f0f0f0 >��������</td>");
         out.println("<td>"+rs4.getString(5)+"</td>");
         out.println("<td bgcolor=#f0f0f0 >�ۼ�</td>");
         out.println("<td>"+rs4.getString(6)+"</td>");
         out.println("<td bgcolor=#f0f0f0 >���С��</td>");
         out.println("<td>"+xiaoj+"</td>");
         out.println("<td bgcolor=#f0f0f0 >�µ�ʱ��</td>");
         out.println("<td>"+rs4.getString(7)+"</td>");
         out.println("</tr>");
         
         out.println("<td colspan=8 bgcolor=#CACACA>&nbsp;</td>");
       }
       
       out.println("</table>");
       if(i == 0){
       out.println("���޶�����ͼ�飬��ȥ������~");
       }
     }
     catch(Exception e) {out.println("��ѯʧ�ܣ�");}   
   %>
   <br><div align="center" style=background:#f0f0f0>
   <a href="../BuyBook.jsp">��������</a>&nbsp;&nbsp;
   <a href="../ModiNum.jsp">�޸Ķ�������</a>&nbsp;&nbsp;
   <a href="../OrderCreat.jsp">���ɶ�������</a>
   </div>
  </body>
</html>

