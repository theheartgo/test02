<%@ page contentType="text/html;charset=GBK" import="java.sql.*"%>
<jsp:useBean id="MyBean" scope="page" class="EBook.QueryUpdate"/>

<html>
  <body>
    <div align="center">��ǰ��λ��--&gt;
    <font color="blue">�������&nbsp;&nbsp;</font>
    <font color=#ff00ff>��ӭ�����ҵ�������꣡</font><br>
    <font color="blue">���������Ҫ��ͼ�飬������¼�󷽿ɶ���ͼ�飡</font><hr></div>
    <table align="center" width = "">
    <tr><th>ISBN��</th><th bgcolor=#00ffc0>����</th><th>����</th>
    <th bgcolor =#00ffc0>������</th><th>����ʱ��</th>
    <th bgcolor=#00ffc0>����</th></tr>
    
    <%
      String sql="select * from book where New='Y'";//�����ѯ���
      ResultSet rs =MyBean.executeQuery(sql);
      while (rs.next())
      {
        out.println("<tr>");
        out.println("<td>"+rs.getString(1)+"</td>");
        out.println("<td bgcolor=#00ffc0>"+rs.getString(2)+"</td>");
        out.println("<td>"+rs.getString(3)+"</td>");
        out.println("<td bgcolor=#00ffc0>"+rs.getString(4)+"</td>");
        out.println("<td>"+rs.getString(5)+"</td>");
        out.println("<td align=center bgcolor=#00ffc0>"+rs.getDouble(6)+"</td>");
        out.println("</tr>");
        }
        rs.close();
     %>
     </table>
  </body>
</html>
