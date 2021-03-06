package com.snl.service.groupMoney;

import java.util.List;

import com.snl.service.domain.GroupMoney;

public interface GroupMoneyDao {
	
	// INSERT
	public void addGroupMoney(GroupMoney groupMoney) throws Exception ;

	public List<GroupMoney> getGroupMoneybyGroup(int groupNo) throws Exception;

	public GroupMoney getGroupMoney(int gmNo) throws Exception;
	
	public void deleteGroupMoneyByGroup(int groupNo) throws Exception;


}