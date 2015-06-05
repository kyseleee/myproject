package com.snl.service.user;

import com.snl.service.domain.User;


//==> ȸ���� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface UserDao {
	
	// INSERT
	public void addUser(User user) throws Exception ;

	public User getUser(int userNo) throws Exception ;

	public User getUserById(String id) throws Exception ;

	public void updateUser(User user) throws Exception ;
	
	public User getUserByEmail(String email) throws Exception;

	public User getUserByIdEmail(User user) throws Exception;
	
	public void deleteUser(int userNo) throws Exception;
}