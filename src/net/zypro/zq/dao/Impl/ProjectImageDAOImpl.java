package net.zypro.zq.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import net.zypro.zq.bean.Blog;
import net.zypro.zq.bean.ProjectImage;
import net.zypro.zq.dao.ProjectImageDAO;

public class ProjectImageDAOImpl extends BaseDAOImpl<ProjectImage> implements ProjectImageDAO{

	@Override
	public List<ProjectImage> FindAll(Session session) {
		// TODO Auto-generated method stub
		return session.createQuery("select en from ProjectImage en").list();
	}

	@Override
	public List<ProjectImage> findByProjectId(Session session,int id) {
		String hql = "FROM ProjectImage P WHERE P.project.id= :catalog";
		Query query = session.createQuery(hql);
		query.setParameter("catalog",id);
		return (List<ProjectImage>)query.list();
	}

}
