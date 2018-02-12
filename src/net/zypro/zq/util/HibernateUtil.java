package net.zypro.zq.util;

import java.io.File;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.boot.registry.internal.StandardServiceRegistryImpl;
import org.hibernate.cfg.Configuration;


public class HibernateUtil {
    private static SessionFactory sessionFactory;
    
    static
    {
    	Configuration configuration=new Configuration().configure(new File(Configuration.class.getResource("/").getPath()+"hibernate.cfg.xml"));		
		StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());  
        StandardServiceRegistryImpl registry = (StandardServiceRegistryImpl) builder.build();  
		
        sessionFactory=configuration.buildSessionFactory(registry);
    }
    
    public static SessionFactory getSessionFactory()
    {
    	return sessionFactory;
    }
}