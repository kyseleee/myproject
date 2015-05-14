package com.snl.service.user;

import com.snl.service.domain.User;


//==> ȸ���� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface UserService {
	
	// ȸ����
	public void addUser(User user) throws Exception;
	
	public User getUser(String id) throws Exception;

	public void updateUser(User user) throws Exception;
	
	
}