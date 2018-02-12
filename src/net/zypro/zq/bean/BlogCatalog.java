package net.zypro.zq.bean;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.*;

/**
 * @author ’≈¨r
 * 
 * 
 * */
@Entity
@Table(name = "blog_catalog")
public class BlogCatalog {
	@Id @GeneratedValue
	@Column(name = "id")
    private int id;
	
	@Column(name="name",length = 50)
    private String name;
    
	@OneToMany(targetEntity=Blog.class,mappedBy="blogCatalog",cascade={CascadeType.REMOVE})
	private List<Blog> blogs= new LinkedList<Blog>();
	
	public BlogCatalog() {

	}

	public BlogCatalog(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Blog> getBlogs() {
		return blogs;
	}

	public void setBlogs(List<Blog> blogs) {
		this.blogs = blogs;
	}
}