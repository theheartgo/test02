<%@ page contentType="text/html;charset=GBK" import="java.sql.*"%>
<jsp:useBean id="MyBean" scope="session" class="EBook.QueryUpdate"/>

<html> 
  <body>
    <div align="center">��ǰλ��--&gt;
    <font color="blue">����ͼ��</font><br>
    <font color="#ff00ff">���������Ҫ��ͼ�飬����</font>"��������"
    <font color="#ff00ff">�ı��������붩��������Ȼ����</font>"���빺�ﳵ"<br><hr>
    </div>
    
    <table boder=1>
    <%
      //ִ�в�ѯ���
      String buyKey="";
      String sql="SELECT * FROM book ORDER BY Public_date DESC";
      ResultSet rs=MyBean.executeQuery(sql);
      while(rs.next())
      {
        buyKey=rs.getString(1).substring(5,9);
        float yhj1=rs.getFloat(6)*rs.getFloat(9);
        float yhj2=Math.nextUp(yhj1);
        String yhj= String.valueOf(yhj2);
        yhj=yhj.substring(0,6);
        out.println("<tr>");
        out.println("<td bgcolor=#f0f0f0 nowrap='nowrap'>ISBN��</td>");
        out.println("<td>"+rs.getString(1)+"</td>");
        out.println("<td align='center' bgcolor=#f0f0f0 >����</td>");
        out.println("<td>"+rs.getString(2)+"</td>");
        out.println("<td align='center' bgcolor=#f0f0f0 >����</td>");
        out.println("<td>"+rs.getFloat(6)+"</td>");
        out.println("</tr>");
        
        out.println("<tr>");
        out.println("<td align='center' bgcolor=#f0f0f0 nowrap='nowrap' >����</td>");
        out.println("<td>"+rs.getString(3)+"</td>");
        out.println("<td align='center' bgcolor=#f0f0f0 >������</td>");
        out.println("<td>"+rs.getString(4)+"</td>");
        out.println("<td align='center' bgcolor=#f0f0f0 nowrap='nowrap' >����ʱ��</td>");
        out.println("<td colspan=2>"+rs.getString(5)+"</td>");
        out.println("</tr>");
        
        out.println("<tr>");
        out.println("<td align='center' bgcolor=#00ffc0 nowrap='nowrap' >������</td>");
 out.println("<td><input size='5' maxlength='5' type='text' name='buyID' value="+buyKey+"></td>");
        out.println("<td colspan=2><font color=#0000ff>�����Ҫ���飬�뽫�ζ�������������ı���</td>");
        out.println("<td align='center' bgcolor=#00ffc0 >�Żݼ�</td>");
        out.println("<td>"+yhj+"</td>");
        out.println("</tr>");
        
        out.println("<tr>");
        out.println("<td colspan=7 bgcolor=#CACACA>&nbsp;</td>");
        out.println("</tr>");
      }
      rs.close();          
    %>
    </table>
    <form action="servlet/BuyBookServ" method="post">
    <div align="center" style=background:#00ffc0>
        ������<input size="5" maxlength="5" type="text" name="buyID" value="">
    &nbsp;��������<input size="4" maxlength="4" type="number" name="number" value="">&nbsp;
       �û�ID<input type='text' name="UserName" value="">&nbsp;
    <input type="submit" name="cart" value="���빺�ﳵ">
    </div></form> 
  </body>
</html>