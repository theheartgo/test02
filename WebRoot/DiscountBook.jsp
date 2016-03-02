<%@ page contentType="text/html;charset=GBK" import="java.sql.*"%>
<jsp:useBean id="MyBean" scope="page" class="EBook.QueryUpdate"/>


<html>
  <body>
    <div align="center">当前的位置--&gt;
    <font color="blue">特价图书&nbsp;&nbsp;</font>
    <font color=#ff00ff>欢迎访问我的网上书店！</font><br>
    <font color="blue">本页显示的图书都有一定的优惠，请不要错过！</font><hr></div>
    <table align="center" width = "">
    <tr><th>ISBN号</th><th bgcolor =#00ffc0>书名</th><th>作者</th>
    <th bgcolor =#00ffc0>出版社</th><th>出版时间</th>
    <th bgcolor=#00ffc0>原价</th><th bgcolor=#00ffc0>优惠价</th></tr>
    
    <%
      String sql="select * from book where discount<1.0";//定义查询语句
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
        Double yhj1 = rs.getDouble(6)*rs.getDouble(9);
        Double yhj2=Math.nextUp(yhj1);//保持足够位数
        String yhj =yhj2.toString();
        yhj=yhj.substring(0,6);
        out.println("<td>"+yhj+"</td>");
        out.println("</tr>");
        }
        rs.close();
     %>
     </table>
  </body>
</html>
