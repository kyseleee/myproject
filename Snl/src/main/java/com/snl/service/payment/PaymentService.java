package com.snl.service.payment;

import java.util.List;
import java.util.Map;

import com.snl.service.domain.Group;
import com.snl.service.domain.Payment;

public interface PaymentService {

	public void addPayment(Payment payment) throws Exception;
	
	public void updatePayment(Payment payment) throws Exception;
	
	public void updatePaymentSameReceipt(Payment payment) throws Exception;
	
	public void deletePayment(int payNo) throws Exception;
	
	public void deletePaymentByGroup(int groupNo) throws Exception;
	
	public Payment getMonthlyPayment(int groupNo, String month) throws Exception;
	
	public List<Payment> getPaymentByGroup(Group group) throws Exception;
	
	public Map<String,Object> getPaymentListByMonth(int groupNo) throws Exception;
	
	public Map<String,Object> getPaymentListByMonthDuration(int groupNo, String startDate, String endDate) throws Exception;
	
	public Map<String,Object> getPaymentListByDay(int groupNo) throws Exception;
	
	public Map<String,Object> getPaymentListByDayDuration(int groupNo, String startDate, String endDate) throws Exception;
	
	public Map<String,Object> getPaymentListByDayDurationName(int groupNo, String startDate, String endDate, String name) throws Exception;
}
