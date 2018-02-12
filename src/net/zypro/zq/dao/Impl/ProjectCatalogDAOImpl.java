package net.zypro.zq.dao.Impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;

import net.zypro.zq.bean.ProjectCatalog;
import net.zypro.zq.dao.ProjectCatalogDAO;

public class ProjectCatalogDAOImpl extends BaseDAOImpl<ProjectCatalog>
		implements ProjectCatalogDAO {

	@Override
	public List<ProjectCatalog> FindAll(Session session) {
		// TODO Auto-generated method stub
		return session.createQuery("select en from ProjectCatalog en").list();
	}

}
