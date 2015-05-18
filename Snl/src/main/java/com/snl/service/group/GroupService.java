package com.snl.service.group;

import com.snl.service.domain.Group;



public interface GroupService {
	
	public void addGroup(Group group) throws Exception;
	
	public Group getGroup(int groupNo) throws Exception;

	public Group getGroupByGroupName(Group group) throws Exception;

}