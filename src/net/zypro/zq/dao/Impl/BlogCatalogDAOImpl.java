package net.zypro.zq.dao.Impl;

import java.util.List;

import org.hibernate.Session;

import net.zypro.zq.bean.BlogCatalog;
import net.zypro.zq.dao.BlogCatalogDAO;

public class BlogCatalogDAOImpl extends BaseDAOImpl<BlogCatalog> implements BlogCatalogDAO  {

	@Override
	public List<BlogCatalog> FindAll(Session session) {
	     return session.createQuery("select en from BlogCatalog en").list();
	}

}
