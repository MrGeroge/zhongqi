package net.zypro.zq.bean;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "project")
public class Project {
	  @Id @GeneratedValue
	  @Column(name = "id")
      private int id;
	  
	  @Column(name="name",length = 50)
      private String name;        //名称
	  
	  @Column(name="address",length = 50)
      private String address;     //施工地址
	  
	  @Column(name="type",length = 50)
      private String type;        //工程性质
	  
	  @Column(name="finishDate",length = 50)
      private String finishDate;  //完工时间
	  
	  @Column(name="cover",length = 100)
      private String cover;       //封面
      
	  @Lob
	  @Column(name="description")
	  @Basic(fetch = FetchType.LAZY)
	  private String description;  
	  
	  @Transient
	  private String shortContent;
	  
	  public String getShortContent()
      {
			if(description.length()>40)
				return description.substring(0,39);
			return description;
	  }
	  
      @ManyToOne()
  	  @JoinColumn(name="catalog_id")
      private ProjectCatalog catalog; //所属分类
      
      @OneToMany(targetEntity=ProjectImage.class,mappedBy="project",cascade={CascadeType.REMOVE} )
  	  private List<ProjectImage> images= new LinkedList<ProjectImage>();
      
      
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public ProjectCatalog getCatalog() {
		return catalog;
	}

	public void setCatalog(ProjectCatalog catalog) {
		this.catalog = catalog;
	}

	public List<ProjectImage> getImages() {
		return images;
	}

	public void setImages(List<ProjectImage> images) {
		this.images = images;
	} 
}
