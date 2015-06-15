package com.snl.service.gmPaid.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.snl.service.domain.GmPaid;
import com.snl.service.domain.Group;
import com.snl.service.domain.GroupMoney;
import com.snl.service.gmPaid.GmPaidDao;
import com.snl.service.gmPaid.GmPaidService;


@Service("gmPaidServiceImpl")
public class GmPaidServiceImpl implements GmPaidService{
	
	///Field
	@Autowired
	@Qualifier("gmPaidDaoImpl")
	private GmPaidDao gmPaidDao;
	
	public void setGmPaidDao(GmPaidDao gmPaidDao) {
		this.gmPaidDao = gmPaidDao;
	}
	
	///Constructor
	public GmPaidServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public void addGmPaid(GmPaid gmPaid) throws Exception{
		gmPaidDao.addGmPaid(gmPaid);
	}

	public GmPaid getGmPaid(GmPaid gmPaid) throws Exception{
		return gmPaidDao.getGmPaid(gmPaid);
		
	}
	
	public List<GmPaid> getPaidGmPaidByGroup(Group group) throws Exception{
		return gmPaidDao.getPaidGmPaidByGroup(group);
	}


	@Override
	public List<GmPaid> getGmPaidList(GroupMoney groupMoney) throws Exception {
		return gmPaidDao.getGmPaidList(groupMoney);
	}

	public void updatePaid(GmPaid gmPaid) throws Exception{
		gmPaidDao.updatePaid(gmPaid);
	}
	
}