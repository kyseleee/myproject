package com.snl.service.domain;

import java.io.Serializable;
import java.sql.Date;


public class GroupMoney implements Serializable{
		
	
	
	private static final long serialVersionUID = -9137415299967214029L;
	private int gmNo;
	private Group group;
	private String gmName;
	private String gmDate;
	private int gmPrice;

	
	public GroupMoney(){}

	public GroupMoney(int gmNo, Group group, String gmName, String gmDate,
			int gmPrice) {
		super();
		this.gmNo = gmNo;
		this.group = group;
		this.gmName = gmName;
		this.gmDate = gmDate;
		this.gmPrice = gmPrice;
	}

	public GroupMoney(int gmNo, Group group) {
		this.gmNo = gmNo;
		this.group = group;
	}


	public int getGmNo() {
		return gmNo;
	}

	public void setGmNo(int gmNo) {
		this.gmNo = gmNo;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public String getGmName() {
		return gmName;
	}

	public void setGmName(String gmName) {
		this.gmName = gmName;
	}

	public String getGmDate() {
		return gmDate;
	}

	public void setGmDate(String gmDate) {
		this.gmDate = gmDate;
	}

	public int getGmPrice() {
		return gmPrice;
	}

	public void setGmPrice(int gmPrice) {
		this.gmPrice = gmPrice;
	}

	@Override
	public String toString() {
		return "GroupMoney [gmNo=" + gmNo + ", group=" + group + ", gmName="
				+ gmName + ", gmDate=" + gmDate + ", gmPrice=" + gmPrice + "]";
	}



	
}