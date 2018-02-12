package net.zypro.zq.dao.Impl;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.sun.org.apache.xml.internal.security.keys.content.PGPData;

import net.zypro.zq.bean.ProjectImage;
import net.zypro.zq.bean.WebPage;
import net.zypro.zq.dao.WebPageDAO;

public class WebPageDAOImpl extends BaseDAOImpl<WebPage> implements WebPageDAO{

	@Override
	public List<WebPage> FindAll(Session session) {
		// TODO Auto-generated method stub
		return session.createQuery("select en from WebPage en").list();
	}

	@Override
	public List<WebPage> FindPageNamesByCatalog(Session session, String calalog) {
		// TODO Auto-generated method stub
		String hql = "Select W.id,W.pageName FROM WebPage W WHERE W.catalog= :catalog";
		Query query = session.createQuery(hql);
		query.setParameter("catalog",calalog);
		
		List<WebPage> pages=new LinkedList<WebPage>();
		for(Object o:query.list())
		{
			Object[] arr=(Object[])o;
			WebPage page=new WebPage();
			page.setId((int) arr[0]);
			page.setPageName((String) arr[1]);
			pages.add(page);
		}
		
		return pages;
	}

	@Override
	public List<WebPage> FindPagesByCatalog(Session session, String calalog) {
		// TODO Auto-generated method stub
		String hql = "FROM WebPage W WHERE W.catalog= :catalog";
		Query query = session.createQuery(hql);
		query.setParameter("catalog",calalog);
		return (List<WebPage>)query.list();
	}

}
