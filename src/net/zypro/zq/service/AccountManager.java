package net.zypro.zq.service;


import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;


import net.zypro.zq.bean.*;
import net.zypro.zq.dao.AccessDAO;
import net.zypro.zq.dao.AccountDAO;

public class AccountManager {
    private AccessDAO accessDAO;
    private AccountDAO accountDAO;
    private SessionFactory sessionFactory;
    
    public void setAccessDAO(AccessDAO accessDAO)
    {
    	this.accessDAO=accessDAO;
    }
    
    public void setAccountDAO(AccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}
    public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public boolean canAccess(String module,int userId)
    {
		boolean result=false;
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          
		  List<Access> accesses=accessDAO.FindByUserId(session, userId);
		  for(Access access:accesses)
		  {
			  if(access.getModule().equals(ModuleValue.getValue(module)))
				  result=true;
		  }
		  
		  session.getTransaction().commit();
		} catch (Exception e) {
			if(session!=null)
			{
				if(session.getTransaction()!=null)
				{
					session.getTransaction().rollback();
				}
			}
			e.printStackTrace();
		}
    	
    	return result;
    }
    
    public Map<String,Object> addAccount(Account account)
    {
    	Map<String,Object> params=new HashMap<String,Object>();
    	String info="";
    		
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          
		  Account a=accountDAO.FindByName(session, account.getUsername());
		  
		  if(a==null)
		  {
			  info="添加账户成功";
			  params.put("info", info);
		      params.put("status", true);
			  accountDAO.Save(session, account);
		  }else {
			  info="该用户名已存在";
			  params.put("info", info);
		      params.put("status", false);
		  }
		  
		 
		  
		  session.getTransaction().commit();
		} catch (Exception e) {
			if(session!=null)
			{
				if(session.getTransaction()!=null)
				{
					session.getTransaction().rollback();
				}
			}
			e.printStackTrace();
		}
    	
    	return params;
    }
    
    public void deleteAccount(Account account)
    {
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          
		  accountDAO.Delete(session, account);
		  
		  session.getTransaction().commit();
		} catch (Exception e) {
			if(session!=null)
			{
				if(session.getTransaction()!=null)
				{
					session.getTransaction().rollback();
				}
			}
			e.printStackTrace();
		}
    }
    
    public List<Account> findAllUsers()
    {
    	Session session=null;
    	List<Account> accounts=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          accounts=accountDAO.FindAllUsers(session);
		  session.getTransaction().commit();
		} catch (Exception e) {
			if(session!=null)
			{
				if(session.getTransaction()!=null)
				{
					session.getTransaction().rollback();
				}
			}
			e.printStackTrace();
		}
    	
    	return accounts;
    }
    
    public void updatePassword(Account account)
    {
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          
		  accountDAO.Update(session, account);
		  
		  session.getTransaction().commit();
		} catch (Exception e) {
			if(session!=null)
			{
				if(session.getTransaction()!=null)
				{
					session.getTransaction().rollback();
				}
			}
			e.printStackTrace();
		}
    }
    
    public void addAccess(Access access)
    {
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          
		  accessDAO.Save(session, access);
		  
		  session.getTransaction().commit();
		} catch (Exception e) {
			if(session!=null)
			{
				if(session.getTransaction()!=null)
				{
					session.getTransaction().rollback();
				}
			}
			e.printStackTrace();
		}

    }
    
    public void deleteAccess(Access access)
    {
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          
		  for(Access a:accessDAO.FindByUserId(session, access.getUser()))
		  {
			  if(a.getModule().equals(access.getModule()))
			  {
				  accessDAO.Delete(session, a);
			  }
		  }
		  
		  session.getTransaction().commit();
		} catch (Exception e) {
			if(session!=null)
			{
				if(session.getTransaction()!=null)
				{
					session.getTransaction().rollback();
				}
			}
			e.printStackTrace();
		}
    }
    
    public List<Access> findAccess(int userId)
    {
    	Session session=null;
    	List<Access> accesses=new LinkedList<Access>();
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          accesses=accessDAO.FindByUserId(session, userId);
		  session.getTransaction().commit();
		} catch (Exception e) {
			if(session!=null)
			{
				if(session.getTransaction()!=null)
				{
					session.getTransaction().rollback();
				}
			}
			e.printStackTrace();
		}
    	
    	return accesses;
    }
    
    public Map<String,Object> validate(Account account)
    {
    	Map<String,Object> params=new HashMap<String,Object>();
    	String info="";
    	
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  
		  Account a=accountDAO.FindByName(session, account.getUsername());
		  
		  if(a==null)
		  {
			  info="账户不存在";
			  params.put("info", info);
		      params.put("status", false);
		  }else {
			  if(a.getPassword().equals(account.getPassword()))
			  {
				  info="用户名密码正确";
				  account.setId(a.getId());
				  account.setIdentity(a.getIdentity());
				  params.put("info", info);
			      params.put("status", true);
			  }else {
				  info="密码错误";
				  params.put("info", info);
			      params.put("status", false);
			  }
		  }
		   
		  session.getTransaction().commit();
		} catch (Exception e) {
			if(session!=null)
			{
				if(session.getTransaction()!=null)
				{
					session.getTransaction().rollback();
				}
			}
			e.printStackTrace();
		}
    	
    	return params;
    }
}
