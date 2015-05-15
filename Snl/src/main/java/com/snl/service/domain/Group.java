package com.snl.service.domain;

import java.io.Serializable;
import java.sql.Date;


public class Group implements Serializable{
		
	/**
	 * 
	 */
	private static final long serialVersionUID = -9137415299967214029L;
	private int groupNo;
	private User user;
	private String groupName;
	private Date groupDate;
	
	public Group(){}

	public Group(int groupNo, User user, String groupName, Date groupDate) {
		super();
		this.groupNo = groupNo;
		this.user = user;
		this.groupName = groupName;
		this.groupDate = groupDate;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Date getGroupDate() {
		return groupDate;
	}

	public void setGroupDate(Date groupDate) {
		this.groupDate = groupDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Group [groupNo=" + groupNo + ", user=" + user + ", groupName="
				+ groupName + ", groupDate=" + groupDate + "]";
	}


	
}