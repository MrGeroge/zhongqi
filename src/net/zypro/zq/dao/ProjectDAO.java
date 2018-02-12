package net.zypro.zq.dao;

import java.util.List;

import org.hibernate.Session;

import net.zypro.zq.bean.Project;

public interface ProjectDAO extends IBaseDAO<Project>{
	public List<Project> findWithCatalog(Session session,int id);
	public int findAllCount(Session session);
}
