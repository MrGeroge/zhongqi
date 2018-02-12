package net.zypro.zq.dao.Impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import net.zypro.zq.bean.Access;
import net.zypro.zq.bean.Blog;
import net.zypro.zq.dao.AccessDAO;

public class AccessDAOImpl extends BaseDAOImpl<Access> implements AccessDAO{

	@Override
	public List<Access> FindAll(Session session) {
		// TODO Auto-generated method stub
		return session.createQuery("select en from Access en").list();
	}

	@Override
	public List<Access> FindByUserId(Session session,int userid) {
		// TODO Auto-generated method stub
		String hql = "FROM Access A WHERE A.user= :userid";
		Query query = session.createQuery(hql);
		query.setParameter("userid",userid);
		return (List<Access>)query.list();
	}

}
