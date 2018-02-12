package net.zypro.zq.controller.admin;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.zypro.zq.bean.IndexImage;
import net.zypro.zq.service.AdminManager;
import net.zypro.zq.service.ServiceFactory;

@WebServlet("/Admin/Home")
public class HomeController extends GenericServlet{
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
		AdminManager aManager=ServiceFactory.getAdminManager();
		request.setAttribute("images", aManager.findAllIndexImages());
		GoToPage("/WEB-INF/view/admin/index_image_list.jsp", request, response);		
	}
	
	public void DeleteAction(HttpServletRequest request,
	   HttpServletResponse response)
	{
		String id=request.getParameter("id");
		AdminManager aManager=ServiceFactory.getAdminManager();
		aManager.deleteIndexImage(Integer.parseInt(id));
	}
	
	public void AddAction(HttpServletRequest request,
			   HttpServletResponse response)
	{

		String[] paths=request.getParameterValues("name");
		AdminManager aManager=ServiceFactory.getAdminManager();
		for(String path:paths)
		{
			IndexImage image=new IndexImage();
			image.setPath(path);
			aManager.addIndexImage(image);
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
