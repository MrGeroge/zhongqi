package net.zypro.zq.service;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import net.zypro.zq.bean.Blog;
import net.zypro.zq.bean.BlogCatalog;
import net.zypro.zq.bean.IndexImage;
import net.zypro.zq.bean.Message;
import net.zypro.zq.bean.Project;
import net.zypro.zq.bean.ProjectCatalog;
import net.zypro.zq.bean.ProjectImage;
import net.zypro.zq.bean.WebPage;
import net.zypro.zq.dao.BlogCatalogDAO;
import net.zypro.zq.dao.BlogDAO;
import net.zypro.zq.dao.IndexImageDAO;
import net.zypro.zq.dao.MessageDAO;
import net.zypro.zq.dao.ProjectCatalogDAO;
import net.zypro.zq.dao.ProjectDAO;
import net.zypro.zq.dao.ProjectImageDAO;
import net.zypro.zq.dao.WebPageDAO;
import net.zypro.zq.util.PageUtil;

public class UserManager {
    private BlogDAO blogDAO;
    private BlogCatalogDAO blogCatalogDAO;
    private SessionFactory sessionFactory;
    private ProjectDAO projectDAO;
    private ProjectCatalogDAO projectCatalogDAO;
    private ProjectImageDAO projectImageDAO;
    private WebPageDAO webPageDAO;
    private MessageDAO messageDAO;
    private IndexImageDAO indexImageDAO;
    
    
    public void setIndexImageDAO(IndexImageDAO indexImageDAO) {
		this.indexImageDAO = indexImageDAO;
	}

	public void setMessageDAO(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}
    
    public void setWebPageDAO(WebPageDAO webPageDAO) {
		this.webPageDAO = webPageDAO;
	}
	public void setProjectDAO(ProjectDAO projectDAO) {
		this.projectDAO = projectDAO;
	}
	public void setProjectCatalogDAO(ProjectCatalogDAO projectCatalogDAO) {
		this.projectCatalogDAO = projectCatalogDAO;
	}
	public void setProjectImageDAO(ProjectImageDAO projectImageDAO) {
		this.projectImageDAO = projectImageDAO;
	}
	public void setBlogDAO(BlogDAO blogDAO) {
		this.blogDAO = blogDAO;
	}
	public void setBlogCatalogDAO(BlogCatalogDAO blogCatalogDAO) {
		this.blogCatalogDAO = blogCatalogDAO;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Blog getBolg(int id)
	{
		Session session=null;
		Blog blog=new Blog();
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  //È¡µÃ
	      blog=blogDAO.Get(session, Blog.class, id);
	      blog.getContent();
	      blog.setClickNumber(blog.getClickNumber()+1);
	      blogDAO.Update(session, blog);
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
    	return blog;
	}
    
    public List<Blog> findBlogWithPage(PageUtil page,int catalog)
    {
    	List<Blog> blogs=new LinkedList<Blog>();
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
	      page.setTotalCount(blogDAO.findAllCount(session,catalog));
		  blogs=blogDAO.findWithLimit(session, page.getBeginIndex(), page.getEveryPage(),catalog);
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
    	return blogs;
    }
    
    public List<BlogCatalog> findAllBlogCatalogs()
    {
    	List<BlogCatalog> catalogs=new LinkedList<BlogCatalog>();
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  catalogs=blogCatalogDAO.FindAll(session);
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
    	return catalogs;
    }
    
    public List<Project> findProjectWithCatalog(ProjectCatalog catalog)
    {
    	List<Project> projects=new LinkedList<Project>();
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  ProjectCatalog c=projectCatalogDAO.Get(session, ProjectCatalog.class,catalog.getId());
	      catalog.setName(c.getName());
		  catalog.setCover(c.getCover());
	      projects=projectDAO.findWithCatalog(session, catalog.getId());
	      System.out.print(projects.size());
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
    	return projects;
    }
    
    public List<ProjectCatalog> findAllProjectCatalogs()
    {
    	List<ProjectCatalog> catalogs=new LinkedList<ProjectCatalog>();
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  catalogs=projectCatalogDAO.FindAll(session);
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
    	return catalogs;
    }
	public List<Blog> getLastestBlogs() {
		// TODO Auto-generated method stub
		List<Blog> blogs=new LinkedList<Blog>();
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  blogs=blogDAO.findWithLimit(session, 5);
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
    	return blogs;
	}
	public List<ProjectImage> findImagesWithProject(int parseInt) {
		
		List<ProjectImage> images=new LinkedList<ProjectImage>();
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  images=projectImageDAO.findByProjectId(session,parseInt);
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
    	return images;
	}
	public Project getProject(int id) {
		Session session=null;
		Project project=new Project();
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
	      project=projectDAO.Get(session, Project.class, id);
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
    	return project;
	}
	
	public List<Project> findProjectsRandom()
	{
		Session session=null;
		List<Project> projects=new LinkedList<Project>();
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  String hql = "SELECT * FROM project order by rand() limit ?";
		  projects = session.createSQLQuery(hql).addEntity(Project.class).setInteger(0, 10).list();  
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
    	return projects;
	}
	
	public WebPage getWebPage(int id)
	{
		Session session=null;
		WebPage page=new WebPage();
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  page=webPageDAO.Get(session, WebPage.class, id);
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
    	return page;
	}
	
	public List<WebPage> findHeaders(String catalog)
	{
		Session session=null;
		List<WebPage> pages=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  pages=webPageDAO.FindPageNamesByCatalog(session, catalog);
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
    	return pages;
	}
	
	public void addMessage(Message mesg)
	{
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  messageDAO.Save(session, mesg);
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
	
	public List<IndexImage> findAllIndexImages()
	{
		Session session=null;
		List<IndexImage> images=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  images=indexImageDAO.FindAll(session);
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
    	return images;
	}
}
