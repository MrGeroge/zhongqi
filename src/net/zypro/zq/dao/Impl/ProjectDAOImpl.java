package net.zypro.zq.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import net.zypro.zq.bean.Blog;
import net.zypro.zq.bean.Project;
import net.zypro.zq.dao.ProjectDAO;

public class ProjectDAOImpl extends BaseDAOImpl<Project> implements ProjectDAO{

	@Override
	public List<Project> FindAll(Session session) {
		// TODO Auto-generated method stub
		return session.createQuery("select en from Project en").list();
	}

	@Override
	public List<Project> findWithCatalog(Session session,int id) {
		// TODO Auto-generated method stub
		String hql = "FROM Project P WHERE P.catalog.id= :catalog";
		Query query = session.createQuery(hql);
		query.setParameter("catalog",id);
		
		return (List<Project>)query.list();
	}

	@Override
	public int findAllCount(Session session) {
		// TODO Auto-generated method stub
		String hql = "SELECT count(P.id) FROM Project P";
		Query query = session.createQuery(hql);
		List results = query.list();
		return new Long((long)results.get(0)).intValue();
	}

}
