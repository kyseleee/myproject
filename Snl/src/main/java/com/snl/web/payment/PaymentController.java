package com.snl.web.payment;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.snl.service.domain.Payment;
import com.snl.service.group.GroupService;
import com.snl.service.payment.PaymentService;
import com.snl.service.user.UserService;

@Controller
public class PaymentController {

	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public PaymentController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/addPayment.do")
	public String addPayment(@ModelAttribute("payment") Payment payment,
							 HttpSession session) throws Exception{
		
		System.out.println("/addPayment");
		System.out.println(session.getAttribute("user"));
		payment.setGroup(groupService.getGroup(10000));
		System.out.println(payment);
		
		
		
		
		return "redirect:/index.html";
	}
}
