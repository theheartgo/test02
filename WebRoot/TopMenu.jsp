<%@page import="EBook.CreateID" %>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:useBean id="Bean1" class="EBook.CreateID"></jsp:useBean>

<html>

  <head>
    <title>TopMenu.jsp���в˵�</title></head>
  <body>
    <front size=3>
    <table align="center" border="1" cellpadding="3">
    <tr><td bgcolor=#DDF3FF><a href="ShowInfo.html" target = "ifr2">
         ��ҳ</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="ShowBook.jsp" target = "ifr2">
         ͼ��<br>���</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="NewBook.jsp" target = "ifr2">
        ���<br>����</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="DiscountBook.jsp" target = "ifr2">
        �ؼ�<br>ͼ��</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="ShortBook.jsp" target = "ifr2">
        ȱ��<br>�Ǽ�</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="Register.jsp" target = "ifr2">
        �û�<br>ע��</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="Login.jsp" target = "ifr2">
        �û�<br>��¼</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="BuyBook.jsp" target = "ifr2">
        ����<br>ͼ��</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="OrderLook.html" target = "ifr2">
        �鿴<br>����</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="ModiNum.html" target = "ifr2">
        �޸�<br>��������</a></td>
    <td align="center" bgcolor=#DDF3FF><a href="ModiPersInfo.html" target = "ifr2">
        �޸�<br>��������</a></td>
    </tr></table></front>
    <p align = "center">��ǰ����ʱ�䣺<%=Bean1.DateTime1() %></p><hr>
  </body>
</html>
