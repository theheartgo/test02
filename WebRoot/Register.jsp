<%@ page language="java"  import="java.util.*" pageEncoding="GBK"%>
<jsp:useBean id="Bean1" class="EBook.CreateID"></jsp:useBean>
<% request.setCharacterEncoding("GBK");%>
<html>

  <body>
    <div align="center">当前的位置--&gt;<font color="blue">
            用户注册&nbsp;&nbsp;</font>
      <font size=4 color=#ff00ff>您注册后，就成为我们的嘉宾，可以享受更多优惠！</font><br><hr><br>
      <font color="green">为了让我们更好地为您服务，请您认真填写下面的表单，一下各项均不为空！</font></div>   
       
      <form action ="RegiCheck.jsp" methord="post">
      <table align="center">
      <tr><td align="right">登录ID号</td>
       <td><input type="number" name="userID" value="<%=Bean1.DateTimeToID()%>"></td>
       <td>&nbsp;&nbsp;</td>
       
       
      <td align="right">真实姓名</td>
      <td><input type="text" name="realName"></td></tr>
      
      <tr><td align="right">性&nbsp;&nbsp;别&nbsp;&nbsp;</td>
      <td><input type="radio" name="gender" value="男" checked>男
      <input type="radio" name="gender" value="女">女</td>
      <td>&nbsp;&nbsp;</td>
      
      <td align="right">出生日期</td>
      <td><input type="text" name="birthdate"></td></tr>
      
      <tr><td align="right">登录密码</td>
      <td ><input type="password" name="pass1"></td>
      <td>&nbsp;&nbsp;</td>
      
      <td align="right">密码确认</td>
      <td><input type="password" name="pass2"></td></tr>
      
      <tr><td align="right">电子邮件</td>
      <td><input type="text" name="email"></td>
      <td>&nbsp;&nbsp;</td>
      
      <td align="right">联系电话</td>
      <td><input type="text" name="phone"></td></tr>
      
      <tr><td align="right">送货地址</td>
      <td colspan=4>&nbsp;
      <input type="text" name="addr" size="60" maxlength="60"></td></tr>
      
      <tr><td align="right">兴趣爱好</td>
      <td colspan=4>
      <input type="checkbox" name="Interest" value="读书">读书
      <input type="checkbox" name="Interest" value="上网">上网
      <input type="checkbox" name="Interest" value="财经">财经
      <input type="checkbox" name="Interest" value="房产">房产
      <input type="checkbox" name="Interest" value="旅游">旅游
      <input type="checkbox" name="Interest" value="打球">打球
      <input type="checkbox" name="Interest" value="户外">户外</td></tr>
      </table>
       <P align="center"><input type="submit" value="填好了"></td>
       &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="reset" value="重&nbsp;填"></P>
      </form>
      <br>
  </body>
</html>
