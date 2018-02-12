package net.zypro.zq.bean;

import javax.persistence.*;


@Entity
@Table(name = "access")
public class Access {
	@Id @GeneratedValue
	@Column(name = "id")
    private int id;
	
	@Column(name="account_id")
    private int user;
    
    @Column(name="module",length = 5)
    private String module;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}
}
