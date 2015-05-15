package com.snl.service.domain;

import java.io.Serializable;

public class GroupArr implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7731073228640518926L;
	private User user;
	private Group group;
	private String role;
	
	public GroupArr(){}

	public GroupArr(User user, Group group, String role) {
		super();
		this.user = user;
		this.group = group;
		this.role = role;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GroupArr [user=" + user + ", group=" + group + ", role=" + role
				+ "]";
	}


}
