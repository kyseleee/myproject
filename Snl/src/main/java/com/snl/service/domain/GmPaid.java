package com.snl.service.domain;


public class GmPaid {
	
	private User user;
	private GroupMoney groupMoney;
	private Group group;
	private String paid;
	private String recDate;
	

	public GmPaid() {
		
	}


	public GmPaid(User user, GroupMoney groupMoney, Group group,
			String paid, String recDate) {
		super();
		this.user = user;
		this.groupMoney = groupMoney;
		this.group = group;
		this.paid = paid;
		this.recDate = recDate;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public GroupMoney getGroupMoney() {
		return groupMoney;
	}


	public void setGroupMoney(GroupMoney groupMoney) {
		this.groupMoney = groupMoney;
	}


	public Group getGroup() {
		return group;
	}


	public void setGroup(Group group) {
		this.group = group;
	}


	public String getPaid() {
		return paid;
	}


	public void setPaid(String paid) {
		this.paid = paid;
	}


	public String getRecDate() {
		return recDate;
	}


	public void setRecDate(String recDate) {
		this.recDate = recDate;
	}


	@Override
	public String toString() {
		return "GmPaid [user=" + user + ", groupMoney=" + groupMoney
				+ ", group=" + group + ", paid=" + paid + ", recDate="
				+ recDate + "]";
	}



	
	
}
