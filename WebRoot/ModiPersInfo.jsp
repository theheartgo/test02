<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*" %>
<%@ page import="javax.swing.*" %>
<jsp:useBean id="MyBean" scope="page" class="EBook.QueryUpdate"></jsp:useBean>

<html>
  <head>
  <title>ModiPersInfo.jsp</title>
  </head>
  
  <body>
  <%
  request.setCharacterEncoding("UTF-8");
  String s1=request.getParameter("UserID");
  String s2=request.getParameter("Passw");
  session.setAttribute("rsl", s1);
  String s3=s1+"' and password='"+s2+"'";
  String sql="select * from users where LogName='"+s3;
  
  String ab[]={"","","","","","",""};
  String flag="";
  String Mess="";
  int type1 = JOptionPane.ERROR_MESSAGE;
  JFrame Jf = new JFrame("OptionPane");
  
  try{
  
  ResultSet rs=MyBean.executeQuery(sql);
  
  if(rs.next()!=false){
  ab[0] = rs.getString(1);
  ab[1] = rs.getString(2);
  ab[2] = rs.getString(4);
  ab[3] = rs.getString(5);
  ab[4] = rs.getString(6);
  ab[5] = rs.getString(7);
  ab[6] = rs.getString(8);
  flag="OK";
  }
  else{
  Mess = "用户名 或 密码  错误！\n 点击'确定'按钮，返回前一页面重新输入\n";
  //JOptionPane.showMessageDialog(Jf,Mess,"错误",type1);
  response.sendRedirect("ModiPersInfo.html");
  }
  rs.close();
  
  }catch(Exception e){
  out.println("SQL出现异常!");
  }
  
  if(flag.equalsIgnoreCase("OK")){
   %>
   
   <div align="center"> <font color=#ff00ff>
   下表是您上次的注册信息，请将需要项修改的项重新填写
   </font></div>
   
   <form action="ChangeInfo.jsp" Method="post">
   <table align="center">
   		<tr><td align="right" bgcolor=#00ffc0>登录ID号</td>
        <td><input type="text" name="LogName" value="<%=ab[0]%>"></td>
        <td>&nbsp;&nbsp;</td>
        <td align="right" bgcolor=#00ffc0>真是姓名</td>
        <td><input type="text" name="realName" value="<%=ab[1]%>"></td></tr>
        
         <tr><td align="right" bgcolor=#00ffc0>登录密码</td>
        <td><input type="password" name="pass" value="<%=ab[3]%>"></td>
        <td>&nbsp;&nbsp;</td>
        <td align="right" bgcolor=#00ffc0>出生日期</td>
        <td><input type="text" name="birth" value="<%=ab[2]%>"></td></tr>
        
         <tr><td align="right" bgcolor=#00ffc0>电子信箱</td>
        <td><input type="text" name="email" value="<%=ab[4]%>"></td>
        <td>&nbsp;&nbsp;</td>
        <td align="right" bgcolor=#00ffc0>联系电话</td>
        <td><input type="text" name="phone" value="<%=ab[6]%>"></td></tr>
        
          <tr><td align="right" bgcolor=#00ffc0>送货地址</td>
          <td colspan="4">
        <input type="text" name="addr" value="<%=ab[5]%>"></td>
        <td>&nbsp;&nbsp;</td>
        </tr>

   </table>
   <p align="center"><input type="submit" value="改好了">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value=" 重&nbsp;改"></p>
   </form>
   <%} %>
   
  </body>
</html>
