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
@Table(name = "web_page")
public class WebPage {
	@Id @GeneratedValue
	@Column(name = "id")
	private int id;
	
	@Column(name="catalog",length = 10)
	private String catalog;
	
	@Column(name="pageName",length = 10)
	private String pageName;
	
	@Column(name="title",length = 10)
	private String title;
	
	@Lob
	@Column(name="content")
	@Basic(fetch = FetchType.LAZY)
    private String content;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
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

	public String getCatalog() {
		return catalog;
	}

	public void setCatalog(String catalog) {
		this.catalog = catalog;
	}
	
	
}
