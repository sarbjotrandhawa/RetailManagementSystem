package vmm;
import java.io.*;
import java.net.Socket;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletResponse;
public class sender_sms1 implements Runnable
{
	String phno;
        String type;
//	final String smsuserid="2000036319";
//	final String smspassword="vmmsmsserver";
	Thread t;
	Socket sock;
	PrintWriter pw;
	DataInputStream dis;
	String message;
	String actualchar[]={"%","<",">","~",".","\"","{","}","|","\\","-","\'","_","^"," "};
	String encchar[]={"%25","%3C","%3E","%7E","%2E","%22","%7B","%7D","%7C","%5C","%2D","%60","%5F","%5E","%20"};
	String encmessage;
	String chartoreplace;
        String res;
        int conlen=0;
	public sender_sms1(String phno,String message)
	{
        	this.phno = phno;
		this.message=message;
               
		for(int i=0;i<actualchar.length;i++)
		{
			message=message.replace(actualchar[i],encchar[i]);
		}
		System.out.println("New Encoded String\n"+ message);
		encmessage=message;
                t=new Thread(this);
		t.start();
	}
	public void run()
	{
		System.out.println("New Message is "+ encmessage);
		String url="/GatewayAPI/rest?v=1.1&method=sendMessage&auth_scheme=PLAIN&userid=2000036319&password=vsssmsserver&msg="+ encmessage +"&msg_type=text&send_to="+phno;
		System.out.println("URL is "+url);
		try
		{
        	   sock=new Socket("enterprise.smsgupshup.com", 80);
		   pw=new PrintWriter(sock.getOutputStream());
		   dis=new DataInputStream(sock.getInputStream());
		   pw.println("GET "+ url +" HTTP/1.1");
		   pw.println("Host: enterprise.smsgupshup.com");
		   pw.println("Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/x-shockwave-flash, */*");
		   pw.println("Accept-Language: en-us");
		   pw.println("User-Agent: Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)");
		   pw.println();
		   pw.flush();
			
		   while(true)
		     {
        	       res=dis.readLine();
                       System.out.println("res::::::::::::::::::::::::::::"+res);
         	       if(res.equals(""))
                        {
	        	  break;
                        }

                       if(res.indexOf("Content-Length")!=-1)
			{
			  StringTokenizer st=new StringTokenizer(res,": ");
			  st.nextToken();
			  conlen= Integer.parseInt(st.nextToken());
			}
			}
			int count=0,r;
			byte b[]=new byte[conlen];
			while(true)
			{
				r=dis.read(b,0,conlen);
				System.out.print( new String(b) );
				count=count+r;
				if(count==conlen)
				break;
			}
		}
		catch(Exception ex)
		{
		        ex.printStackTrace();
		}
	}
}
