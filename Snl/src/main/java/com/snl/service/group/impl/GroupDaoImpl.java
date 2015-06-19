package com.snl.service.group.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.snl.service.domain.Group;
import com.snl.service.group.GroupDao;


@Repository("groupDaoImpl")
public class GroupDaoImpl implements GroupDao{
	
	///Field	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public GroupDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addGroup(Group group) throws Exception {
		sqlSession.insert("GroupMapper.addGroup", group);	
	}

	@Override
	public Group getGroup(int groupNo) throws Exception {
		return sqlSession.selectOne("GroupMapper.getGroup", groupNo);
	}

	@Override
	public Group getGroupByGroupName(Group group) throws Exception {
		return sqlSession.selectOne("GroupMapper.getGroupByGroupName", group);
	}

	@Override
	public void deleteGroup(int groupNo) throws Exception {
		sqlSession.delete("GroupMapper.deleteGroup", groupNo);
	}
	
	@Override
	public void deleteGroupByUser(int userNo) throws Exception {
		sqlSession.delete("GroupMapper.deleteGroupByUser", userNo);
	}
	
	
}