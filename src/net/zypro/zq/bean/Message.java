package net.zypro.zq.bean;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "message")
public class Message {
	@Id @GeneratedValue
	@Column(name = "id")
    private int id;
	
	@Column(name="title",length = 100)
    private String title;
	
	@Lob
	@Column(name="content")
	@Basic(fetch = FetchType.LAZY)
    private String content;
	
	@Column(name="contact",length = 100)
    private String contact;
    
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
}
