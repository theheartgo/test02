<%@ page contentType="text/html; charset=GBK" import="EBook.*"%>
<jsp:useBean id="ComBean" scope="session" class="EBook.CreateID"></jsp:useBean>
<html> 
  <body>
     <div align="center">当前的位置--&gt;<font color="blue">
           缺书登记&nbsp;&nbsp;</font>
      <font size=4 color=#ff00ff>我们为缺少您所需要的图书而感到深表歉意！</font><br>
      <font color="blue">亲您填写下面的表格，我们将尽快为您订购图书！</font><hr></div>    
      <form action ="WriteShortBook.jsp" methord="post">
      <table align="center">
      <tr><td align="right">缺书登记ID号</td><td align="center">
      <input type="text" name="shortid" value="<%=ComBean.DateTimeToID()%>" readonly="readonly"></td></tr>
      <tr><td align="right">请输入书名</td>
      <td align ="left"><input type="text" name="bookname"></td></tr>
      <tr><td align="right">请输入作者姓名</td>
      <td align ="left"><input type="text" name="authorname"></td></tr>
          <tr><td align="right">请输入出版社名称</td>
      <td align ="left"><input type="text" name="publishname"></td></tr>
          <tr><td align="right">请输入您的姓名</td>
      <td align ="left"><input type="text" name="requetorname"></td></tr>
          <tr><td align="right">请输入您需要的数量</td>
      <td align ="left"><input type="number" name="counter"></td></tr>
          <tr><td align="right">缺书登记时间</td>
      <td align ="left"><input type="text" name="dti" value="<%=ComBean.DateTime0()%>" readonly="readonly"></td></tr>
      <tr><td bgcolor =#f0f0f0 colspan=2>&nbsp;</td></tr>
      
      <tr><td align="center"><input type="submit" name="subm" value="填好了"></td>
      <td align="center"><input type="reset" name="subm" value="重填"></td></tr>
      </table>
      </form>
  </body>
</html>
