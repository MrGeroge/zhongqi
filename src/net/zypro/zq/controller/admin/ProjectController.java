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
import com.sun.org.apache.bcel.internal.generic.NEW;

import net.zypro.zq.bean.Blog;
import net.zypro.zq.bean.BlogCatalog;
import net.zypro.zq.bean.Project;
import net.zypro.zq.bean.ProjectCatalog;
import net.zypro.zq.service.AdminManager;
import net.zypro.zq.service.ServiceFactory;
import net.zypro.zq.service.UserManager;
import net.zypro.zq.util.PageUtil;

@WebServlet("/Admin/Project")
public class ProjectController extends GenericServlet {
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
		request.setAttribute("projects", factory.findAllProjects());
		request.setAttribute("catalogs", factory.findAllProjectCatalogs());
		GoToPage("/WEB-INF/view/admin/project_list.jsp", request, response);
	}
	
	public void DeleteProjectAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		int id=Integer.parseInt(request.getParameter("id"));
		AdminManager factory=ServiceFactory.getAdminManager();
		factory.deleteProject(id);
		
	}
	
	public void UpdateProjectAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		String uid=request.getParameter("uid");
		String id=request.getParameter("id");
		if(uid==null||uid.isEmpty())
		{
			AdminManager factory=ServiceFactory.getAdminManager();
			request.setAttribute("catalogs", factory.findAllProjectCatalogs());
			request.setAttribute("project", factory.getProject(Integer.parseInt(id)));
			request.setAttribute("uid", new Random().nextLong());
			GoToPage("/WEB-INF/view/admin/project_edit.jsp", request, response);
			return;
		}
	    Project project=new Project();
		
		AdminManager factory=ServiceFactory.getAdminManager();
		ProjectCatalog catalog=new ProjectCatalog();
		catalog.setId(Integer.parseInt(request.getParameter("catalog")));
		project.setId(Integer.parseInt(id));
		project.setCatalog(catalog);
        project.setAddress(request.getParameter("address"));
        project.setCover(request.getParameter("cover"));
        project.setFinishDate(request.getParameter("finishDate"));
        project.setName(request.getParameter("name"));
        project.setType(request.getParameter("type"));
        project.setDescription(request.getParameter("description"));
		factory.updateProject(project);
		
		try {
			response.sendRedirect(basePath+"Admin/Project");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void AddProjectAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		String uid=request.getParameter("uid");
		if(uid==null||uid.isEmpty())
		{
			AdminManager factory=ServiceFactory.getAdminManager();
			request.setAttribute("catalogs", factory.findAllProjectCatalogs());
			request.setAttribute("uid", new Random().nextLong());
			GoToPage("/WEB-INF/view/admin/project_add.jsp", request, response);
			return;
		}
		
		Project project=new Project();
		ProjectCatalog catalog=new ProjectCatalog();
		catalog.setId(Integer.parseInt(request.getParameter("catalog")));
		
		project.setCatalog(catalog);
        project.setAddress(request.getParameter("address"));
        project.setCover(request.getParameter("cover"));
        project.setFinishDate(request.getParameter("finishDate"));
        project.setName(request.getParameter("name"));
        project.setType(request.getParameter("type"));
        project.setDescription(request.getParameter("description"));
        AdminManager factory=ServiceFactory.getAdminManager();
        factory.addProject(project);
		try {
			response.sendRedirect(basePath+"Admin/Project");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

    public void AddCatalogAction(HttpServletRequest request,
			   HttpServletResponse response)
    {
    	String catalog=request.getParameter("catalog");
    	String cover=request.getParameter("cover");
    	if(catalog!=null&&(!catalog.isEmpty()))
    	{
    		 AdminManager factory=ServiceFactory.getAdminManager();
    		 ProjectCatalog projectCatalog=new ProjectCatalog();
    		 projectCatalog.setName(catalog);
    		 projectCatalog.setCover(cover);
    	     factory.addProjectCatalog(projectCatalog);
    	}
    	
    	try {
			response.sendRedirect(basePath+"Admin/Project");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	
    public void DeleteCatalogAction(HttpServletRequest request,
			   HttpServletResponse response)
    {
    	String id=request.getParameter("id");
    	
        if(id!=null)
        {
        	AdminManager factory=ServiceFactory.getAdminManager();
        	factory.deleteProjectCatalog(Integer.parseInt(id));
        }
 
    }
    
    public void UpdateCatalogAction(HttpServletRequest request,
			   HttpServletResponse response)
   {
 	  String id=request.getParameter("id");
 	  String catalog=request.getParameter("catalog");
      if(id!=null)
      {
     	AdminManager factory=ServiceFactory.getAdminManager();
     	ProjectCatalog pCatalog=new ProjectCatalog();
     	pCatalog.setId(Integer.parseInt(id));
     	pCatalog.setName(catalog);
     	factory.updateProjectCatalog(pCatalog);
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
