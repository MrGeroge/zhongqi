package net.zypro.zq.dao;

import java.util.List;

import org.hibernate.Session;

import net.zypro.zq.bean.Blog;
import net.zypro.zq.util.PageUtil;

public interface BlogDAO extends IBaseDAO<Blog> {
    public List<Blog> findWithLimit(Session session,int beginIndex,int count,int catalog);
    public int findAllCount(Session session,int catalog);
	public List<Blog> findWithLimit(Session session, int number);
}
