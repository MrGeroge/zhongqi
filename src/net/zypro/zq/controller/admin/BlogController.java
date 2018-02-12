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

import org.json.JSONObject;

import com.sun.corba.se.impl.encoding.CodeSetConversion.CTBConverter;
import com.sun.org.apache.bcel.internal.generic.NEW;

import net.zypro.zq.bean.Blog;
import net.zypro.zq.bean.BlogCatalog;
import net.zypro.zq.service.AdminManager;
import net.zypro.zq.service.ServiceFactory;
import net.zypro.zq.service.UserManager;
import net.zypro.zq.util.PageUtil;

@WebServlet("/Admin/Blog")
public class BlogController extends GenericServlet {
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
		request.setAttribute("blogs", factory.findAllBlogs());
		request.setAttribute("catalogs", factory.findAllBlogCatalogs());
		GoToPage("/WEB-INF/view/admin/blog_list.jsp", request, response);
	}
	
	public void DeleteBlogAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		int id=Integer.parseInt(request.getParameter("id"));
		AdminManager factory=ServiceFactory.getAdminManager();
		factory.deleteBlog(id);
	}
	
	public void UpdateBlogAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		String uid=request.getParameter("uid");
		String id=request.getParameter("id");
		if(uid==null||uid.isEmpty())
		{
			AdminManager factory=ServiceFactory.getAdminManager();
			request.setAttribute("catalogs", factory.findAllBlogCatalogs());
			request.setAttribute("blog", factory.getBolg(Integer.parseInt(id)));
			request.setAttribute("uid", new Random().nextLong());
			GoToPage("/WEB-INF/view/admin/blog_edit.jsp", request, response);
			return;
		}
	    
		Blog blog=new Blog();
		BlogCatalog catalog=new BlogCatalog();
		catalog.setId(Integer.parseInt(request.getParameter("catalog")));
		blog.setBlogCatalog(catalog);
		blog.setId(Integer.parseInt(id));
        blog.setClickNumber(Integer.parseInt(request.getParameter("clickNumber")));
        blog.setDate(new Date());
        blog.setContent(request.getParameter("content"));
        blog.setKeywords(request.getParameter("keywords"));
        blog.setSource(request.getParameter("author"));
        blog.setTitle(request.getParameter("title"));
		
		AdminManager factory=ServiceFactory.getAdminManager();
		factory.updateBlog(blog);
		
		try {
			response.sendRedirect(basePath+"Admin/Blog");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void AddBlogAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		String uid=request.getParameter("uid");
		if(uid==null||uid.isEmpty())
		{
			AdminManager factory=ServiceFactory.getAdminManager();
			request.setAttribute("catalogs", factory.findAllBlogCatalogs());
			request.setAttribute("uid", new Random().nextLong());
			GoToPage("/WEB-INF/view/admin/blog_add.jsp", request, response);
			return;
		}
		
		Blog blog=new Blog();
		BlogCatalog catalog=new BlogCatalog();
		catalog.setId(Integer.parseInt(request.getParameter("catalog")));
		blog.setBlogCatalog(catalog);
		
        blog.setClickNumber(0);
        blog.setDate(new Date());
        blog.setContent(request.getParameter("content"));
        blog.setKeywords(request.getParameter("keywords"));
        blog.setSource(request.getParameter("author"));
        blog.setTitle(request.getParameter("title"));
        
        AdminManager factory=ServiceFactory.getAdminManager();
        factory.addBlog(blog);
		try {
			response.sendRedirect(basePath+"Admin/Blog");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

    public void AddCatalogAction(HttpServletRequest request,
			   HttpServletResponse response)
    {
    	String catalog=request.getParameter("catalog");
    	
    	if(catalog!=null&&(!catalog.isEmpty()))
    	{
    		 AdminManager factory=ServiceFactory.getAdminManager();
    		 BlogCatalog blogCatalog=new BlogCatalog();
    		 blogCatalog.setName(catalog);
    	     factory.addBlogCatalog(blogCatalog);
    	     
    	     request.setAttribute("status", "success");
    	     request.setAttribute("message",String.valueOf(blogCatalog.getId()));
    	     GoToPage("/WEB-INF/view/admin/json_result.jsp", request, response);
    	}
    }
	
    public void DeleteCatalogAction(HttpServletRequest request,
			   HttpServletResponse response)
    {
    	String id=request.getParameter("id");
    	
        if(id!=null)
        {
        	AdminManager factory=ServiceFactory.getAdminManager();
        	factory.deleteBlogCatalog(Integer.parseInt(id));
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
     	BlogCatalog bc=new BlogCatalog();
     	bc.setId(Integer.parseInt(id));
     	bc.setName(catalog);
     	factory.updateBlogCatalog(bc);
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
