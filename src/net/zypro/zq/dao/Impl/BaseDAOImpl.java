package net.zypro.zq.dao.Impl;

import java.io.Serializable;
import java.util.List;

import net.zypro.zq.dao.IBaseDAO;

import org.hibernate.Session;

import java.lang.reflect.Method;

public abstract class BaseDAOImpl<T> implements IBaseDAO<T> {

	@Override
	public T Get(Session session, Class<T> clazz, Serializable id) {
		return (T)session.get(clazz, id);
	}

	@Override
	public Serializable Save(Session session, T entity) throws Exception {
		session.save(entity);
		Method getId=entity.getClass().getMethod("getId");
		return (Serializable)getId.invoke(entity);
	}

	@Override
	public void Delete(Session session, T entity) {
		session.delete(entity);
	}

	@Override
	public void Delete(Session session, Class<T> clazz, Serializable id) {
        session.delete(Get(session, clazz, id));
	}

	@Override
	public void Update(Session session, T entity) {
		session.saveOrUpdate(entity);
	}
}
