package EBook;
import java.io.IOException;
import java.io.PrintWriter;
import javax.swing.*;
import java.sql.ResultSet;
import EBook.CreateID;
import EBook.QueryUpdate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BuyBookServ extends HttpServlet
{
	private static final long serialVersionUID=1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
		response.setContentType("text/html;charset=GBK");
		PrintWriter out=response.getWriter();//�����ͻ��������ݵ������
		String buyid=request.getParameter("buyID");
		String coun=request.getParameter("number");
		String usna=request.getParameter("UserName");
		
		HttpSession sess=request.getSession(true);//�����ͻ��Ự����
		sess.setAttribute("rs1", usna);
		sess.setAttribute("rs2", buyid);
		
		int type=JOptionPane.WARNING_MESSAGE;
		int type2=JOptionPane.PLAIN_MESSAGE;
		String Message="";
	    JFrame jf=new JFrame("OptionPane");
	    
	    if(Integer.parseInt(coun)<=0)
	    {
	    	Message="��������С�ڵ���0 ����\n";
	    	Message=Message.concat("���'ȷ��'��ť������'����ͼ��'ҳ����������\n");
	    	JOptionPane.showMessageDialog(jf, Message,"������ʾ",type);
	    	response.sendRedirect("../BuyBook.jsp");
	    }
	    else
	    {
	    	String bookNa="";
	    	float pr=0;
	    	String flag1="",flag2="";//������ѯ�ɹ����ı�־
	    	CreateID cid=new CreateID();
	    	String subTime=cid.DateTime1();
	    	
	    	QueryUpdate myServ=new QueryUpdate();
	    	
	    	String sql1="SELECT * FROM users WHERE LogName='"+usna+"'";
	    	try
	    	{
	    		//��ѯ�û�ID�Ƿ���ע��
	    		ResultSet rs1=myServ.executeQuery(sql1);
	    		if(rs1.next()==false)
	    		{
	    			Message="�𾴵�"+usna+",�㻹û��ע�ᣡ";
	    			Message=Message.concat("���'ȷ��'��ť������'�û�ע��'ҳ�����ע��\n");
	    			JOptionPane.showMessageDialog(jf, Message,"������ʾ",type);
	    			response.sendRedirect("../Register.jsp");
	    		}
	    		else
	    		{
	    			flag1="OK"; 
	    			rs1.close();
	    		}
	    	}
	    	catch(Exception e) {
	    		out.println("SQL�����쳣le!");
	    		}
	    	
	    	String sql2="SELECT * FROM book";
	    	try
	    	{
	    		//��ѯͼ�鶩�����Ƿ���ȷ,��ȷʱ�ٻ�ȡ�����ֶε�ֵ
	    		ResultSet rs2=myServ.executeQuery(sql2);
	    		while(rs2.next())
	    		{
	    			String str = rs2.getString(1).substring(5,9);
	    			if(str.equalsIgnoreCase(buyid))
	    			{
	    				sess.setAttribute("rs3", rs2.getString(1));
	    				bookNa=rs2.getString(2);
	    				pr=rs2.getFloat(6)*rs2.getFloat(9);
	    				flag2="OK";
	    				rs2.close();
	    				break;
	    			}
	    			else continue;
	    		}
	    		if(!flag2.equalsIgnoreCase("OK"))
	            {
	    			Message="������"+buyid+",�������Ǹ����Ķ����ţ�\n";
	    			Message=Message.concat("���'ȷ��'��ť���ص�'����ͼ��'ҳ��\n");
	    			JOptionPane.showMessageDialog(jf, Message,"������ʾ",type);
	    			response.sendRedirect("../BuyBook.jsp");
	    		}	    		
	    	}
	    	catch(Exception e)
	    	{
	    		out.println("SQL�����쳣??");
	    	}
	    	
	    	if(flag1.equalsIgnoreCase("OK")&&flag2.equalsIgnoreCase("OK"))
	    	{
	    		//������ѯ��־���ɹ� д�����ݿ�
	    		String ordID=cid.DateToID();
	    		sess.setAttribute("rs4", ordID);
	    		
	    		int count=Integer.parseInt(coun,10);
	    		out.print(ordID+"<br>");
	    		out.print(usna+"<br>");
	    		out.print(buyid+"<br>");
	    		out.print(bookNa+"<br>");
	    		out.print(count+"<br>");
	    		out.print(pr+"<br>");
	    		out.print(subTime+"<br>");
	    		String s="'"+ordID+"','"+usna+"','"+buyid+"','"+bookNa+"','"+count+"','"+pr+"','"+subTime+"'";
	    		String sql3="insert into orderdetail values("+s+")";
	    		try
	    		{
	    			myServ.executeUpdate(sql3);
	    			Message="�𾴵�"+usna+",��Ķ����ѷ��빺�ﳵ��\n";
	    			Message=Message.concat("���'ȷ��'��ť���鿴���ﳵ�е�ȫ������\n");
	    			JOptionPane.showMessageDialog(jf, Message,"OK",type2);
	    			//�ض�����ʾ���ﳵ��ͼ���ҳ��
	    			RequestDispatcher reqDisq=request.getRequestDispatcher("../OrderCart.jsp");
	    			reqDisq.forward(request,response);
	    	
	    		}
	    		catch(Exception e)
	    		{
	    			out.println("���ֲ���д����쳣��");	    			
	    		} 		
	    	}  	
	    }  	
	}
}
