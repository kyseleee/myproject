package com.snl.service.payment.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.snl.service.domain.Group;
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
		System.out.println("::"+getClass()+ "default Constructor Call.....");
	}
	
	@Override
	public void addPayment(Payment payment) throws Exception{
		paymentDao.addPayment(payment);
	
	}
	
	@Override
	public void updatePayment(Payment payment) throws Exception{
		paymentDao.updatePayment(payment);
	}
	
	@Override
	public void updatePaymentSameReceipt(Payment payment) throws Exception{
		paymentDao.updatePaymentSameReceipt(payment);
	}
	
	@Override
	public void deletePayment(int payNo) throws Exception{
		paymentDao.deletePayment(payNo);
	}
	
	public void deletePaymentByGroup(int groupNo) throws Exception{
		paymentDao.deletePaymentByGroup(groupNo);
	}
	
	@Override
	public List<Payment> getPaymentByGroup(Group group) throws Exception{
		return paymentDao.getPaymentByGroup(group);
	}

	
	@Override
	public Payment getMonthlyPayment(int groupNo, String month) throws Exception{
		return paymentDao.getMonthlyPayment(groupNo, month);
	}
	
	@Override
	public Map<String, Object> getPaymentListByMonth(int groupNo) throws Exception {
		
		return paymentDao.getPaymentListByMonth(groupNo);
	}
	
	@Override
	public Map<String,Object> getPaymentListByMonthDuration(int groupNo, String startDate, String endDate) throws Exception{
		
		return paymentDao.getPaymentListByMonthDuration(groupNo, startDate, endDate);
	}
	
	@Override
	public Map<String, Object> getPaymentListByDay(int groupNo) throws Exception {
		
		return paymentDao.getPaymentListByDay(groupNo);
	}
	
	@Override
	public Map<String, Object> getPaymentListByDayDuration(int groupNo, String startDate, String endDate) throws Exception {
		
		return paymentDao.getPaymentListByDayDuration(groupNo, startDate, endDate);
	}
	
	@Override
	public Map<String,Object> getPaymentListByDayDurationName(int groupNo, String startDate, String endDate, String name) throws Exception {
		return paymentDao.getPaymentListByDayDurationName(groupNo, startDate, endDate, name);
	}
}
