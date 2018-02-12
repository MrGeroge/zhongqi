package net.zypro.zq.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import net.zypro.zq.bean.*;
import net.zypro.zq.dao.AccountDAO;

public class AccountDAOImpl extends BaseDAOImpl<Account> implements AccountDAO{

	@Override
	public List<Account> FindAll(Session session) {
		// TODO Auto-generated method stub
		return session.createQuery("select en from Account en").list();
	}

	@Override
	public Account FindByName(Session session, String username) {
		// TODO Auto-generated method stub
		String hql = "FROM Account A WHERE A.username= :username";
		Query query = session.createQuery(hql);
		query.setParameter("username",username);
		List results = query.list();
		
		if(results.size()==0)
		{
			return null;
		}
		
		return (Account)results.get(0);
	}

	@Override
	public List<Account> FindAllUsers(Session session) {
		// TODO Auto-generated method stub
		String hql = "FROM Account A WHERE A.identity= :identity";
		Query query = session.createQuery(hql);
		query.setParameter("identity","user");
		
		return query.list();
	}

}
