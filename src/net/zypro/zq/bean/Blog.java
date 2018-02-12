package net.zypro.zq.bean;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "blog")
public class Blog {
	@Id @GeneratedValue
	@Column(name = "id")
    private int id;
	
	@Column(name="title",length = 50)
    private String title;    //标题
	
	@Column(name="source",length = 50)
    private String source;   //来源
	
	@Column(name="keywords",length = 50)
    private String keywords; //关键词
	
	@Column(name="pdate")
    private Date date;       //发表时间
	
	@Lob
	@Column(name="content")
	@Basic(fetch = FetchType.LAZY)
    private String content;  //文章内容
    
	@ManyToOne()
	@JoinColumn(name="catalog_id")
	private BlogCatalog blogCatalog;
	
	@Column(name="click_number")
	private int clickNumber;   //点击次数
    
	@Transient
	private String shortContent;
	
	public String getYear()
	{
		Calendar calendar = GregorianCalendar.getInstance(); 
		calendar.setTime(date);
		
		return  String.valueOf(calendar.get(Calendar.YEAR));
	}
	
	public String getMonth()
	{
		Calendar calendar = GregorianCalendar.getInstance(); 
		calendar.setTime(date);
		
		return  String.valueOf(calendar.get(Calendar.MONTH)+1);
	}
	
	public String getDay()
	{
		Calendar calendar = GregorianCalendar.getInstance(); 
		calendar.setTime(date);
		
		return  String.valueOf(calendar.get(Calendar.DAY_OF_MONTH));
	}
	
	public String getShortContent()
	{
		//去掉html
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
		
		if(newContent.length()>66)
			return newContent.substring(0,65);
		return newContent;
	}
	
	public Blog() {
	
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public int getClickNumber() {
		return clickNumber;
	}

	public void setClickNumber(int clickNumber) {
		this.clickNumber = clickNumber;
	}

	public BlogCatalog getBlogCatalog() {
		return blogCatalog;
	}

	public void setBlogCatalog(BlogCatalog blogCatalog) {
		this.blogCatalog = blogCatalog;
	}

}
