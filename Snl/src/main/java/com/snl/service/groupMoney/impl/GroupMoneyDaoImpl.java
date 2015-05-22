package com.snl.service.groupMoney.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.snl.service.domain.GroupMoney;
import com.snl.service.groupMoney.GroupMoneyDao;
import com.snl.service.groupMoney.GroupMoneyService;


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

/*	@Override
	public Group getGroup(int groupNo) throws Exception {
		return sqlSession.selectOne("GroupMapper.getGroup", groupNo);
	}
	
	@Override
	public Group getGroupByGroupName(Group group) throws Exception {
		return sqlSession.selectOne("GroupMapper.getGroupByGroupName", group);
	}
*/	
	
}