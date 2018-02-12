package net.zypro.zq.dao.Impl;


import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import net.zypro.zq.bean.Blog;
import net.zypro.zq.dao.BlogDAO;


public class BlogDAOImpl extends BaseDAOImpl<Blog> implements BlogDAO {


	@Override
	public List<Blog> findWithLimit(Session session,int beginIndex,int count,int catalog) {
		String hql = "FROM Blog B WHERE B.blogCatalog.id= :catalog ORDER BY B.date DESC";
		Query query = session.createQuery(hql);
		query.setParameter("catalog",catalog);
		query.setFirstResult(beginIndex);
		query.setMaxResults(count);
		return (List<Blog>)query.list();
	}

	@Override
	public int findAllCount(Session session,int catalog) {
		String hql = "SELECT count(B.id) FROM Blog B WHERE B.blogCatalog.id= :catalog";
		Query query = session.createQuery(hql);
		query.setParameter("catalog",catalog);
		List results = query.list();
		return new Long((long)results.get(0)).intValue();
	}

	@Override
	public List<Blog> FindAll(Session session) {
		return session.createQuery("select en from Blog en").list();
	}

	@Override
	public List<Blog> findWithLimit(Session session, int number) {
		// TODO Auto-generated method stub
		String hql = "FROM Blog B ORDER BY B.date DESC";
		Query query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(number);
		return (List<Blog>)query.list();
	}

}
