package com.snl.service.groupMoney.impl;

import java.util.List;

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

	@Override
	public void addGroupMoney(GroupMoney groupMoney) throws Exception {
		groupMoneyDao.addGroupMoney(groupMoney);
		
	}

	public List<GroupMoney> getGroupMoneybyGroup(int groupNo) throws Exception{
		return groupMoneyDao.getGroupMoneybyGroup(groupNo);

	}

}