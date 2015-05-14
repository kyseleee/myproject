package com.snl.service.domain;

import java.io.Serializable;


public class Group implements Serializable{
		
	private String groupName;
	
	public Group(){}

	public Group(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	@Override
	public String toString() {
		return "Group [groupName=" + groupName + "]";
	}
	
}