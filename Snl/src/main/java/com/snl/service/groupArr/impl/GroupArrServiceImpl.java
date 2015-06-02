package com.snl.service.groupArr.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.snl.service.domain.GroupArr;
import com.snl.service.domain.User;
import com.snl.service.groupArr.GroupArrDao;
import com.snl.service.groupArr.GroupArrService;


@Service("groupArrServiceImpl")
public class GroupArrServiceImpl implements GroupArrService{
	
	///Field
	@Autowired
	@Qualifier("groupArrDaoImpl")
	private GroupArrDao groupArrDao;
	
	public void setGroupArrDao(GroupArrDao groupArrDao) {
		this.groupArrDao = groupArrDao;
	}
	
	///Constructor
	public GroupArrServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addGroupArr(GroupArr groupArr) throws Exception {
		groupArrDao.addGroupArr(groupArr);
	}

	public List<GroupArr> getGroupArrByUser(User user) throws Exception {
		return groupArrDao.getGroupArrByUser(user);
	}
	


}