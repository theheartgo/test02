<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<jsp:useBean id="MyBean" scope="page" class="EBook.QueryUpdate"/>
<html>
  <head><title>ChangeInfo.jsp</title></head>
  
  <body>
<%
	request.setCharacterEncoding("UTF-8");
	String a0=request.getParameter("LogName");
	String a1=request.getParameter("realName");
	String a2=request.getParameter("birth");
	String a3=request.getParameter("pass");
	String a4=request.getParameter("email");
	String a5=request.getParameter("phone");
	String a6=request.getParameter("addr");
    
	String s1="UPDATE users set LogName='"+a0+"',RegName='"+a1+"',BirthDate='"+a2+"'";
	String s2=",password='"+a3+"',email='"+a4+"',phone='"+a5+"',address='"+a6+"'";
	String s3="WHERE LogName='"+a0+"'";
	String sql=s1.concat(s2);sql=sql.concat(s3);
	MyBean.executeUpdate(sql);
	response.sendRedirect("BuyBook.jsp");

 %>
  </body>
</html>
