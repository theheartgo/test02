<%@ page contentType="text/html;charset=GBK" import="java.sql.*"%>
<jsp:useBean id="MyBean" scope="page" class="EBook.QueryUpdate"/>
<html>
  <head>
  <body>
     <div align="center">��ǰλ��--&gt;
     <font color = "blue">��Ŀ���&nbsp;&nbsp;</font>
     <font color =#ff00ff>��ӭ�������ҵ��������!</font><br>
           ���������Ҫ��ͼ�飬����������е� <font color ="blue">����ͼ��</font>�˵��
     <hr></div>
     <table border =1>
     <%
      //���ݿ�Ĳ�ѯ
      String sql = "SELECT * FROM book ORDER BY public_date DESC";
      ResultSet rs = MyBean.executeQuery(sql);
      while(rs.next())
      {
      out.println("<tr>");
      out.println("<td bgcolor =#f0f0f0 nowrap='nowrap'>ISBN��</td>");
      out.println("<td>"+rs.getString(1)+"</td>");
      out.println("<td align='center' bgcolor=#f0f0f0>����</td>");
      out.println("<td>"+rs.getString(2)+"</td>");
      out.println("<td align='center' bgcolor=#f0f0f0 nowrap='nowrap'>����</td>");
      out.println("<td>"+rs.getString(3)+"</td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<td align='center' bgcolor=#f0f0f0>������</td>");
      out.println("<td>"+rs.getString(4)+"</td>");
      out.println("<td align='center' bgcolor=#f0f0f0 nowrap='nowrap'>����ʱ��</td>");
      out.println("<td>"+rs.getString(5)+"</td>");
      out.println("<td align='center' bgcolor=#f0f0f0>����</td>");
      out.println("<td>"+rs.getString(6)+"</td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<td  bgcolor=#f0f0f0>���ݼ��</td>");
      out.println("<td colspan='5'>"+rs.getString(11)+"</td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<td colspan='6' bgcolor=#ABFBAB>&nbsp;</td>");
      out.println("</tr>");
      }
      rs.close();
      %>
    </table>
  </body>
</html>
