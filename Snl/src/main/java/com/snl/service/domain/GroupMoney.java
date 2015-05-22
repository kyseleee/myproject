package com.snl.service.domain;

import java.io.Serializable;
import java.sql.Date;


public class GroupMoney implements Serializable{
		
	private static final long serialVersionUID = -9137415299967214029L;
	private int gmNo;
	private Group group;
	private String gmName;
	private String gmDate;
	private int gmPay;
	private int gmPays;
	
	public GroupMoney(){}
	
	public GroupMoney(int gmNo, Group group, String gmName, String gmDate,
			int gmPay, int gmPays) {
		super();
		this.gmNo = gmNo;
		this.group = group;
		this.gmName = gmName;
		this.gmDate = gmDate;
		this.gmPay = gmPay;
		this.gmPays = gmPays;
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


	public int getGmPay() {
		return gmPay;
	}


	public void setGmPay(int gmPay) {
		this.gmPay = gmPay;
	}


	public int getGmPays() {
		return gmPays;
	}


	public void setGmPays(int gmPays) {
		this.gmPays = gmPays;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "GroupMoney [gmNo=" + gmNo + ", group=" + group + ", gmName="
				+ gmName + ", gmDate=" + gmDate + ", gmPay=" + gmPay
				+ ", gmPays=" + gmPays + "]";
	}
	
	
	
}