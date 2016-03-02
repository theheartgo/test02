package EBook;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JFrame;
import javax.swing.JOptionPane;



public class OrderShowServ extends HttpServlet
{
	private static final long serialVersionUID=1L;
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		String ordID = request.getParameter("OrderID");
		String usna=request.getParameter("UserID");
		
		
		int type = JOptionPane.WARNING_MESSAGE;
		int type2 = JOptionPane.PLAIN_MESSAGE;
		String Mess = "";
		JFrame JF = new JFrame("OptionPane");
		String reName = "",addr = "",phon = "";
		String flag1 = "";
		
		QueryUpdate myServ=new QueryUpdate();
		String sql1="select * from users where LogName ='"+usna+"'";
		try 
		{
			ResultSet rs1=myServ.executeQuery(sql1);
			if(rs1.next()!=false)
			{
				reName=rs1.getString(2);addr=rs1.getString(7);
				phon=rs1.getString(8);flag1="OK";rs1.close();
				
			}
			else
			{
				Mess="尊敬的"+usna+",您还没注册呢!\n";
				Mess=Mess.concat("点击确定按钮，去用户注册页面注册");
				//JOptionPane.showMessageDialog(JF, Mess, "警示", type);
				response.sendRedirect("../Register.jsp");
				
			}
			
		} 
		catch (Exception e) {out.println("SQL出现异常！");}
		
		if (flag1.equalsIgnoreCase("OK"))
		try 
		{
				String str="'"+usna+"' and OrderID='"+ordID+"'";
				String sql4="select * from orderdetail where UserID="+str;
				float zhonj=0.0f;int bookNum=0;
				ResultSet rs4=myServ.executeQuery(sql4);
				
				if (rs4.next()==false) 
				{
					Mess="尊敬的"+reName+"嘉宾，您输入的订单号不正确或者您没有订单!\n";
					Mess=Mess.concat("点击确定按钮去查看订单页面重新输入");
					//JOptionPane.showMessageDialog(JF, Mess, "提示",type2);
					response.sendRedirect("../OrderLook.html");
					
				}
				out.println("<html>");
				out.println("<head><title>A Servlet</title></head>");
				out.println("<body>");
				out.println("<table norder=1>");
				rs4.beforeFirst();
				while (rs4.next())
				{				 
					float xiaoj=Integer.parseInt(rs4.getString(5))*Float.parseFloat(rs4.getString(6));
					out.print("<tr><td bgcolor=#f0f0f0>订单号</td>");
					out.print("<td>"+rs4.getString(1)+"</td>");
					out.print("<td bgcolor=#f0f0f0>用户ID</td>");
					out.print("<td>"+rs4.getString(2)+"</td>");
					out.print("<td bgcolor=#f0f0f0>订购书号</td>");
					out.print("<td>"+rs4.getString(3)+"</td>");
					out.print("<td bgcolor=#f0f0f0>书名</td>");
					out.print("<td>"+rs4.getString(4)+"</td></tr>");
					
					out.print("<tr><td bgcolor=#f0f0f0>订购数量</td>");
					out.print("<td>"+rs4.getString(5)+"</td>");
					out.print("<td bgcolor=#f0f0f0>单价</td>");
					out.print("<td>"+rs4.getString(6)+"</td>");
					out.print("<td bgcolor=#f0f0f0>下单时间</td>");
					out.print("<td>"+rs4.getString(7)+"</td>");
					out.print("<td bgcolor=#f0f0f0>小计价格</td>");
					out.print("<td>"+xiaoj+"</td></tr>");
					
					zhonj=zhonj+xiaoj;
					bookNum=bookNum+Integer.parseInt(rs4.getString(5));
					out.print("<td colspan=8 bgcolor=#CACACA>&nbsp;</td>");
				}
				out.print("<tr><td clospan=3 align='right' bgcolor=#00ffc0>本单共购书</td>");
				out.print("<td  align='left' bgcolor=#00ffc0>"+bookNum+"册</td>");
				out.print("<td clospan=2 align='right' bgcolor=#00ffc0>本单总计价格</td>");
				out.print("<td clospan=3 align='right' bgcolor=#00ffc0>"+zhonj+"</td></tr>");
				
				out.print("<tr><td bgcolor=#00ffc0>姓名</td>");
				out.print("<td>"+reName+"</td>");
				out.print("<td bgcolor=#00ffc0>联系电话</td>");
				out.print("<td>"+phon+"</td>");
				out.print("<td bgcolor=#00ffc0>送货地址</td>");
				out.print("<td colspan=3>"+addr+"</td></tr>");
				
				out.print("</table>");
				out.print("<br><div align='center' style=background:#f0f0f0>");
				out.print("<A href='../BuyBook.jsp'>订购图书</A>&nbsp;&nbsp;");
				out.print("<A href='../ModiNum.html'>修改订购数量</A>&nbsp;&nbsp;");
				out.print("<A href='../ModiPersInfo.html'>修改个人资料</A>&nbsp;&nbsp;");
				out.print("<A href='../CheckOut.jsp'>去结账台</A></div>");
			
			} catch (Exception e) {out.print("查询失败！");}
			out.print("</body>");
			out.print("</html>");
			out.flush();
			out.close();
		}
	}