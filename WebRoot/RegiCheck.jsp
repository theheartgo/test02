<%@ page contentType="text/html; charset=GBK" import="java.sql.*"%>
<%@ page import="javax.swing.*" %>
<% request.setCharacterEncoding("GBK");%>
<html>
  <body>
       <jsp:useBean id="MyBean" scope="session" class="EBook.QueryUpdate"/>
       <%
       //�ӱ��ϻ�ȡ���ݲ��������ݿ��ж�Ӧ�ı���
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
           Message="��������û��д\n";
           k++;
           JOptionPane.showMessageDialog(f, Message,"��ʾ",type);
       }
       
        if(a3.equalsIgnoreCase("1930-01-01"))
       {
           Message="���ĳ�������������\n";
           k++;
           JOptionPane.showMessageDialog(f, Message,"��ʾ",type);
       }
       
        if(a4.equalsIgnoreCase(""))
       {
           Message="��û��д����\n";
           k++;
           JOptionPane.showMessageDialog(f, Message,"��ʾ",type);
       }
       else if(!a4.equalsIgnoreCase(a42))
       {
          k++;
          JOptionPane.showMessageDialog(f, "�����������벻һ��","��ʾ",type);
       }
       
       if(a6.equalsIgnoreCase(""))
       {
           Message="��û��д�ͻ���ַ\n";
           k++;
           JOptionPane.showMessageDialog(f, Message,"��ʾ",type);
       }
       
       if(a7.equalsIgnoreCase(""))
       {
           Message="��û��д��ϵ�绰\n";
           k++;
           JOptionPane.showMessageDialog(f, Message,"��ʾ",type);
       }
       
       if(k>0)
       {
           response.sendRedirect("Register.jsp");
       }
       else
       {
          String s1="'"+a0+"'";
          String sql0="select LogName from users where LogName="+s1;
          ResultSet rs0=MyBean.executeQuery(sql0);//�õ���ѯ�����
          rs0.next();
          if(rs0.isLast())
          {
            Message="ID�ţ�"+a0+",�Ѿ�����ռ�ã�\n����ȷ����ť������ע��\n";
            JOptionPane.showMessageDialog(f, Message,"֪ͨ",1);
            rs0.close();
            response.sendRedirect("Register.jsp");
          }
          else
          {
                 //���������ݲ������ݿ�
                String s="'"+a0+"','"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+a5+"','"+a6+"','"+a7+"','"+a8+"'";
            	String sql1="insert into users values("+s+")";
            	MyBean.executeUpdate(sql1); 
          %>
             <div align="center">��ǰλ��--&gt;<font color="blue">�û�ע��</font><br>
             <font color="red">��ϲ��ע��ɹ���������д�����ݿ��У�лл�������ع��ҵ�������꣡</font></div><br><br>
             <!-- ��ѯ��� -->
             <table align="center">
             <tr><th>�ǼǺ�</th><th bgcolor=#00ffc0>����</th><th>�Ա�</th>
             <th bgcolor=#00ffc0>��������</th><th>��������</th>
             <th bgcolor=#00ffc0>�ͻ���ַ</th><th>��ϵ�绰</th>
             <th bgcolor=#00ffc0>��Ȥ����</th></tr>
         <%
             //д���ִ�в�ѯ�����
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
