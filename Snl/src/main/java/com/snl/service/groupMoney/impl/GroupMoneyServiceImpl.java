package com.snl.service.groupMoney.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.snl.service.domain.GroupMoney;
import com.snl.service.groupMoney.GroupMoneyDao;
import com.snl.service.groupMoney.GroupMoneyService;


@Service("groupMoneyServiceImpl")
public class GroupMoneyServiceImpl implements GroupMoneyService{
	
	///Field
	@Autowired
	@Qualifier("groupMoneyDaoImpl")
	private GroupMoneyDao groupMoneyDao;
	
	public void setGroupMoneyDao(GroupMoneyDao groupMoneyDao) {
		this.groupMoneyDao = groupMoneyDao;
	}
	
	///Constructor
	public GroupMoneyServiceImpl() {
		System.out.println(this.getClass());
	}

	/*
	@Override
	public Group getGroup(int groupNo) throws Exception {
		return groupDao.getGroup(groupNo);
	}
	
	public Group getGroupByGroupName(Group group) throws Exception{
		return groupDao.getGroupByGroupName(group);
	}*/

	@Override
	public void addGroupMoney(GroupMoney groupMoney) throws Exception {
		groupMoneyDao.addGroupMoney(groupMoney);
		
	}

}