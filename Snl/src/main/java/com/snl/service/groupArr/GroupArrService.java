package com.snl.service.groupArr;

import java.util.List;

import com.snl.service.domain.GroupArr;
import com.snl.service.domain.User;



public interface GroupArrService {
	
	public void addGroupArr(GroupArr groupArr) throws Exception;

	public List<GroupArr> getGroupArrByUser(User user) throws Exception;


}