package com.snl.service.groupPaid.impl;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.snl.service.domain.GroupPaid;
import com.snl.service.groupPaid.GroupPaidDao;


@Repository("groupPaidDaoImpl")
public class GroupPaidDaoImpl implements GroupPaidDao{
	
	///Field	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public GroupPaidDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public ArrayList<GroupPaid> ListGroupPaid() {
		return null;
		
	}
}