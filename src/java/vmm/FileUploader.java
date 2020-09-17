package vmm;

import javax.servlet.http.*;
import java.io.*;


public class FileUploader
{

  /**
   * @param request Receives reference of the request object of Servlet/JSP
   * @param absolutefolderpath  Receives absolutepath of folder where file is to be uploaded
   * @return                    returns default name of the file (filename on client side)
   * @throws Exception
   */

  
  public static String savefile(HttpServletRequest request,String absolutefolderpath) throws Exception
  {

              String contentType = request.getContentType();
	      if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
              {
 		DataInputStream in = new DataInputStream(request.getInputStream());
		//we are taking the length of Content type data
		int formDataLength = request.getContentLength();
		byte dataBytes[] = new byte[formDataLength];
		int byteRead = 0;
		int totalBytesRead = 0;
		//this loop converting the uploaded file into byte code
		while (totalBytesRead < formDataLength)
                {
			byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
			totalBytesRead += byteRead;
	        }

		String file = new String(dataBytes);
		//for saving the file name
                String saveFile;

		saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");

		String boundary = contentType.substring(lastIndex + 1,contentType.length());
		int pos;
		//extracting the index of file
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		int startPos = ((file.substring(0, pos)).getBytes()).length;
		int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

                //  out.println("abs path "+ absolutepath);
                //  out.println("sav file  "+saveFile);

		FileOutputStream fileOut = new FileOutputStream(absolutefolderpath+"\\" + saveFile);
		fileOut.write(dataBytes, startPos, (endPos - startPos));
		fileOut.flush();
		fileOut.close();

                return saveFile;
              }
               // out.println("File Uploaded.....");
              return "no file";
      }

  



  /**
   * @param request Receives reference of the request object of Servlet/JSP
   * @param absolutefolderpath  Receives absolutepath of folder where file is to be uploaded
   * @param uploadfilename  Receives upload filename to be set on Server side
   * @throws Exception
   */

  
  public static void savefile(HttpServletRequest request,String absolutefolderpath,String uploadfilename) throws Exception
  {

              String contentType = request.getContentType();
	      if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
              {
 		DataInputStream in = new DataInputStream(request.getInputStream());
		//we are taking the length of Content type data
		int formDataLength = request.getContentLength();
		byte dataBytes[] = new byte[formDataLength];
		int byteRead = 0;
		int totalBytesRead = 0;
		//this loop converting the uploaded file into byte code
		while (totalBytesRead < formDataLength)
                {
			byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
			totalBytesRead += byteRead;
	        }

		String file = new String(dataBytes);
		//for saving the file name
                String saveFile;

		saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");

		String boundary = contentType.substring(lastIndex + 1,contentType.length());
		int pos;
		//extracting the index of file
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		int startPos = ((file.substring(0, pos)).getBytes()).length;
		int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

                //  out.println("abs path "+ absolutepath);
                //  out.println("sav file  "+saveFile);

		FileOutputStream fileOut = new FileOutputStream(absolutefolderpath + "\\" + uploadfilename);
		fileOut.write(dataBytes, startPos, (endPos - startPos));
		fileOut.flush();
		fileOut.close();
              }

               // out.println("File Uploaded.....");
      }

    


}
