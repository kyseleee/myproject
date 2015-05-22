package com.snl.service.domain;

import java.io.Serializable;


public class Payment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4946446029490257529L;
	private int payNo;
	private Group group;
	private String method;
	private String receit;
	private String payDate;
	private String payName;
	private int amount;
	
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getReceit() {
		return receit;
	}
	public void setReceit(String receit) {
		this.receit = receit;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getPayName() {
		return payName;
	}
	public void setPayName(String payName) {
		this.payName = payName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "Payment [payNo=" + payNo + ", group=" + group + ", method="
				+ method + ", receit=" + receit + ", pay_date=" + payDate 
				+ ", pay_name=" + payName + ", amount=" + amount + "]";
	}
	
	
	
	
	
}
