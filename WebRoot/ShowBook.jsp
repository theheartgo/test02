<%@ page contentType="text/html;charset=GBK" import="java.sql.*"%>
<jsp:useBean id="MyBean" scope="page" class="EBook.QueryUpdate"/>
<html>
  <head>
  <body>
     <div align="center">当前位置--&gt;
     <font color = "blue">书目浏览&nbsp;&nbsp;</font>
     <font color =#ff00ff>欢迎您访问我的网上书店!</font><br>
           如果有您需要的图书，亲您点击顶行的 <font color ="blue">订购图书</font>菜单项！
     <hr></div>
     <table border =1>
     <%
      //数据库的查询
      String sql = "SELECT * FROM book ORDER BY public_date DESC";
      ResultSet rs = MyBean.executeQuery(sql);
      while(rs.next())
      {
      out.println("<tr>");
      out.println("<td bgcolor =#f0f0f0 nowrap='nowrap'>ISBN号</td>");
      out.println("<td>"+rs.getString(1)+"</td>");
      out.println("<td align='center' bgcolor=#f0f0f0>书名</td>");
      out.println("<td>"+rs.getString(2)+"</td>");
      out.println("<td align='center' bgcolor=#f0f0f0 nowrap='nowrap'>作者</td>");
      out.println("<td>"+rs.getString(3)+"</td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<td align='center' bgcolor=#f0f0f0>出版社</td>");
      out.println("<td>"+rs.getString(4)+"</td>");
      out.println("<td align='center' bgcolor=#f0f0f0 nowrap='nowrap'>出版时间</td>");
      out.println("<td>"+rs.getString(5)+"</td>");
      out.println("<td align='center' bgcolor=#f0f0f0>定价</td>");
      out.println("<td>"+rs.getString(6)+"</td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<td  bgcolor=#f0f0f0>内容简介</td>");
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
