package net.zypro.zq.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import sun.misc.Regexp;
import net.zypro.zq.bean.Account;
import net.zypro.zq.service.AccountManager;
import net.zypro.zq.service.ServiceFactory;


@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	protected void service(HttpServletRequest request,
		      HttpServletResponse response) throws ServletException, IOException
		  {
		    response.setContentType("application/json;charset=UTF-8");
		    request.setCharacterEncoding("UTF-8");

		    PrintWriter out = response.getWriter();
		    
		    HttpSession session=request.getSession();
		    
		    Account account=new Account();
		    account.setUsername(request.getParameter("username"));
		    account.setPassword(request.getParameter("password"));
		    
		    AccountManager aManager=ServiceFactory.getAccountManager();
		    JSONObject jsonObj=new JSONObject();
		   
		    Map<String,Object> params=aManager.validate(account);
		    
		    if((boolean)params.get("status"))
		    {
		    	session.setAttribute("account", account);
		    	jsonObj.put("status", "success");
		    }else {
		    	jsonObj.put("status", "failed");
			}
		    
		    jsonObj.put("info", params.get("info"));
		    
		    out.print(jsonObj.toString());
		    out.close();
		  }
}
