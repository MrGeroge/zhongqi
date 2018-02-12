package net.zypro.zq.dao;

import net.zypro.zq.bean.Access;

import java.util.*;

import org.hibernate.Session;

public interface AccessDAO extends IBaseDAO<Access>{
   public List<Access>  FindByUserId(Session session,int userid);
   
}
