<%@ page contentType="text/html;charset=GBK" import="java.sql.*"%>
<jsp:useBean id="MyBean" scope="page" class="EBook.QueryUpdate"/>

<html>
  <body>
    <div align="center">当前的位置--&gt;
    <font color="blue">最近新书&nbsp;&nbsp;</font>
    <font color=#ff00ff>欢迎访问我的网上书店！</font><br>
    <font color="blue">如果有您需要的图书，在您登录后方可订购图书！</font><hr></div>
    <table align="center" width = "">
    <tr><th>ISBN号</th><th bgcolor=#00ffc0>书名</th><th>作者</th>
    <th bgcolor =#00ffc0>出版社</th><th>出版时间</th>
    <th bgcolor=#00ffc0>定价</th></tr>
    
    <%
      String sql="select * from book where New='Y'";//定义查询语句
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
