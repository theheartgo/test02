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
    catch(Exception e) {out.println("SQL出现异常");}
    
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
         
         zhonj=zhonj+xiaoj;
         bookNum=bookNum+Integer.parseInt(rs4.getString(5));
         out.println("<td colspan=8 bgcolor=#CACACA>&nbsp;</td>");
       }
         out.println("<tr>");
         out.println("<td colspan=3 align='right' bgcolor=#00ffc0>本单共购书</td>");         
         out.println("<td align='left' bgcolor=#00ffc0>"+bookNum+"册</td>");
         out.println("<td colspan=2 align='right' bgcolor=#00ffc0>本单共计价格</td>");
         out.println("<td colspan=2 align='right' bgcolor=#00ffc0>"+zhonj+"</td>");
         out.println("</tr>");
         
         out.println("<tr>");
         out.println("<td bgcolor=#f0f0f0 >订购人</td>");
         out.println("<td>"+reName+"</td>");
         out.println("<td bgcolor=#f0f0f0 >联系电话</td>");
         out.println("<td>"+phon+"</td>");
         out.println("<td bgcolor=#f0f0f0 >送货地址</td>");
         out.println("<td colspan=3>"+addr+"</td>");
         out.println("</tr></table>");
         
    }
    catch(Exception e) {out.println("查询失败！");}               
   %>
   <br><div align="center" style=background:#f0f0f0>
   <a href="../BuyBook.jsp">继续订购</a>&nbsp;&nbsp;
   <a href="../OrderCreat.jsp">生成订单报表</a>
   <a href="../ModiNum.jsp">修改订书数量</a>&nbsp;&nbsp;
   <a href="../ModiPersInfo.html">修改个人资料</a>&nbsp;&nbsp;
   <a href="../CheckOut.jsp">去前台结账</a>&nbsp;&nbsp;
   </div>
   
  </body>
</html>
