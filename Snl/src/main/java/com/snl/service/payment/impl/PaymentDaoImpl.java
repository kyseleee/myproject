package com.snl.service.payment.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.snl.service.domain.Payment;
import com.snl.service.payment.PaymentDao;

@Repository("paymentDaoImpl")
public class PaymentDaoImpl implements PaymentDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public PaymentDaoImpl() {
		System.out.println("::"+getClass()+ "default Constructor Call.....");
	}
	
	@Override
	public void addPayment(Payment payment) {
		sqlSession.insert("PaymentMapper.addPayment", payment);
	}
	
	@Override
	public Map<String, Object> getPaymentListByMonth(int groupNo){
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("list", sqlSession.selectList("PaymentMapper.getPaymentListByMonth",groupNo));
		System.out.println("===="+sqlSession.selectList("PaymentMapper.getPaymentListByMonth",groupNo).size());
		return map;
		
	}
	
	public Map<String, Object> getPaymentListByMonthDuration(int groupNo, String startDate, String endDate){
		Map<String , Object> map = new HashMap<String, Object>();
		Map<String , Object> tem = new HashMap<String, Object>();
		
		tem.put("groupNo", groupNo);
		tem.put("startDate", startDate);
		tem.put("endDate", endDate);
		
		map.put("list", sqlSession.selectList("PaymentMapper.getPaymentListByMonthDuration",tem));
		System.out.println("===="+sqlSession.selectList("PaymentMapper.getPaymentListByMonthDuration",tem).size());
		return map;
	}
	
	@Override
	public Map<String, Object> getPaymentListByDay(int groupNo){
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("list", sqlSession.selectList("PaymentMapper.getPaymentListByDay",groupNo));
		System.out.println("===="+sqlSession.selectList("PaymentMapper.getPaymentListByDay",groupNo).size());
		return map;
		
	}
}
