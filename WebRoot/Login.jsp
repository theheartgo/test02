<%@ page contentType="text/html;charset=GBK" import="java.util.*" %>
<jsp:useBean id="Bean1" scope="session" class="EBook.CreateID"></jsp:useBean>

<% String yzm=Bean1.CreateRand();session.setAttribute("Code",yzm);%>
<html>
<body>
<div align="center">��ǰλ��--&gt;<font color="blue">�û���¼&nbsp;&nbsp;</font><br>
<font size=4 color=#ff00ff>ֻ��ע���û����ſ��Ե�¼�����ܸ����Żݣ�</font><br><hr><br>
<font color="green">���¸����У���¼ID�ţ����������п���ѡ��һ�������������Ϊ��</font></div>

    <form action="LogCheck.jsp" Method="post">
      <table align="center">
         <tr><td align="right">��¼ID��</td>
             <td><input type="text" name="userID"></td>
             <td>&nbsp;</td></tr>
         <tr><td align="right">��&nbsp;&nbsp;��</td>
             <td><input type="text" name="realName"></td>
             <td>&nbsp;</td></tr>
         <tr><td align="right">��&nbsp;&nbsp;��</td>
             <td><input type="password" name="pass"></td>
             <td>&nbsp;</td></tr>
         <tr><td align="right">�����<font size="4" color="red">��֤��</font>��</td>
             <td><input type="text" name="CheckCode"></td>
             <td bgcolor=#ff0000 align="left"><%=yzm%></td></tr>               
      </table>
      <P align="center"><input type="submit" value="��&nbsp;¼">
      &nbsp;&nbsp;<input type="reset" value="��&nbsp;��"></P>      
    </form>
 </body></html>   
