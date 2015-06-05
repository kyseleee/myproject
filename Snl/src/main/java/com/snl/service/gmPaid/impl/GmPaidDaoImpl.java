package com.snl.service.gmPaid.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.snl.service.domain.GmPaid;
import com.snl.service.domain.GroupMoney;
import com.snl.service.gmPaid.GmPaidDao;


@Repository("gmPaidDaoImpl")
public class GmPaidDaoImpl implements GmPaidDao{
	
	///Field	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public GmPaidDaoImpl() {
		System.out.println(this.getClass());
	}

	public void addGmPaid(GmPaid gmPaid) throws Exception{
		sqlSession.insert("GmPaidMapper.addGmPaid", gmPaid);
		System.out.println("db insert --->" +gmPaid);
	}

	public GmPaid getGmPaid(GmPaid gmPaid) throws Exception {
		return sqlSession.selectOne("GmPaidMapper.getGmPaid", gmPaid);
	}
	
	public List<GmPaid> getGmPaidList(GroupMoney groupMoney) throws Exception {
		return sqlSession.selectList("GmPaidMapper.getGmPaidList", groupMoney);
	}
	
	public void updatePaid(GmPaid gmPaid) throws Exception{
		sqlSession.update("GmPaidMapper.updatePaid", gmPaid);

	}

}