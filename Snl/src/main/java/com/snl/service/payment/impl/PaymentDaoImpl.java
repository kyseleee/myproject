package com.snl.service.payment.impl;

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
		System.out.println(this.getClass());
	}
	
	@Override
	public void addPayment(Payment payment) {
		sqlSession.insert("PaymentMapper.addPayment", payment);
	}
}
