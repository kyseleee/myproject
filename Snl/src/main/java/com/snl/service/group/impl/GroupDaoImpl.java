package com.snl.service.group.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.snl.service.domain.Group;
import com.snl.service.group.GroupDao;


//==> ȸ��� DAO CRUD ����
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
}