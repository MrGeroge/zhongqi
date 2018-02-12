package net.zypro.zq.dao.Impl;

import static org.junit.Assert.*;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import net.zypro.zq.bean.Blog;
import net.zypro.zq.bean.BlogCatalog;
import net.zypro.zq.bean.Project;
import net.zypro.zq.bean.ProjectCatalog;
import net.zypro.zq.bean.WebPage;
import net.zypro.zq.dao.BlogCatalogDAO;
import net.zypro.zq.dao.BlogDAO;
import net.zypro.zq.dao.ProjectCatalogDAO;
import net.zypro.zq.dao.ProjectDAO;
import net.zypro.zq.dao.WebPageDAO;
import net.zypro.zq.service.ServiceFactory;
import net.zypro.zq.service.UserManager;
import net.zypro.zq.util.HibernateUtil;
import net.zypro.zq.util.PageUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Before;
import org.junit.Test;

import com.sun.org.apache.xml.internal.resolver.Catalog;

public class BlogCatalogDAOImplTest {

	public void OpenSession()
	{
		
		ProjectCatalog c1=new ProjectCatalog();
		c1.setName("酒店空间");
		c1.setId(1);
		
		ProjectCatalog c2=new ProjectCatalog();
		c2.setName("商业空间");
		Project p1=new Project();
		p1.setName("lala");
		p1.setCatalog(c1);
		c1.getProjects().add(p1);
		
		ProjectCatalogDAO catalogDAO=new ProjectCatalogDAOImpl();
		ProjectDAO pDAO=new ProjectDAOImpl();
		SessionFactory sessionFactory=HibernateUtil.getSessionFactory();
		Session  session=sessionFactory.getCurrentSession();
		
		try {
			session.beginTransaction();
			pDAO.Save(session, p1);
			session.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  	
	}
	
	
	@Test
    public void testWebPageDAO()
	{
		SessionFactory sessionFactory=HibernateUtil.getSessionFactory();
		Session  session=sessionFactory.getCurrentSession();
		WebPage p1=new WebPage();
		p1.setCatalog("1");
		p1.setPageName("1-1");

		
		WebPage p2=new WebPage();
		p2.setCatalog("1");
		p2.setPageName("1-1");

		
		WebPage p3=new WebPage();
		p3.setCatalog("2");
		p3.setPageName("2-1");

		
		WebPageDAO wDao=new WebPageDAOImpl();
		
		try {
			session.beginTransaction();
			wDao.Save(session, p1);
			wDao.Save(session, p2);
			wDao.Save(session, p3);
			List<WebPage> pages=wDao.FindPageNamesByCatalog(session, "1");
			session.getTransaction().commit();
			
			for(WebPage p:pages)
			{
				System.out.print(p.getId());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Test
	public void testSave() {
		UserManager userManager=ServiceFactory.getUserManager();
		userManager.findAllProjectCatalogs();
		/*ProjectCatalog projectCatalog=new ProjectCatalog();
		projectCatalog.setId(1);
		System.out.print(userManager.findProjectWithCatalog(projectCatalog).size());*/
	}

}
