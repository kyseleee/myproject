package com.snl.service.groupMoney.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.snl.service.domain.GroupMoney;
import com.snl.service.groupMoney.GroupMoneyDao;


@Repository("groupMoneyDaoImpl")
public class GroupMoneyDaoImpl implements GroupMoneyDao{
	
	///Field	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public GroupMoneyDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addGroupMoney(GroupMoney groupMoney) throws Exception {
		sqlSession.insert("GroupMoneyMapper.addGroupMoney", groupMoney);
		
	}

	public List<GroupMoney> getGroupMoneybyGroup(int groupNo) throws Exception{
		System.out.println("dao===="+groupNo);
		System.out.println(sqlSession.selectList("GroupMoneyMapper.getGroupMoneybyGroup", groupNo));
		return sqlSession.selectList("GroupMoneyMapper.getGroupMoneybyGroup", groupNo);
	}

	
}