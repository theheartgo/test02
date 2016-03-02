<%@page import="EBook.CreateID" %>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:useBean id="Bean1" class="EBook.CreateID"></jsp:useBean>

<html>

  <head>
    <title>TopMenu.jsp顶行菜单</title></head>
  <body>
    <front size=3>
    <table align="center" border="1" cellpadding="3">
    <tr><td bgcolor=#DDF3FF><a href="ShowInfo.html" target = "ifr2">
         首页</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="ShowBook.jsp" target = "ifr2">
         图书<br>浏览</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="NewBook.jsp" target = "ifr2">
        最近<br>新书</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="DiscountBook.jsp" target = "ifr2">
        特价<br>图书</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="ShortBook.jsp" target = "ifr2">
        缺书<br>登记</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="Register.jsp" target = "ifr2">
        用户<br>注册</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="Login.jsp" target = "ifr2">
        用户<br>登录</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="BuyBook.jsp" target = "ifr2">
        订购<br>图书</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="OrderLook.html" target = "ifr2">
        查看<br>订单</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="ModiNum.html" target = "ifr2">
        修改<br>订书数量</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="ModiPersInfo.html" target = "ifr2">
        修改<br>个人资料</a></td>
    </tr></table></front>
    <p align = "center">当前日期时间：<%=Bean1.DateTime1() %></p><hr>
  </body>
</html>
