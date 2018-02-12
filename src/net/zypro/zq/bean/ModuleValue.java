package net.zypro.zq.bean;

import java.util.*;

public class ModuleValue {
	
   public static Map<String,String> values=new HashMap<String,String>();
   
   static{
	   values.put("1", "��ҳ");
	   values.put("2", "�߽�����");
	   values.put("3", "��������");
	   values.put("4", "����Χ");
	   values.put("5", "����ҵ��");
	   values.put("6", "������Դ");
	   values.put("7", "��ϵ����");
	   
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
