package net.zypro.zq.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "index_image")
public class IndexImage {
   
	@Id @GeneratedValue
	@Column(name = "id")
    private int id;
	
	@Column(name="path",length = 100)
    private String path;
   
    public int getId() {
	   return id;
    }
    
    public void setId(int id) {
	  this.id = id;
    }
    
    public String getPath() {
	  return path;
    }
    
    public void setPath(String path) {
	  this.path = path;
    }
}
