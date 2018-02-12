package net.zypro.zq.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
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
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import net.zypro.zq.bean.Access;
import net.zypro.zq.bean.Account;
import net.zypro.zq.service.*;



@WebServlet("/Admin/Account")
public class AccountController extends GenericServlet {
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
		HttpSession session=request.getSession();
		Account a=(Account)session.getAttribute("account");
		
		AccountManager aManager=ServiceFactory.getAccountManager();
		
		if(a.getIdentity().equals("admin"))
		{
			request.setAttribute("users",aManager.findAllUsers());
			GoToPage("/WEB-INF/view/admin/admin_dashboard.jsp", request, response);
		}else {
			request.setAttribute("username", a.getUsername());
			request.setAttribute("accesses", aManager.findAccess(a.getId()));
			GoToPage("/WEB-INF/view/admin/user_dashboard.jsp", request, response);
		}
		
		
	}
	
	public void AddAccountAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		AccountManager aManager=ServiceFactory.getAccountManager();
		String name=request.getParameter("newUsername");
		String pwd=request.getParameter("newPassword");
		Account account=new Account();
		account.setIdentity("user");
		account.setUsername(name);
		account.setPassword(pwd);

		Map<String,Object> results=aManager.addAccount(account);
		
		 if((boolean)results.get("status"))
		 {
			 request.setAttribute("result", "success");
		 }else {
			 request.setAttribute("result", "failed");
	     }
        request.setAttribute("message", results.get("info"));
		
		GoToPage("/WEB-INF/view/admin/json_result.jsp", request, response);
	}
	
	
	
	public void DeleteAccountAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		AccountManager aManager=ServiceFactory.getAccountManager();
		String id=request.getParameter("id");
		Account account=new Account();
		account.setId(Integer.parseInt(id));
		aManager.deleteAccount(account);
	}
	
	public void ListAccessAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		 String userId=request.getParameter("id");
		 AccountManager aManager=ServiceFactory.getAccountManager();
		 List<Access> accesses=aManager.findAccess(Integer.parseInt(userId));
	     JSONArray array=new JSONArray();
	     
	     for(Access access:accesses)
	     {
	    	array.put(access.getModule());
	     }

	     try {
			PrintWriter out = response.getWriter();
			out.print(array.toString());
			out.close();
		 } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void AddAccessAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
	     String userId=request.getParameter("id");
	     String moduleId=request.getParameter("module");
	     
	     Access access=new Access();
	     access.setUser(Integer.parseInt(userId));
	     access.setModule(moduleId);
	     
	     AccountManager aManager=ServiceFactory.getAccountManager();
	     aManager.addAccess(access);
	}
	
	public void DeleteAccessAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		 String userId=request.getParameter("id");
	     String moduleId=request.getParameter("module");
	     
	     Access access=new Access();
	     access.setUser(Integer.parseInt(userId));
	     access.setModule(moduleId);
	     
	     AccountManager aManager=ServiceFactory.getAccountManager();
	     aManager.deleteAccess(access);  
	}
	
	public void ChangePwdAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		Account a=(Account)session.getAttribute("account");
	    
		String newPwd=request.getParameter("password");
		a.setPassword(newPwd);
		
		AccountManager aManager=ServiceFactory.getAccountManager();
		aManager.updatePassword(a);
		
		request.setAttribute("result", "success");
		
		GoToPage("/WEB-INF/view/admin/json_result.jsp", request, response);
	}
	
	public void LogoutAction(HttpServletRequest request,
			   HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		session.setAttribute("account",null);
		
		try {
			response.sendRedirect(basePath+"login.jsp");
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
