package net.zypro.zq.controller.admin;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.impl.encoding.CodeSetConversion.CTBConverter;
import com.sun.corba.se.spi.orb.StringPair;
import com.sun.org.apache.bcel.internal.generic.NEW;

import net.zypro.zq.bean.Blog;
import net.zypro.zq.bean.BlogCatalog;
import net.zypro.zq.bean.Project;
import net.zypro.zq.bean.ProjectCatalog;
import net.zypro.zq.bean.ProjectImage;
import net.zypro.zq.service.AdminManager;
import net.zypro.zq.service.ServiceFactory;
import net.zypro.zq.service.UserManager;
import net.zypro.zq.util.PageUtil;

@WebServlet("/Admin/Image")
public class ImageController extends GenericServlet {
    private static String basePath;
	
	@Override
	public void service(ServletRequest arg0, ServletResponse arg1)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest)arg0;
		HttpServletResponse response=(HttpServletResponse)arg1;
		String path = request.getContextPath();
		basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		request.setCharacterEncoding("UTF-8");
		String action=request.getParameter("action");
		
		if(action==null||action.isEmpty())
		{
			action="List";
		}
		
		//根据action转发请求
        try {
        	
			Method actionMethod=this.getClass().getMethod(action+"Action",HttpServletRequest.class,HttpServletResponse.class);
			actionMethod.invoke(this,request, response);
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    
	public void ListAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		AdminManager factory=ServiceFactory.getAdminManager();
		
		String id=request.getParameter("id");
		
		if(id!=null)
		{
			request.setAttribute("images", factory.findImagesByProject(Integer.parseInt(id)));
		}else {
			request.setAttribute("images", factory.findAllImages());
		}		
		GoToPage("/WEB-INF/view/admin/image_list.jsp", request, response);
	}
	
	public void DeleteImageAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		int id=Integer.parseInt(request.getParameter("id"));
		AdminManager factory=ServiceFactory.getAdminManager();
		factory.deleteImage(id);
	}

	public void AddImageAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		String uid=request.getParameter("uid");
		
		if(uid==null)
		{
			String[] paths=request.getParameterValues("name");
			request.setAttribute("uid",new Random().nextLong());
			request.setAttribute("paths", paths);
			request.setAttribute("id", request.getParameter("id"));
			GoToPage("/WEB-INF/view/admin/image_add.jsp", request, response);
			return;
		}
		
		AdminManager factory=ServiceFactory.getAdminManager();
		Project project=new Project();
		project.setId(Integer.parseInt(request.getParameter("id")));
		String[] urls=request.getParameterValues("url");
		String[] descs=request.getParameterValues("description");
		for(int i=0;i!=urls.length;i++)
		{
			ProjectImage image=new ProjectImage();
			image.setPath(urls[i]);
			image.setProject(project);
			image.setDescription(descs[i]);
			image.setProject(project);
			factory.addImage(image);
		}
		
		try {
			response.sendRedirect(basePath+"Admin/Project");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
 
	private void GoToPage(String url,HttpServletRequest request,
			   HttpServletResponse response)
	{
		   RequestDispatcher rd=null;
		   rd = request.getRequestDispatcher(url);
	       try {
			rd.forward(request,response);
			
		   } catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		   }
	}
}
