package net.zypro.zq.service;

import java.util.LinkedList;
import java.util.List;

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

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class AdminManager {
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
	
	public List<Blog> findAllBlogs()
	{
		List<Blog> blogs=new LinkedList<Blog>();
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  blogs=blogDAO.FindAll(session);
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
	
	public void deleteBlog(int id)
	{
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
	      blogDAO.Delete(session, Blog.class, id);
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

	public void addBlog(Blog blog)
	{
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  BlogCatalog catalog=blogCatalogDAO.Get(session, BlogCatalog.class,blog.getBlogCatalog().getId());
		  blog.setBlogCatalog(catalog);
	      blogDAO.Save(session, blog);
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

	public void updateBlog(Blog blog)
	{
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
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

	public void deleteBlogCatalog(int id)
	{
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
	      blogCatalogDAO.Delete(session, BlogCatalog.class, id);
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

	public void addBlogCatalog(BlogCatalog catalog)
	{
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
	      catalog.setId(Integer.parseInt(blogCatalogDAO.Save(session, catalog).toString()));
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

	public void updateBlogCatalog(BlogCatalog catalog)
	{
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
	      blogCatalogDAO.Update(session, catalog);
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
	
	public List<Project> findAllProjects()
	{
		List<Project> projects=new LinkedList<Project>();
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
	      projects=projectDAO.FindAll(session);
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
    
	public void deleteProject(int id) {
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          projectDAO.Delete(session, Project.class, id);
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
	
	public Project getProject(int parseInt) {
		Project project=new Project();
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          project=projectDAO.Get(session, Project.class, parseInt);
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
	
	public void updateProject(Project project) {
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          projectDAO.Update(session, project);
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
	
	public void addProject(Project project) {
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          projectDAO.Save(session, project);
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
	
	public void addProjectCatalog(ProjectCatalog projectCatalog) {
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          projectCatalogDAO.Save(session,projectCatalog);
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
	
	public void deleteProjectCatalog(int parseInt) {
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          projectCatalogDAO.Delete(session, ProjectCatalog.class, parseInt);
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
	
	public void updateProjectCatalog(ProjectCatalog pCatalog) {
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          projectCatalogDAO.Update(session, pCatalog);
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
	
	public List<ProjectImage> findAllImages() {
		// TODO Auto-generated method stub
		List<ProjectImage> images=new LinkedList<ProjectImage>();
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  images=projectImageDAO.FindAll(session);
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
	
	
	public List<ProjectImage> findImagesByProject(int id) {
		// TODO Auto-generated method stub
		List<ProjectImage> images=new LinkedList<ProjectImage>();
    	Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  images=projectImageDAO.findByProjectId(session,id);
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
	
	public void deleteImage(int id) {
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          projectImageDAO.Delete(session, ProjectImage.class, id);
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
	public void addImage(ProjectImage image) {
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
          projectImageDAO.Save(session, image);
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
	
	public void deletePage(int id)
	{
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  webPageDAO.Delete(session,WebPage.class,id);
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
	
	public void updatePage(WebPage page)
	{
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		 webPageDAO.Update(session, page);
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
	
	public void addPage(WebPage page)
	{
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  webPageDAO.Save(session, page);
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
	
	
	public List<WebPage> findPages(String catalog)
	{
		Session session=null;
		List<WebPage> pages=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  pages=webPageDAO.FindPagesByCatalog(session, catalog);
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
	
	
	public List<Message> findAllMessages()
	{
		Session session=null;
		List<Message> messages=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  messages=messageDAO.FindAll(session);
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
    	return messages;
	}
	
	public void deleteMessage(int id)
	{
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  messageDAO.Delete(session, Message.class, id);
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
	
	
	public void addIndexImage(IndexImage image)
	{
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  indexImageDAO.Save(session, image);
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
	
	public void deleteIndexImage(int id)
	{
		Session session=null;
    	try {
    	  session=sessionFactory.getCurrentSession();
		  session.beginTransaction();
		  indexImageDAO.Delete(session, IndexImage.class, id);
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
}
