package net.zypro.zq.bean;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "project_catalog")
public class ProjectCatalog {
	@Id @GeneratedValue
	@Column(name = "id")
	private int id;
	
	@Column(name="title",length = 50)
	private String name;
	
	@Column(name="cover",length = 100)
	private String cover;
	
	@OneToMany(targetEntity=Project.class,mappedBy="catalog",cascade={CascadeType.REMOVE} )
	private List<Project> projects= new LinkedList<Project>();
	
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
	public List<Project> getProjects() {
		return projects;
	}
	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
}
