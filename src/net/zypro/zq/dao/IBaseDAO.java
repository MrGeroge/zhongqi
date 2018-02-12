package net.zypro.zq.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;

public interface IBaseDAO<T> {
	T Get(Session session,Class<T> clazz,Serializable id);  //ͨ��id��ѯ �����ʵ��
	Serializable Save(Session session,T entity) throws Exception;//save��entity����������֮��״̬Ϊpersist
	void Delete(Session session,T entity);//delete��entity��ɾ��ʵ����֮��״̬Ϊ͸��
	void Delete(Session session,Class<T> clazz,Serializable id);//��ͨ��idɾ������֮��״̬Ϊ͸��
	void Update(Session session,T entity);//update��entity������ʵ��������������״̬��
	List<T> FindAll(Session session);//���ȫ��ʵ��
}
