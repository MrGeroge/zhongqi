package net.zypro.zq.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEW;

import net.zypro.zq.bean.Blog;
import net.zypro.zq.bean.BlogCatalog;
import net.zypro.zq.bean.Message;
import net.zypro.zq.bean.Project;
import net.zypro.zq.bean.ProjectCatalog;
import net.zypro.zq.bean.WebPage;
import net.zypro.zq.service.ServiceFactory;
import net.zypro.zq.service.UserManager;
import net.zypro.zq.util.PageUtil;

@WebServlet("/Home")
public class HomeController extends GenericServlet {
    private Map<String, String> navTitle;
    
    @Override
    public void init()
    {
    	navTitle=new HashMap<String, String>();
    	
    	navTitle.put("Introduce", "走进众启");
    	navTitle.put("Service", "服务范围");
    	navTitle.put("Person", "人力资源");
    	navTitle.put("Contact", "联系我们");
    }
	
	@Override
	public void service(ServletRequest arg0, ServletResponse arg1)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest)arg0;
		HttpServletResponse response=(HttpServletResponse)arg1;
		request.setCharacterEncoding("UTF-8");
		String action=request.getParameter("action");
		
		if(action==null||action.isEmpty())
		{
			action="Index";
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
    
	public void IndexAction(HttpServletRequest request,
            HttpServletResponse response)
	{
		UserManager uManager=ServiceFactory.getUserManager();
	    request.setAttribute("news", uManager.getLastestBlogs());
		request.setAttribute("projects",uManager.findProjectsRandom());
		request.setAttribute("images", uManager.findAllIndexImages());
	    GoToPage("/WEB-INF/view/home/index.jsp", request, response);
	}
	
	public void BlogAction(HttpServletRequest request,
    HttpServletResponse response)
    {
		    //取得参数
		    String catalog=request.getParameter("catalog");
		    String beignIndex=request.getParameter("index");
		    
		    //分页
		    PageUtil page=new PageUtil();
		    page.setEveryPage(10);
		    if(beignIndex==null||beignIndex.isEmpty())
		    	page.setBeginIndex(0);
		    else {
				page.setBeginIndex(Integer.parseInt(beignIndex));
			}
		    
		    UserManager uManager=ServiceFactory.getUserManager();
		    List<BlogCatalog> catalogs=uManager.findAllBlogCatalogs();
		    if(catalog==null||catalog.isEmpty())
		    {
		    	catalog=String.valueOf(catalogs.iterator().next().getId());
		    }
		    
		    List<Blog> blogs=uManager.findBlogWithPage(page,Integer.parseInt(catalog));
		    
		    request.setAttribute("catalogs", catalogs);
		    request.setAttribute("blogs", blogs);
		    request.setAttribute("page", page);
		    request.setAttribute("currentCata", catalog);
		    
            GoToPage("/WEB-INF/view/home/blog.jsp", request, response);
    }
	
	public void BlogDetailAction(HttpServletRequest request,
		    HttpServletResponse response)
	{
		  //取得参数
	      String id=request.getParameter("id");
	      if(id==null||id.isEmpty())
	      {
	    	  BlogAction(request, response);
	      }
	      UserManager uManager=ServiceFactory.getUserManager();
	      Blog blog=uManager.getBolg(Integer.parseInt(id));
	      request.setAttribute("catalogs", uManager.findAllBlogCatalogs());
	      request.setAttribute("blog", blog);
	      GoToPage("/WEB-INF/view/home/blog_detail.jsp", request, response);
    }
	
	public void ProjectAction(HttpServletRequest request,
		    HttpServletResponse response)
	{
		  String catalog=request.getParameter("catalog");
		  UserManager uManager=ServiceFactory.getUserManager();
		  List<ProjectCatalog> catalogs=uManager.findAllProjectCatalogs();
		  if(catalog==null||catalog.isEmpty())
		  {
		    	catalog=String.valueOf(catalogs.iterator().next().getId());
		  }
		  ProjectCatalog pCatalog=new ProjectCatalog();
		  pCatalog.setId(Integer.parseInt(catalog));
		  List<Project> projects=uManager.findProjectWithCatalog(pCatalog);
		  
		  request.setAttribute("currentCatalog", pCatalog);
		  request.setAttribute("catalogs",catalogs);
		  request.setAttribute("projects", projects);
		  
		  GoToPage("/WEB-INF/view/home/project.jsp", request, response);
	}
	
	public void ProjectDetailAction(HttpServletRequest request,
		    HttpServletResponse response)
	{
	      String id=request.getParameter("id");
	      UserManager uManager=ServiceFactory.getUserManager();
	      request.setAttribute("images", uManager.findImagesWithProject(Integer.parseInt(id)));
	      request.setAttribute("project", uManager.getProject(Integer.parseInt(id)));
	      GoToPage("/WEB-INF/view/home/project_detail.jsp", request, response);
	}
	
	public void PageAction(HttpServletRequest request,
		    HttpServletResponse response)
	{
		 String catalog=request.getParameter("catalog");
		 String id=request.getParameter("id");
		 
		 UserManager userManager=ServiceFactory.getUserManager();
		 List<WebPage> headers=userManager.findHeaders(catalog);
		 
		 if(id==null||id.isEmpty())
		 {
			 id=String.valueOf(headers.iterator().next().getId());
		 }
		 
		 
		 request.setAttribute("navTitle",navTitle.get(catalog));
		 request.setAttribute("catalog", catalog);
		 request.setAttribute("pages", headers);
		 request.setAttribute("webPage", userManager.getWebPage(Integer.parseInt(id)));
	     
		 GoToPage("/WEB-INF/view/home/web_model_page.jsp", request, response);
	}
	
	public void ContactAction(HttpServletRequest request,
		    HttpServletResponse response)
	{
	      String id=request.getParameter("id");
	      
	      if(id==null||id.isEmpty())
             id="1";
	    	   
	      if(id.equals("1"))
	      {
	    	  GoToPage("/WEB-INF/view/home/contact.jsp", request, response);
	      }
	      
	      if(id.equals("2"))
	      {
	    	  GoToPage("/WEB-INF/view/home/message.jsp", request, response);
	      }
	}
	
	public void AddMessageAction(HttpServletRequest request,
		    HttpServletResponse response)
	{
		  String title=request.getParameter("title");
		  String content=request.getParameter("content");
		  System.out.println(content);
		  String contact=request.getParameter("contact");
		  Message mesg=new Message();
		  mesg.setTitle(title);
		  mesg.setContent(content);
		  mesg.setContact(contact);
		  
		  UserManager uManager=ServiceFactory.getUserManager();
		  uManager.addMessage(mesg);
		  
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
