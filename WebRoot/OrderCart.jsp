<%@ page contentType="text/html;charset=GBK" import="java.sql.*"%>
<jsp:useBean id="MyBean" scope="session" class="EBook.QueryUpdate"/>

<html>
 <head><title>OrderCart.jsp</title></head>  
  <body>
   <div align="center" style=background:#00f0f0>您的购物车中现有图书如下</div>
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
         out.println("<td bgcolor=#f0f0f0 >订单号</td>");
         out.println("<td>"+rs4.getString(1)+"</td>");
         out.println("<td bgcolor=#f0f0f0 >用户ID</td>");
         out.println("<td>"+rs4.getString(2)+"</td>");
         out.println("<td bgcolor=#f0f0f0 >订购书号</td>");
         out.println("<td>"+rs4.getString(3)+"</td>");
         out.println("<td bgcolor=#f0f0f0 >书名</td>");
         out.println("<td>"+rs4.getString(4)+"</td>");
         out.println("</tr>");
         
         out.println("<tr>");
         out.println("<td bgcolor=#f0f0f0 >订购数量</td>");
         out.println("<td>"+rs4.getString(5)+"</td>");
         out.println("<td bgcolor=#f0f0f0 >售价</td>");
         out.println("<td>"+rs4.getString(6)+"</td>");
         out.println("<td bgcolor=#f0f0f0 >书价小计</td>");
         out.println("<td>"+xiaoj+"</td>");
         out.println("<td bgcolor=#f0f0f0 >下单时间</td>");
         out.println("<td>"+rs4.getString(7)+"</td>");
         out.println("</tr>");
         
         out.println("<td colspan=8 bgcolor=#CACACA>&nbsp;</td>");
       }
       
       out.println("</table>");
       if(i == 0){
       out.println("暂无订购的图书，快去订购吧~");
       }
     }
     catch(Exception e) {out.println("查询失败！");}   
   %>
   <br><div align="center" style=background:#f0f0f0>
   <a href="../BuyBook.jsp">继续订购</a>&nbsp;&nbsp;
   <a href="../ModiNum.jsp">修改订书数量</a>&nbsp;&nbsp;
   <a href="../OrderCreat.jsp">生成订单报表</a>
   </div>
  </body>
</html>

