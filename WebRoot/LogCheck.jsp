<%@page import="EBook.Conn"%>

<%@ page contentType="text/html;charset=GBK" import="java.sql.*" %>
<%@ page import="javax.swing.*" %>
<%request.setCharacterEncoding("GBK"); %>
<html>
<body>
  <jsp:useBean id="MyBean" scope="session" class="EBook.QueryUpdate"/>
  <%
  
	String a1 =new String(request.getParameter("userID").getBytes("iso-8859-1"), "gb2312");
	String a2 =request.getParameter("realName");
	String a3 =request.getParameter("pass");
 	String a4 =request.getParameter("CheckCode");
	String a40 =session.getAttribute("Code").toString(); 
    
     String sql="";
     int type=JOptionPane.WARNING_MESSAGE;
     String Mess="";int k=0;
     JFrame jf=new JFrame("OptionPane");
     
      /*if(!a40.equalsIgnoreCase(a4))
     {
       System.out.println(a4);
       System.out.println(a40);
       Mess="验证码不正确\n";
       k++;
       JOptionPane.showMessageDialog(jf, Mess,"警示",type);
     }*/
     
     if(a1.equalsIgnoreCase("")&&a2.equalsIgnoreCase(""))
     {
       Mess="登录ID号和姓名中必填写一项\n";k++;
       JOptionPane.showMessageDialog(jf, Mess,"警示",type);
     }
     if(a3.equalsIgnoreCase(""))
     {
       Mess="你没有填写密码\n";k++;
       JOptionPane.showMessageDialog(jf, Mess,"警示",type);
     }
    
 
     if(k>0)
      response.sendRedirect("Login.jsp");
     else
     {
       String s1="";int lr=0;
       if(!a1.equalsIgnoreCase("")){ 
         s1="LogName="+"'"+a1+"'";lr=1;
       }
       else { 
           s1="RegName="+"'"+a2+"'";
           lr=2;
       }
       
       sql="SELECT RegName,password FROM users WHERE "+s1;       
       ResultSet rs = MyBean.executeQuery(sql);
	   rs.next();
       if(rs.isLast())
       {
         if(rs.getString("password").equalsIgnoreCase(a3))
         {
            if(lr==1) 
            Mess="ID号是："+a1+",登录成功！\n";
            else 
            Mess="姓名是："+a2+",登录成功！\n";
            Mess=Mess.concat("点击'确定'按钮，进入'订购图书'页面\n");
            int type1=JOptionPane.PLAIN_MESSAGE;
            JOptionPane.showMessageDialog(jf, Mess,"成功",type1);
            response.sendRedirect("BuyBook.jsp");            
         }
       
           else
           {
            if(lr==1)
              Mess=a1.concat(",密码错误！\n点击'确定'按钮，重新登录\n");
              else
               Mess=a2.concat(",密码错误！\n点击'确定'按钮，重新登录\n");
              int type1=JOptionPane.ERROR_MESSAGE;
              JOptionPane.showMessageDialog(jf, Mess,"有错误",type1);
              response.sendRedirect("Login.jsp");
          }
       }
       else
       {
         if(lr==1)
         Mess="ID号是："+a1+"的用户还没有注册！\n";
         else
          Mess="姓名是："+a2+"的用户还没有注册！\n";
         Mess=Mess.concat("点击'确定'按钮，进入'用户注册'页面\n");
         JOptionPane.showMessageDialog(jf, Mess,"警示",type);
         response.sendRedirect("Register.jsp");
       }
       rs.close();
    }      
   %>
  </body>
</html>
    
