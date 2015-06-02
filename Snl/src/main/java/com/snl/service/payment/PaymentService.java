package com.snl.service.payment;

import java.util.Map;

import com.snl.service.domain.Payment;

public interface PaymentService {

	public void addPayment(Payment payment) throws Exception;
	
	public Map<String,Object> getPaymentListByMonth(int groupNo) throws Exception;
	
	public Map<String,Object> getPaymentListByMonthDuration(int groupNo, String startDate, String endDate) throws Exception;
	
	public Map<String,Object> getPaymentListByDay(int groupNo) throws Exception;
}