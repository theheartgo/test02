<%@ page contentType="text/html;charset=GBK" import="java.sql.*"%>
<jsp:useBean id="MyBean" scope="session" class="EBook.QueryUpdate"/>

<html><head>OrderCreat.jsp</head>  
  <body>
   <%
     String s1=session.getAttribute("rs1").toString();
     String s2=session.getAttribute("rs2").toString();
     String s3=session.getAttribute("rs3").toString();
     String s4=session.getAttribute("rs4").toString();
     String reName="",addr="",phon="";
     
     try
    {
     String sql="SELECT * FROM users WHERE LogName='"+s1+"'";
     ResultSet rs1=MyBean.executeQuery(sql);
     if(rs1.next()!=false)
     {
       reName=rs1.getString(2);
       addr=rs1.getString(7);
       phon=rs1.getString(8);
     }
     rs1.close();
    }
    catch(Exception e) {out.println("SQL�����쳣");}
    
    try
    {
      out.print("<table boder=1>");
      String str="'"+s1+"' and OrderID='"+s4+"'";
      String sql4="SELECT * FROM orderdetail WHERE UserID="+str;
      float zhonj=0.0f;int bookNum=0;
      ResultSet rs4=MyBean.executeQuery(sql4);
      while(rs4.next())
       {
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
         
         zhonj=zhonj+xiaoj;
         bookNum=bookNum+Integer.parseInt(rs4.getString(5));
         out.println("<td colspan=8 bgcolor=#CACACA>&nbsp;</td>");
       }
         out.println("<tr>");
         out.println("<td colspan=3 align='right' bgcolor=#00ffc0>����������</td>");         
         out.println("<td align='left' bgcolor=#00ffc0>"+bookNum+"��</td>");
         out.println("<td colspan=2 align='right' bgcolor=#00ffc0>�������Ƽ۸�</td>");
         out.println("<td colspan=2 align='right' bgcolor=#00ffc0>"+zhonj+"</td>");
         out.println("</tr>");
         
         out.println("<tr>");
         out.println("<td bgcolor=#f0f0f0 >������</td>");
         out.println("<td>"+reName+"</td>");
         out.println("<td bgcolor=#f0f0f0 >��ϵ�绰</td>");
         out.println("<td>"+phon+"</td>");
         out.println("<td bgcolor=#f0f0f0 >�ͻ���ַ</td>");
         out.println("<td colspan=3>"+addr+"</td>");
         out.println("</tr></table>");
         
    }
    catch(Exception e) {out.println("��ѯʧ�ܣ�");}               
   %>
   <br><div align="center" style=background:#f0f0f0>
   <a href="../BuyBook.jsp">��������</a>&nbsp;&nbsp;
   <a href="../OrderCreat.jsp">���ɶ�������</a>
   <a href="../ModiNum.jsp">�޸Ķ�������</a>&nbsp;&nbsp;
   <a href="../ModiPersInfo.html">�޸ĸ�������</a>&nbsp;&nbsp;
   <a href="../CheckOut.jsp">ȥǰ̨����</a>&nbsp;&nbsp;
   </div>
   
  </body>
</html>
