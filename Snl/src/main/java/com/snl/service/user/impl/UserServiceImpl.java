package com.snl.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.snl.service.domain.User;
import com.snl.service.user.UserDao;
import com.snl.service.user.UserService;


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

	@Override
	public User getUser(int userNo) throws Exception {
		return userDao.getUser(userNo);
	}

	@Override
	public User getUserById(String id) throws Exception {
		return userDao.getUserById(id);

	}

	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}

	@Override
	public User getUserByEmail(String email) throws Exception {
		return userDao.getUserByEmail(email);
		
	}

	@Override
	public User getUserByIdEmail(User user) throws Exception {
		return userDao.getUserByIdEmail(user);

	}

	
}