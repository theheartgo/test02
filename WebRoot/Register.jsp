<%@ page language="java"  import="java.util.*" pageEncoding="GBK"%>
<jsp:useBean id="Bean1" class="EBook.CreateID"></jsp:useBean>
<% request.setCharacterEncoding("GBK");%>
<html>

  <body>
    <div align="center">��ǰ��λ��--&gt;<font color="blue">
            �û�ע��&nbsp;&nbsp;</font>
      <font size=4 color=#ff00ff>��ע��󣬾ͳ�Ϊ���ǵļα����������ܸ����Żݣ�</font><br><hr><br>
      <font color="green">Ϊ�������Ǹ��õ�Ϊ����������������д����ı���һ�¸������Ϊ�գ�</font></div>   
       
      <form action ="RegiCheck.jsp" methord="post">
      <table align="center">
      <tr><td align="right">��¼ID��</td>
       <td><input type="number" name="userID" value="<%=Bean1.DateTimeToID()%>"></td>
       <td>&nbsp;&nbsp;</td>
       
       
      <td align="right">��ʵ����</td>
      <td><input type="text" name="realName"></td></tr>
      
      <tr><td align="right">��&nbsp;&nbsp;��&nbsp;&nbsp;</td>
      <td><input type="radio" name="gender" value="��" checked>��
      <input type="radio" name="gender" value="Ů">Ů</td>
      <td>&nbsp;&nbsp;</td>
      
      <td align="right">��������</td>
      <td><input type="text" name="birthdate"></td></tr>
      
      <tr><td align="right">��¼����</td>
      <td ><input type="password" name="pass1"></td>
      <td>&nbsp;&nbsp;</td>
      
      <td align="right">����ȷ��</td>
      <td><input type="password" name="pass2"></td></tr>
      
      <tr><td align="right">�����ʼ�</td>
      <td><input type="text" name="email"></td>
      <td>&nbsp;&nbsp;</td>
      
      <td align="right">��ϵ�绰</td>
      <td><input type="text" name="phone"></td></tr>
      
      <tr><td align="right">�ͻ���ַ</td>
      <td colspan=4>&nbsp;
      <input type="text" name="addr" size="60" maxlength="60"></td></tr>
      
      <tr><td align="right">��Ȥ����</td>
      <td colspan=4>
      <input type="checkbox" name="Interest" value="����">����
      <input type="checkbox" name="Interest" value="����">����
      <input type="checkbox" name="Interest" value="�ƾ�">�ƾ�
      <input type="checkbox" name="Interest" value="����">����
      <input type="checkbox" name="Interest" value="����">����
      <input type="checkbox" name="Interest" value="����">����
      <input type="checkbox" name="Interest" value="����">����</td></tr>
      </table>
       <P align="center"><input type="submit" value="�����"></td>
       &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="reset" value="��&nbsp;��"></P>
      </form>
      <br>
  </body>
</html>
