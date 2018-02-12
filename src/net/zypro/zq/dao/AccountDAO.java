package net.zypro.zq.dao;

import org.hibernate.Session;

import java.util.*;
import net.zypro.zq.bean.*;

public interface AccountDAO extends IBaseDAO<Account>{
	public Account FindByName(Session session,String username);
	public List<Account> FindAllUsers(Session session);
}
