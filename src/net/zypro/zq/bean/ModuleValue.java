package net.zypro.zq.bean;

import java.util.*;

public class ModuleValue {
	
   public static Map<String,String> values=new HashMap<String,String>();
   
   static{
	   values.put("1", "首页");
	   values.put("2", "走进众启");
	   values.put("3", "新闻中心");
	   values.put("4", "服务范围");
	   values.put("5", "工程业绩");
	   values.put("6", "人力资源");
	   values.put("7", "联系我们");
	   
	   values.put("Home", "1");
	   values.put("introduce", "2");
	   values.put("Blog", "3");
	   values.put("service", "4");
	   values.put("Project", "5");
	   values.put("Image", "5");
	   values.put("person", "6");
	   values.put("Message", "7");
   }
   
   public static String getValue(String module)
   {
	   return values.get(module);
   }
   
   public static String getModule(String value)
   {
	   return values.get(value);
   }
}
