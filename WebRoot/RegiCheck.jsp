<%@ page contentType="text/html; charset=GBK" import="java.sql.*"%>
<%@ page import="javax.swing.*" %>
<% request.setCharacterEncoding("GBK");%>
<html>
  <body>
       <jsp:useBean id="MyBean" scope="session" class="EBook.QueryUpdate"/>
       <%
       //从表单上获取数据并存入数据库中对应的变量
       String a0=new String(request.getParameter("userID").getBytes("iso-8859-1"), "gb2312");
       String a1=new String(request.getParameter("realName").getBytes("iso-8859-1"), "gb2312");
       String a2=new String(request.getParameter("gender").getBytes("iso-8859-1"), "gb2312");
       String a3=new String(request.getParameter("birthdate").getBytes("iso-8859-1"), "gb2312");
       String a4=new String(request.getParameter("pass1").getBytes("iso-8859-1"), "gb2312");
       String a42=request.getParameter("pass2");
       String a5=request.getParameter("email");
       String a6=new String(request.getParameter("addr").getBytes("iso-8859-1"), "gb2312");
       String a7=request.getParameter("phone");
       String a8="";
       String ab8[]=request.getParameterValues("Interest");
       for(int k=0;k<ab8.length;k++)
       {
           ab8[k]=new String(ab8[k].getBytes("iso-8859-1"),"gb2312");
           a8=a8.concat(ab8[k]);
           if(k<ab8.length-1)
           a8=a8.concat(",");
       }
       
       String Message="";int k=0;int type=JOptionPane.WARNING_MESSAGE;
       JFrame f=new JFrame("OptionPane");
       if(a1.equalsIgnoreCase(""))
       {
           Message="您的姓名没填写\n";
           k++;
           JOptionPane.showMessageDialog(f, Message,"警示",type);
       }
       
        if(a3.equalsIgnoreCase("1930-01-01"))
       {
           Message="您的出生日期有问题\n";
           k++;
           JOptionPane.showMessageDialog(f, Message,"警示",type);
       }
       
        if(a4.equalsIgnoreCase(""))
       {
           Message="您没填写密码\n";
           k++;
           JOptionPane.showMessageDialog(f, Message,"警示",type);
       }
       else if(!a4.equalsIgnoreCase(a42))
       {
          k++;
          JOptionPane.showMessageDialog(f, "两次输入密码不一致","警示",type);
       }
       
       if(a6.equalsIgnoreCase(""))
       {
           Message="您没填写送货地址\n";
           k++;
           JOptionPane.showMessageDialog(f, Message,"警示",type);
       }
       
       if(a7.equalsIgnoreCase(""))
       {
           Message="您没填写联系电话\n";
           k++;
           JOptionPane.showMessageDialog(f, Message,"警示",type);
       }
       
       if(k>0)
       {
           response.sendRedirect("Register.jsp");
       }
       else
       {
          String s1="'"+a0+"'";
          String sql0="select LogName from users where LogName="+s1;
          ResultSet rs0=MyBean.executeQuery(sql0);//得到查询结果集
          rs0.next();
          if(rs0.isLast())
          {
            Message="ID号："+a0+",已经有人占用！\n请点击确定按钮，重新注册\n";
            JOptionPane.showMessageDialog(f, Message,"通知",1);
            rs0.close();
            response.sendRedirect("Register.jsp");
          }
          else
          {
                 //将上述数据插入数据库
                String s="'"+a0+"','"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+a5+"','"+a6+"','"+a7+"','"+a8+"'";
            	String sql1="insert into users values("+s+")";
            	MyBean.executeUpdate(sql1); 
          %>
             <div align="center">当前位置--&gt;<font color="blue">用户注册</font><br>
             <font color="red">恭喜您注册成功，数据已写入数据库中，谢谢您经常回顾我的网上书店！</font></div><br><br>
             <!-- 查询语句 -->
             <table align="center">
             <tr><th>登记号</th><th bgcolor=#00ffc0>姓名</th><th>性别</th>
             <th bgcolor=#00ffc0>出生日期</th><th>电子信箱</th>
             <th bgcolor=#00ffc0>送货地址</th><th>联系电话</th>
             <th bgcolor=#00ffc0>兴趣爱好</th></tr>
         <%
             //写入后执行查询并输出
             String sql="select * from users order by LogName desc";
             ResultSet rs = MyBean.executeQuery(sql);
             while(rs.next())
             {
             out.println("<tr>");
             out.println("<td> "+rs.getString(1)+"</td>");
             out.println("<td bgcolor=#00ffc0>"+rs.getString(2)+"</td>");
             out.println("<td>"+rs.getString(3)+"</td>");
             out.println("<td bgcolor=#00ffc0>"+rs.getString(4)+"</td>");
             out.println("<td> "+rs.getString(6)+"</td>");
             out.println("<td bgcolor=#00ffc0>"+rs.getString(7)+"</td>");
             out.println("<td> "+rs.getString(8)+"</td>");
             out.println("<td bgcolor=#00ffc0>"+rs.getString(9)+"</td>");
             out.println("</tr>");
             }
             rs.close();
             }
             }
          %>
      </table>
  </body>
</html>
