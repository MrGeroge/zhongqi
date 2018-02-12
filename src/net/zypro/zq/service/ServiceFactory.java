package net.zypro.zq.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;

import net.zypro.zq.bean.Access;
import net.zypro.zq.bean.BlogCatalog;
import net.zypro.zq.bean.Project;
import net.zypro.zq.bean.WebPage;
import net.zypro.zq.dao.AccessDAO;
import net.zypro.zq.dao.BlogCatalogDAO;
import net.zypro.zq.dao.ProjectDAO;
import net.zypro.zq.dao.WebPageDAO;
import net.zypro.zq.dao.Impl.*;
import net.zypro.zq.util.HibernateUtil;

public class ServiceFactory {
    public static UserManager getUserManager()
    {
    	UserManager userManager=new UserManager();
    	userManager.setSessionFactory(HibernateUtil.getSessionFactory());
    	userManager.setBlogDAO(new BlogDAOImpl());
    	userManager.setBlogCatalogDAO(new BlogCatalogDAOImpl()); 
    	userManager.setProjectDAO(new ProjectDAOImpl());
    	userManager.setProjectCatalogDAO(new ProjectCatalogDAOImpl());
    	userManager.setProjectImageDAO(new ProjectImageDAOImpl());
    	userManager.setWebPageDAO(new WebPageDAOImpl());
    	userManager.setMessageDAO(new MessageDAOImpl());
    	userManager.setIndexImageDAO(new IndexImageDAOImpl());
    	return userManager;
    }

	public static AdminManager getAdminManager() {
		// TODO Auto-generated method stub
		AdminManager adminManager=new AdminManager();
		adminManager.setSessionFactory(HibernateUtil.getSessionFactory());
		adminManager.setBlogDAO(new BlogDAOImpl());
		adminManager.setBlogCatalogDAO(new BlogCatalogDAOImpl()); 
		adminManager.setProjectDAO(new ProjectDAOImpl());
		adminManager.setProjectCatalogDAO(new ProjectCatalogDAOImpl());
		adminManager.setProjectImageDAO(new ProjectImageDAOImpl());
		adminManager.setWebPageDAO(new WebPageDAOImpl());
		adminManager.setMessageDAO(new MessageDAOImpl());
		adminManager.setIndexImageDAO(new IndexImageDAOImpl());
    	return adminManager;
	}
	
	public static AccountManager getAccountManager()
	{
		AccountManager accountManager=new AccountManager();
		accountManager.setSessionFactory(HibernateUtil.getSessionFactory());
		accountManager.setAccessDAO(new AccessDAOImpl());
		accountManager.setAccountDAO(new AccountDAOImpl());
		return accountManager;
	}
}
