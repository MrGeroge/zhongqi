package net.zypro.zq.dao;

import java.util.List;

import org.hibernate.Session;

import net.zypro.zq.bean.WebPage;

public interface WebPageDAO extends IBaseDAO<WebPage> {
	public List<WebPage> FindPageNamesByCatalog(Session session,String calalog);
	public List<WebPage> FindPagesByCatalog(Session session,String calalog);
}
