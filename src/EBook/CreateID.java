package EBook;
import java.util.*;
import java.util.Date;
import java.text.SimpleDateFormat;


public class CreateID {
	public String DateTime0()
	{
		//������-��-�� ʱ-�ָ�ʽ��ʱ��
		String dt="";
		Date now = new Date();
		SimpleDateFormat dfn = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		dt=dfn.format(now).toString();
		return (dt);
	}
	
	public String DateTime1()
	{
		//������-��-�� ʱ-��-���ʽ��ʱ��
		String dt="";
		Date now = new Date();
		SimpleDateFormat dfn = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		dt=dfn.format(now).toString();
		return (dt);
	}

	public String DateTime2()
	{
		String asub="",bsub="",tin="";
		tin=this.DateTime1();//����time1��������ʱ��
		asub=tin.substring(0,4);
		bsub=bsub.concat(asub);
		bsub.concat("��");
		asub=tin.substring(5,7);
		bsub=bsub.concat(asub);
		bsub.concat("��");
		asub=tin.substring(8,10);
		bsub=bsub.concat(asub);
		bsub.concat("��");
		asub=tin.substring(11,13);
		bsub=bsub.concat(asub);
		bsub.concat("ʱ");
		asub=tin.substring(14,16);
		bsub=bsub.concat(asub);
		bsub.concat("��");
		asub=tin.substring(17,19);
		bsub=bsub.concat(asub);
		bsub.concat("��");
		//System.out.println("bsub");
		return (bsub);
	}
	public String DateTimeToID()
	{
		//������ʱ��ת��ΪId�ŵķ���
		String asub="",bsub="",tin="";
		int i=0,k=0;
		/*��ʼʹ�õ��ǰ�λ��ȡ��������ѭ���滻
		Date now = new Date();
		SimpleDateFormat dfn = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		tin=dfn.format(now).toString();
		asub=tin.substring(2,4); bsub=bsub.concat(asub);
		asub=tin.substring(5,7); bsub=bsub.concat(asub);
		asub=tin.substring(8,10); bsub=bsub.concat(asub);
		asub=tin.substring(11,13); bsub=bsub.concat(asub);
		asub=tin.substring(14,16); bsub=bsub.concat(asub);
		asub=tin.substring(17,19); bsub=bsub.concat(asub);*/
		tin=this.DateTime1();
		for(i=2,k=4;i<19;i=i+3,k=k+3)
		{
			asub=tin.substring(i,k); bsub=bsub.concat(asub);
		}
		return (bsub);
	}
	public String DateToID()
	{
		//������ת��Ϊ������
		String asub="",bsub="",tin="";
		int i=0,k=0;
		tin=this.DateTime1();
		for(i=2,k=4;i<11;i=i+3,k=k+3)
		{
			asub=tin.substring(i,k); bsub=bsub.concat(asub);
		}
		return (bsub);
	}
	public String CreateRand()//���������
	{
		String sRand =" ",rand=" ";
		Random random= new Random();
		for (int i=0;i<5;i++)
		{
			rand = String.valueOf(random.nextInt(10));
			sRand=sRand.concat(rand);
		}
		return (sRand);
	}
	
}
