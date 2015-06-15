package com.snl.service.gmPaid;

import java.util.List;

import com.snl.service.domain.GmPaid;
import com.snl.service.domain.Group;
import com.snl.service.domain.GroupMoney;

public interface GmPaidDao {
	
	public void addGmPaid(GmPaid gmPaid) throws Exception ;

	public GmPaid getGmPaid(GmPaid gmPaid) throws Exception;

	public List<GmPaid> getPaidGmPaidByGroup(Group group) throws Exception;

	public List<GmPaid> getGmPaidList(GroupMoney groupMoney) throws Exception;

	public void updatePaid(GmPaid gmPaid) throws Exception;


}