package net.zypro.zq.dao.Impl;

import java.util.List;

import org.hibernate.Session;

import net.zypro.zq.bean.BlogCatalog;
import net.zypro.zq.bean.IndexImage;
import net.zypro.zq.dao.IBaseDAO;
import net.zypro.zq.dao.IndexImageDAO;

public class IndexImageDAOImpl extends BaseDAOImpl<IndexImage> implements IndexImageDAO{
	@Override
	public List<IndexImage> FindAll(Session session) {
	     return session.createQuery("select en from IndexImage en").list();
	}
}
