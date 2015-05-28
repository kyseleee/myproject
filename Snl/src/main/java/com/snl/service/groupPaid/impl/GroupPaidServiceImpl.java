package com.snl.service.groupPaid.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.snl.service.domain.GroupPaid;
import com.snl.service.groupPaid.GroupPaidDao;
import com.snl.service.groupPaid.GroupPaidService;


@Service("groupPaidServiceImpl")
public class GroupPaidServiceImpl implements GroupPaidService{
	
	///Field
	@Autowired
	@Qualifier("groupPaidDaoImpl")
	private GroupPaidDao groupPaidDao;
	
	public void setGroupPaidDao(GroupPaidDao groupPaidDao) {
		this.groupPaidDao = groupPaidDao;
	}
	
	///Constructor
	public GroupPaidServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public ArrayList<GroupPaid> ListGroupPaid() {
		return groupPaidDao.ListGroupPaid();
		}
}