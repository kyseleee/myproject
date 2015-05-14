package com.snl.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.snl.service.domain.User;
import com.snl.service.user.UserDao;
import com.snl.service.user.UserService;


//==> ȸ��� ���� ����
@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	///Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}

	
	public User getUser(String id) throws Exception {
		return userDao.getUser(id);
	}

	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}
}