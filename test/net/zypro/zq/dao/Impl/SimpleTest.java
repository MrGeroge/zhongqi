package net.zypro.zq.dao.Impl;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Test;

public class SimpleTest {

	@Test
	public void test() {
		String content="<h2>众启装饰</h2>1、预结算员<br />岗位职责：&nbsp;<br />";
		String newContent="";
		int begin=0;
		int end=0;
	 while(end!=-1)
	 {
		begin=content.indexOf(">", end);
		if(begin!=-1)
		{
			end=begin;
			end=content.indexOf("<",end);
			if(end!=-1)
			      newContent+=content.substring(begin+1,end);
		}else {
			break;
		}
	 }
	 
	 System.out.print(newContent);
	}

}
