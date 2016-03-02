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
				Mess="�𾴵�"+usna+",����ûע����!\n";
				Mess=Mess.concat("���ȷ����ť��ȥ�û�ע��ҳ��ע��");
				//JOptionPane.showMessageDialog(JF, Mess, "��ʾ", type);
				response.sendRedirect("../Register.jsp");
				
			}
			
		} 
		catch (Exception e) {out.println("SQL�����쳣��");}
		
		if (flag1.equalsIgnoreCase("OK"))
		try 
		{
				String str="'"+usna+"' and OrderID='"+ordID+"'";
				String sql4="select * from orderdetail where UserID="+str;
				float zhonj=0.0f;int bookNum=0;
				ResultSet rs4=myServ.executeQuery(sql4);
				
				if (rs4.next()==false) 
				{
					Mess="�𾴵�"+reName+"�α���������Ķ����Ų���ȷ������û�ж���!\n";
					Mess=Mess.concat("���ȷ����ťȥ�鿴����ҳ����������");
					//JOptionPane.showMessageDialog(JF, Mess, "��ʾ",type2);
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
					out.print("<tr><td bgcolor=#f0f0f0>������</td>");
					out.print("<td>"+rs4.getString(1)+"</td>");
					out.print("<td bgcolor=#f0f0f0>�û�ID</td>");
					out.print("<td>"+rs4.getString(2)+"</td>");
					out.print("<td bgcolor=#f0f0f0>�������</td>");
					out.print("<td>"+rs4.getString(3)+"</td>");
					out.print("<td bgcolor=#f0f0f0>����</td>");
					out.print("<td>"+rs4.getString(4)+"</td></tr>");
					
					out.print("<tr><td bgcolor=#f0f0f0>��������</td>");
					out.print("<td>"+rs4.getString(5)+"</td>");
					out.print("<td bgcolor=#f0f0f0>����</td>");
					out.print("<td>"+rs4.getString(6)+"</td>");
					out.print("<td bgcolor=#f0f0f0>�µ�ʱ��</td>");
					out.print("<td>"+rs4.getString(7)+"</td>");
					out.print("<td bgcolor=#f0f0f0>С�Ƽ۸�</td>");
					out.print("<td>"+xiaoj+"</td></tr>");
					
					zhonj=zhonj+xiaoj;
					bookNum=bookNum+Integer.parseInt(rs4.getString(5));
					out.print("<td colspan=8 bgcolor=#CACACA>&nbsp;</td>");
				}
				out.print("<tr><td clospan=3 align='right' bgcolor=#00ffc0>����������</td>");
				out.print("<td  align='left' bgcolor=#00ffc0>"+bookNum+"��</td>");
				out.print("<td clospan=2 align='right' bgcolor=#00ffc0>�����ܼƼ۸�</td>");
				out.print("<td clospan=3 align='right' bgcolor=#00ffc0>"+zhonj+"</td></tr>");
				
				out.print("<tr><td bgcolor=#00ffc0>����</td>");
				out.print("<td>"+reName+"</td>");
				out.print("<td bgcolor=#00ffc0>��ϵ�绰</td>");
				out.print("<td>"+phon+"</td>");
				out.print("<td bgcolor=#00ffc0>�ͻ���ַ</td>");
				out.print("<td colspan=3>"+addr+"</td></tr>");
				
				out.print("</table>");
				out.print("<br><div align='center' style=background:#f0f0f0>");
				out.print("<A href='../BuyBook.jsp'>����ͼ��</A>&nbsp;&nbsp;");
				out.print("<A href='../ModiNum.html'>�޸Ķ�������</A>&nbsp;&nbsp;");
				out.print("<A href='../ModiPersInfo.html'>�޸ĸ�������</A>&nbsp;&nbsp;");
				out.print("<A href='../CheckOut.jsp'>ȥ����̨</A></div>");
			
			} catch (Exception e) {out.print("��ѯʧ�ܣ�");}
			out.print("</body>");
			out.print("</html>");
			out.flush();
			out.close();
		}
	}