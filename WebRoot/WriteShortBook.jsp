<%@ page contentType="text/html; charset=GBK" import="java.sql.*"%>
<%request.setCharacterEncoding("GBK");%>

<html>

  <body>
    <jsp:useBean id="MyBean" scope="session" class="EBook.QueryUpdate"/>
    <%
       //�ӱ��ϻ�ȡ���ݲ��������ݿ��ж�Ӧ�ı���
       String a0=new String(request.getParameter("shortid").getBytes("iso-8859-1"), "gb2312");
       String a1=new String(request.getParameter("bookname").getBytes("iso-8859-1"), "gb2312");
       String a2=new String(request.getParameter("authorname").getBytes("iso-8859-1"), "gb2312");
       String a3=new String(request.getParameter("publishname").getBytes("iso-8859-1"), "gb2312");
       String a4=new String(request.getParameter("requetorname").getBytes("iso-8859-1"), "gb2312");
       String a5=request.getParameter("counter");
       String a6=request.getParameter("dti");
       String a7="N";
       
       /*out.println(a0+"<br>");  out.println(a1+"<br>");
       out.println(a2+"<br>");  out.println(a3+"<br>");
       out.println(a4+"<br>");  out.println(a5+"<br>");
       out.println(a6+"<br>");  out.println(a7+"<br>");*///��������
       
       //����������д�����ݿ�
       String s="'"+a0+"','"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+a5+"','"+a6+"','"+a7+"'";
       String sqlf="insert into shortbook values("+s+")";
       MyBean.executeUpdate(sqlf);
     %>
     
     <br><div align="center"><font color="red">
                  ���Ǽǵ�ͼ����д�����ݿ��У����ǽ����촦��лл���ĺ�����</font></div><br><br>
         <!--д�����ݿ���ѯ����������豣��  -->
         <table align="center">
         <tr><th>ȱ��Ǽ�</th><th bgcolor=#00ffc0>����</th><th>����</th>
         <th bgcolor=#00ffc0>������</th><th>�Ǽ���</th><th bgcolor=#00ffc0>��������</th>
         
         <th>�Ǽ�ʱ��</th><th bgcolor=#00ffc0>�������</th></tr>
         <%
         //д���ִ�в�ѯ���
         String sql2="select * from shortbook order by re_time desc";
         ResultSet rs=MyBean.executeQuery(sql2);
         while(rs.next())
         {
           out.println("<tr>");
           out.println("<td>"+rs.getString("ShortID")+"</td>");
           out.println("<td bgcolor=#00ff0>"+rs.getString("BookName")+"</td>");
           out.println("<td>"+rs.getString("author")+"</td>");
           out.println("<td bgcolor=#00ff0>"+rs.getString("pubName")+"</td>");
           out.println("<td>"+rs.getString("requestor")+"</td>");
           out.println("<td align=center bgcolor=#00ff0>"+rs.getString("count")+"</td>");
           out.println("<td>"+rs.getString("re_time")+"</td>");
           out.println("<td align='center' bgcolor=#00ff0>"+rs.getString("treated")+"</td>");
           out.println("</tr>");
         }
         rs.close();
          %>
     </table>
  </body>
</html>
