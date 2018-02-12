package net.zypro.zq.controller.admin;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEW;

import net.zypro.zq.bean.*;
import net.zypro.zq.service.AdminManager;
import net.zypro.zq.service.ServiceFactory;
import net.zypro.zq.service.UserManager;

@WebServlet("/Admin/Page")
public class PageController extends GenericServlet {
    private static String basePath;
    private Map<String, String> pageMap=null;
    
    @Override
    public void init()
    {
    	pageMap=new HashMap<String, String>();
    	
    	pageMap.put("introduce", "走进众起");
    	pageMap.put("service", "服务范围");
    	pageMap.put("person", "人力资源");
    	pageMap.put("contact","联系我们");
    }
    
    
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
		String catalog=request.getParameter("catalog");
		
		AdminManager aManager=ServiceFactory.getAdminManager();

	    List<WebPage> pages=aManager.findPages(catalog);
		
	    request.setAttribute("catalog", catalog);
	    request.setAttribute("navTitle", pageMap.get(catalog));
	    request.setAttribute("webPages", pages);
		GoToPage("/WEB-INF/view/admin/web_model_page_list.jsp", request, response);
	}
	
	public void AddAction(HttpServletRequest request,
			   HttpServletResponse response)
	{  
		String uid=request.getParameter("uid");
		String catalog=request.getParameter("catalog");
		
		if(uid==null||uid.isEmpty())
		{
			request.setAttribute("uid",new Random().nextLong());
			request.setAttribute("catalog",catalog);
			GoToPage("/WEB-INF/view/admin/model_page_add.jsp", request, response);
			return;
		}
		
		WebPage page=new WebPage();
		page.setCatalog(catalog);
		page.setPageName(request.getParameter("pageName"));
		page.setTitle(request.getParameter("title"));
		page.setContent(request.getParameter("content"));
		
		AdminManager aManager=ServiceFactory.getAdminManager();
		aManager.addPage(page);
		
		try {
			response.sendRedirect(basePath+"Admin/Page?catalog="+catalog);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void DeleteAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		String  id=request.getParameter("id");
		
		AdminManager aManager=ServiceFactory.getAdminManager();
		aManager.deletePage(Integer.parseInt(id));		
	}
	
	public void UpdateAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		String uid=request.getParameter("uid");
		String  id=request.getParameter("id");
		String catalog=request.getParameter("catalog");

		if(uid==null||uid.isEmpty())
		{
			request.setAttribute("uid",new Random().nextLong());
			request.setAttribute("catalog",catalog);
			AdminManager aManager=ServiceFactory.getAdminManager();
			request.setAttribute("page",aManager.getWebPage(Integer.parseInt(id)));
			GoToPage("/WEB-INF/view/admin/model_page_edit.jsp", request, response);
			return;
		}
		
		WebPage page=new WebPage();
		page.setId(Integer.parseInt(id));
		page.setCatalog(catalog);
		page.setPageName(request.getParameter("pageName"));
		page.setTitle(request.getParameter("title"));
		page.setContent(request.getParameter("content"));
		
		AdminManager aManager=ServiceFactory.getAdminManager();
		aManager.updatePage(page);
		
		
		try {
			response.sendRedirect(basePath+"Admin/Page?catalog="+catalog);
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
