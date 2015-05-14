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

	@Override
	public User getUser(String id) throws Exception {
//		User user=sqlSession.selectOne("UserMapper.getUser",id);
//		
//		if(user==null){
//			System.out.println("==========================유저널");
//			return new User();
//		}
//		return user;
		return sqlSession.selectOne("UserMapper.getUser",id);
	}
}