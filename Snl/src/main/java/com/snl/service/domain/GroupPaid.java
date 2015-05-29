package com.snl.service.domain;


public class GroupPaid {
	
	private User user;
	private GroupMoney groupMoney;
	private Group group;
	private String paid;
	

	public GroupPaid() {
		
	}

	public GroupPaid(User user, GroupMoney groupMoney, Group group, String paid) {
		super();
		this.user = user;
		this.groupMoney = groupMoney;
		this.group = group;
		this.paid = paid;
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
	
	@Override
	public String toString() {
		return "GroupPaid [user=" + user + ", groupMoney=" + groupMoney
				+ ", group=" + group + ", paid=" + paid + "]";
	}
	
	
}
