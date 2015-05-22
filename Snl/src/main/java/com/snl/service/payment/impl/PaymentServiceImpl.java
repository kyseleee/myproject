package com.snl.service.payment.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.snl.service.domain.Payment;
import com.snl.service.payment.PaymentDao;
import com.snl.service.payment.PaymentService;

@Service("paymentServiceImpl")
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	@Qualifier("paymentDaoImpl")
	private PaymentDao paymentDao;
	
	public void setPaymentDao(PaymentDao paymentDao){
		this.paymentDao=paymentDao;
	}
	
	public PaymentServiceImpl() {
		
	}

	public void addPayment(Payment payment) throws Exception{
		paymentDao.addPayment(payment);
	}
}
