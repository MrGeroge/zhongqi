package net.zypro.zq.controller.admin;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.zypro.zq.bean.Account;
import net.zypro.zq.service.AccountManager;
import net.zypro.zq.service.ServiceFactory;


@WebFilter("/Admin/*")
public class AdminController implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)arg0;
		HttpServletResponse response=(HttpServletResponse)arg1;
		HttpSession session=request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		
		Account account=(Account)session.getAttribute("account");
		
		if(account==null)
		{
			//Î´µÇÂ¼
			response.sendRedirect(basePath+"login.jsp");
			return;
		}

		String currentURL=request.getRequestURL().toString();
		String pageName="";
		
		if(currentURL.indexOf("?")!=-1)
		{
			 String[] locations=currentURL.split("?")[0].split("/");
			 pageName=locations[locations.length-1];
		}else {
			 String[] locations=currentURL.split("/");
			 pageName=locations[locations.length-1]; 
		}
		
		if(!account.getIdentity().equals("admin"))
		  if(!pageName.equals("Account"))
		  {
			//¼ì²éÈ¨ÏÞ
			if(pageName.equals("Page"))
				 pageName=request.getParameter("catalog");
			
			AccountManager aManager=ServiceFactory.getAccountManager();
			if(!aManager.canAccess(pageName,account.getId()))
			{
				GoToPage("/WEB-INF/view/admin/505.jsp", request, response);
				return;
			}
		  }
		
		arg2.doFilter(arg0, arg1);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
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
