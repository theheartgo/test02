<%@ page contentType="text/html;charset=GBK" import="java.sql.*"%>
<jsp:useBean id="MyBean" scope="page" class="EBook.QueryUpdate"/>


<html>
  <body>
    <div align="center">��ǰ��λ��--&gt;
    <font color="blue">�ؼ�ͼ��&nbsp;&nbsp;</font>
    <font color=#ff00ff>��ӭ�����ҵ�������꣡</font><br>
    <font color="blue">��ҳ��ʾ��ͼ�鶼��һ�����Żݣ��벻Ҫ�����</font><hr></div>
    <table align="center" width = "">
    <tr><th>ISBN��</th><th bgcolor =#00ffc0>����</th><th>����</th>
    <th bgcolor =#00ffc0>������</th><th>����ʱ��</th>
    <th bgcolor=#00ffc0>ԭ��</th><th bgcolor=#00ffc0>�Żݼ�</th></tr>
    
    <%
      String sql="select * from book where discount<1.0";//�����ѯ���
      ResultSet rs =MyBean.executeQuery(sql);
      while (rs.next())
      {
        out.println("<tr>");
        out.println("<td>"+rs.getString(1)+"</td>");
        out.println("<td bgcolor=#00ffc0>"+rs.getString(2)+"</td>");
        out.println("<td>"+rs.getString(3)+"</td>");
        out.println("<td bgcolor=#00ffc0>"+rs.getString(4)+"</td>");
        out.println("<td>"+rs.getString(5)+"</td>");
        out.println("<td align=center bgcolor=#00ffc0>"+rs.getDouble(6)+"</td>");
        Double yhj1 = rs.getDouble(6)*rs.getDouble(9);
        Double yhj2=Math.nextUp(yhj1);//�����㹻λ��
        String yhj =yhj2.toString();
        yhj=yhj.substring(0,6);
        out.println("<td>"+yhj+"</td>");
        out.println("</tr>");
        }
        rs.close();
     %>
     </table>
  </body>
</html>
