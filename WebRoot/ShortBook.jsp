<%@ page contentType="text/html; charset=GBK" import="EBook.*"%>
<jsp:useBean id="ComBean" scope="session" class="EBook.CreateID"></jsp:useBean>
<html> 
  <body>
     <div align="center">��ǰ��λ��--&gt;<font color="blue">
           ȱ��Ǽ�&nbsp;&nbsp;</font>
      <font size=4 color=#ff00ff>����Ϊȱ��������Ҫ��ͼ����е����Ǹ�⣡</font><br>
      <font color="blue">������д����ı�����ǽ�����Ϊ������ͼ�飡</font><hr></div>    
      <form action ="WriteShortBook.jsp" methord="post">
      <table align="center">
      <tr><td align="right">ȱ��Ǽ�ID��</td><td align="center">
      <input type="text" name="shortid" value="<%=ComBean.DateTimeToID()%>" readonly="readonly"></td></tr>
      <tr><td align="right">����������</td>
      <td align ="left"><input type="text" name="bookname"></td></tr>
      <tr><td align="right">��������������</td>
      <td align ="left"><input type="text" name="authorname"></td></tr>
          <tr><td align="right">���������������</td>
      <td align ="left"><input type="text" name="publishname"></td></tr>
          <tr><td align="right">��������������</td>
      <td align ="left"><input type="text" name="requetorname"></td></tr>
          <tr><td align="right">����������Ҫ������</td>
      <td align ="left"><input type="number" name="counter"></td></tr>
          <tr><td align="right">ȱ��Ǽ�ʱ��</td>
      <td align ="left"><input type="text" name="dti" value="<%=ComBean.DateTime0()%>" readonly="readonly"></td></tr>
      <tr><td bgcolor =#f0f0f0 colspan=2>&nbsp;</td></tr>
      
      <tr><td align="center"><input type="submit" name="subm" value="�����"></td>
      <td align="center"><input type="reset" name="subm" value="����"></td></tr>
      </table>
      </form>
  </body>
</html>
