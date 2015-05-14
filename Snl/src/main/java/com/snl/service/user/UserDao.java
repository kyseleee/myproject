package com.snl.service.user;

import java.util.List;

import com.snl.service.domain.User;


//==> ȸ���� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface UserDao {
	
	// INSERT
	public void addUser(User user) throws Exception ;

	public User getUser(String id) throws Exception ;
	
	public void updateUser(User user) throws Exception ;

}