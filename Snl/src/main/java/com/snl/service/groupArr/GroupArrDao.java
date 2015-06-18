package com.snl.service.groupArr;

import java.util.List;

import com.snl.service.domain.Group;
import com.snl.service.domain.GroupArr;
import com.snl.service.domain.User;

public interface GroupArrDao {
	
	// INSERT
	public void addGroupArr(GroupArr groupArr) throws Exception ;

	public List<GroupArr> getGroupArrByUser(User user) throws Exception;
	
	public void deleteGroupArr(GroupArr groupArr) throws Exception;
	
	public void deleteGroupArrByGroup(int groupNo) throws Exception;
	
	public void deleteGroupArrByGroupUser(GroupArr groupArr) throws Exception;
	
	public List<GroupArr> getListGroupArr(GroupArr groupArr) throws Exception;

	public List<GroupArr> getGroupArrByGroup(int groupNo) throws Exception;

}