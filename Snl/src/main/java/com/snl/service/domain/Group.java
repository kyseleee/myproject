package com.snl.service.domain;

import java.io.Serializable;


public class Group implements Serializable{
		
	private int userNo;
	private String groupName;
	
	public Group(){}

	public Group(String groupName) {
		this.groupName = groupName;
	}

	public Group(int userNo, String groupName) {
		super();
		this.userNo = userNo;
		this.groupName = groupName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	@Override
	public String toString() {
		return "Group [userNo=" + userNo + ", groupName=" + groupName + "]";
	}


	
}