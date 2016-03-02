<%@ page contentType="text/html;charset=GBK" import="java.sql.*"%>
<jsp:useBean id="MyBean" scope="session" class="EBook.QueryUpdate"/>

<html> 
  <body>
    <div align="center">当前位置--&gt;
    <font color="blue">订购图书</font><br>
    <font color="#ff00ff">如果有您需要的图书，请在</font>"订购数量"
    <font color="#ff00ff">文本框中输入订购册数，然后点击</font>"放入购物车"<br><hr>
    </div>
    
    <table boder=1>
    <%
      //执行查询语句
      String buyKey="";
      String sql="SELECT * FROM book ORDER BY Public_date DESC";
      ResultSet rs=MyBean.executeQuery(sql);
      while(rs.next())
      {
        buyKey=rs.getString(1).substring(5,9);
        float yhj1=rs.getFloat(6)*rs.getFloat(9);
        float yhj2=Math.nextUp(yhj1);
        String yhj= String.valueOf(yhj2);
        yhj=yhj.substring(0,6);
        out.println("<tr>");
        out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>ISBN号</td>");
        out.println("<td>"+rs.getString(1)+"</td>");
        out.println("<td align='center' bgcolor=#f0f0f0 >书名</td>");
        out.println("<td>"+rs.getString(2)+"</td>");
        out.println("<td align='center' bgcolor=#f0f0f0 >定价</td>");
        out.println("<td>"+rs.getFloat(6)+"</td>");
        out.println("</tr>");
        
        out.println("<tr>");
        out.println("<td align='center' bgcolor=#f0f0f0 nowrap='nowrap' >作者</td>");
        out.println("<td>"+rs.getString(3)+"</td>");
        out.println("<td align='center' bgcolor=#f0f0f0 >出版社</td>");
        out.println("<td>"+rs.getString(4)+"</td>");
        out.println("<td align='center' bgcolor=#f0f0f0 nowrap='nowrap' >出版时间</td>");
        out.println("<td colspan=2>"+rs.getString(5)+"</td>");
        out.println("</tr>");
        
        out.println("<tr>");
        out.println("<td align='center' bgcolor=#00ffc0 nowrap='nowrap' >订购号</td>");
 out.println("<td><input size='5' maxlength='5' type='text' name='buyID' value="+buyKey+"></td>");
        out.println("<td colspan=2><font color=#0000ff>如果需要该书，请将次订购号填入下面的表单中</td>");
        out.println("<td align='center' bgcolor=#00ffc0 >优惠价</td>");
        out.println("<td>"+yhj+"</td>");
        out.println("</tr>");
        
        out.println("<tr>");
        out.println("<td colspan=7 bgcolor=#CACACA>&nbsp;</td>");
        out.println("</tr>");
      }
      rs.close();          
    %>
    </table>
    <form action="servlet/BuyBookServ" method="post">
    <div align="center" style=background:#00ffc0>
        订购号<input size="5" maxlength="5" type="text" name="buyID" value="">
    &nbsp;订购数量<input size="4" maxlength="4" type="number" name="number" value="">&nbsp;
       用户ID<input type='text' name="UserName" value="">&nbsp;
    <input type="submit" name="cart" value="放入购物车">
    </div></form> 
  </body>
</html>