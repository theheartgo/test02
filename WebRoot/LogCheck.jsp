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
       Mess="��֤�벻��ȷ\n";
       k++;
       JOptionPane.showMessageDialog(jf, Mess,"��ʾ",type);
     }*/
     
     if(a1.equalsIgnoreCase("")&&a2.equalsIgnoreCase(""))
     {
       Mess="��¼ID�ź������б���дһ��\n";k++;
       JOptionPane.showMessageDialog(jf, Mess,"��ʾ",type);
     }
     if(a3.equalsIgnoreCase(""))
     {
       Mess="��û����д����\n";k++;
       JOptionPane.showMessageDialog(jf, Mess,"��ʾ",type);
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
            Mess="ID���ǣ�"+a1+",��¼�ɹ���\n";
            else 
            Mess="�����ǣ�"+a2+",��¼�ɹ���\n";
            Mess=Mess.concat("���'ȷ��'��ť������'����ͼ��'ҳ��\n");
            int type1=JOptionPane.PLAIN_MESSAGE;
            JOptionPane.showMessageDialog(jf, Mess,"�ɹ�",type1);
            response.sendRedirect("BuyBook.jsp");            
         }
       
           else
           {
            if(lr==1)
              Mess=a1.concat(",�������\n���'ȷ��'��ť�����µ�¼\n");
              else
               Mess=a2.concat(",�������\n���'ȷ��'��ť�����µ�¼\n");
              int type1=JOptionPane.ERROR_MESSAGE;
              JOptionPane.showMessageDialog(jf, Mess,"�д���",type1);
              response.sendRedirect("Login.jsp");
          }
       }
       else
       {
         if(lr==1)
         Mess="ID���ǣ�"+a1+"���û���û��ע�ᣡ\n";
         else
          Mess="�����ǣ�"+a2+"���û���û��ע�ᣡ\n";
         Mess=Mess.concat("���'ȷ��'��ť������'�û�ע��'ҳ��\n");
         JOptionPane.showMessageDialog(jf, Mess,"��ʾ",type);
         response.sendRedirect("Register.jsp");
       }
       rs.close();
    }      
   %>
  </body>
</html>
    
