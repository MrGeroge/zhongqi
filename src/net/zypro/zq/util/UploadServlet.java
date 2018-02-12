package net.zypro.zq.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.json.JSONObject;

@WebServlet("/upload")
// �����ڴ滺�����ķ�ֵΪ10M
// �����ϴ��ļ������������Ϊ10M��Ĭ��ֵΪ-1����ʾû�����ƣ�
@MultipartConfig(fileSizeThreshold=0xA00000,
    maxFileSize=0xA00000)
public class UploadServlet extends HttpServlet
{
  private static final long serialVersionUID = 1L;

  protected void service(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException
  {
    response.setContentType("application/json;charset=UTF-8");
    
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    
    PrintWriter out = response.getWriter();
    // �õ����������е�Part����
    Collection<Part> parts = request.getParts();

    for(Part part : parts)
    {
        if(part.getContentType() != null)
        {
    	
        String fileName = getFileName(part);
        
        String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
   
        // ���ļ����浽WebӦ�ó����Ŀ¼�µ�uploadFilesĿ¼��
        File file = new File(getServletContext().getRealPath("/uploadFiles"));
        if(!file.exists())
             file.mkdir();
        
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
        String filePath=file.getPath() + "/"+newFileName;
        part.write(filePath);
        
        
        JSONObject obj = new JSONObject();
		obj.put("error", 0);
		obj.put("url", basePath +"uploadFiles/"+newFileName);
		out.println(obj.toString()); 
      }
           
    }
    out.close();
  }
  
  /**
   * ����Part����ı�ͷֵ���õ��ϴ��ļ����ļ���
   * @param part �����ļ���Part����
   * @return �ļ���
   */
  private String getFileName(Part part)
  {
    String headerValue = part.getHeader("content-disposition");
    int index = headerValue.lastIndexOf("filename");
    String fileName = null;
    if(index != -1)
    {
      // ��ȡ filename=" ֮������� 
      fileName = headerValue.substring("filename=".length() + index);
      // ȥ������˫����
      fileName = fileName.substring(0, fileName.length() - 1); 
      // ȥ���ļ���ǰ���·������
      fileName = fileName.substring(fileName.lastIndexOf('\\') + 1);
      
    }	
    return fileName;
  }
}
