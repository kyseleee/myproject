package com.snl.service.groupArr.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.snl.service.domain.GroupArr;
import com.snl.service.groupArr.GroupArrDao;


@Repository("groupArrDaoImpl")
public class GroupArrDaoImpl implements GroupArrDao{
	
	///Field	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public GroupArrDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addGroupArr(GroupArr groupArr) throws Exception {
		sqlSession.insert("GroupArrMapper.addGroupArr", groupArr);	
	}
}