package net.zypro.zq.dao.Impl;

import java.util.List;

import org.hibernate.Session;

import net.zypro.zq.bean.*;
import net.zypro.zq.dao.MessageDAO;

public class MessageDAOImpl extends BaseDAOImpl<Message> implements MessageDAO{

	@Override
	public List<Message> FindAll(Session session) {
		// TODO Auto-generated method stub
		return session.createQuery("select en from Message en").list();
	}

}
