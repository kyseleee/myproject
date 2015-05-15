package com.snl.service.group.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.snl.service.domain.Group;
import com.snl.service.group.GroupDao;
import com.snl.service.group.GroupService;


//==> ȸ��� ���� ����
@Service("groupServiceImpl")
public class GroupServiceImpl implements GroupService{
	
	///Field
	@Autowired
	@Qualifier("groupDaoImpl")
	private GroupDao groupDao;
	
	public void setGroupDao(GroupDao groupDao) {
		this.groupDao = groupDao;
	}
	
	///Constructor
	public GroupServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addGroup(Group group) throws Exception {
		groupDao.addGroup(group);
	}
}