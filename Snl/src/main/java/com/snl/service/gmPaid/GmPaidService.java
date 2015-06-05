package com.snl.service.gmPaid;

import java.util.ArrayList;
import java.util.List;

import com.snl.service.domain.GroupArr;
import com.snl.service.domain.GmPaid;
import com.snl.service.domain.GroupMoney;



public interface GmPaidService {
	
	public void addGmPaid(GmPaid gmPaid) throws Exception;
	
	public GmPaid getGmPaid(GmPaid gmPaid) throws Exception;

	public List<GmPaid> getGmPaidList(GroupMoney groupMoney) throws Exception;
	
	public void updatePaid(GmPaid gmPaid) throws Exception;


}