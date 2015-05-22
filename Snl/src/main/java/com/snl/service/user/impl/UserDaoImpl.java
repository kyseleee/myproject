package com.snl.service.user.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.snl.service.domain.User;
import com.snl.service.user.UserDao;


//==> ȸ��� DAO CRUD ����
@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser", user);
	}

	public User getUser(int userNo) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser",userNo);
	}

	@Override
	public User getUserById(String id) throws Exception {
		return sqlSession.selectOne("UserMapper.getUserById",id);
	}
	
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
	}

	@Override
	public User getUserByEmail(String email) throws Exception {
		return sqlSession.selectOne("UserMapper.getUserByEmail",email);		
	}

	@Override
	public User getUserByIdEmail(User user) throws Exception {
		return sqlSession.selectOne("UserMapper.getUserByIdEmail",user);		
	}


}