<%@ page contentType="text/html;charset=GBK" import="java.util.*" %>
<jsp:useBean id="Bean1" scope="session" class="EBook.CreateID"></jsp:useBean>

<% String yzm=Bean1.CreateRand();session.setAttribute("Code",yzm);%>
<html>
<body>
<div align="center">当前位置--&gt;<font color="blue">用户登录&nbsp;&nbsp;</font><br>
<font size=4 color=#ff00ff>只有注册用户，才可以登录，享受更多优惠！</font><br><hr><br>
<font color="green">以下各项中，登录ID号，姓名两项中可以选填一项，其余各项均不能为空</font></div>

    <form action="LogCheck.jsp" Method="post">
      <table align="center">
         <tr><td align="right">登录ID号</td>
             <td><input type="text" name="userID"></td>
             <td>&nbsp;</td></tr>
         <tr><td align="right">姓&nbsp;&nbsp;名</td>
             <td><input type="text" name="realName"></td>
             <td>&nbsp;</td></tr>
         <tr><td align="right">密&nbsp;&nbsp;码</td>
             <td><input type="password" name="pass"></td>
             <td>&nbsp;</td></tr>
         <tr><td align="right">后面的<font size="4" color="red">验证码</font>是</td>
             <td><input type="text" name="CheckCode"></td>
             <td bgcolor=#ff0000 align="left"><%=yzm%></td></tr>               
      </table>
      <P align="center"><input type="submit" value="登&nbsp;录">
      &nbsp;&nbsp;<input type="reset" value="重&nbsp;填"></P>      
    </form>
 </body></html>   
