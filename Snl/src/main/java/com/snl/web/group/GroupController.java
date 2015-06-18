package com.snl.web.group;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.snl.service.domain.GmPaid;
import com.snl.service.domain.Group;
import com.snl.service.domain.GroupArr;
import com.snl.service.domain.Payment;
import com.snl.service.domain.User;
import com.snl.service.gmPaid.GmPaidService;
import com.snl.service.group.GroupService;
import com.snl.service.groupArr.GroupArrService;
import com.snl.service.groupMoney.GroupMoneyService;
import com.snl.service.mail.MailService;
import com.snl.service.payment.PaymentService;

@Controller
public class GroupController {

	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	@Autowired
	@Qualifier("groupMoneyServiceImpl")
	private GroupMoneyService groupMoneyService;
	
	@Autowired
	@Qualifier("groupArrServiceImpl")
	private GroupArrService groupArrService;

	@Autowired
	@Qualifier("mailService")
	private MailService mailService;
	
	@Autowired
	@Qualifier("gmPaidServiceImpl")
	private GmPaidService gmPaidService;
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	
	public GroupController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping("/addGroup.do")
	public String addGroup(@ModelAttribute("group") Group group, @RequestParam("sendMsg") String toEmail, HttpSession session) throws Exception{
		
		System.out.println("/addGroup.do");
		System.out.println("*********************" + toEmail);

		User user = (User) session.getAttribute("user");
		group.setUser(user);
		System.out.println(group);
		groupService.addGroup(group);
		GroupArr groupArr = new GroupArr(user, group, new String("L"));
		groupArrService.addGroupArr(groupArr);
		
		List<GroupArr> groupArrList= groupArrService.getGroupArrByUser(user);
  	  	session.setAttribute("groupArrList", groupArrList);

		mailService.sendMail(toEmail, group.getGroupName()+"에 초대 되었습니다. \n\n http://127.0.0.1:8080/Snl/login.jsp?sgroupNo="+group.getGroupNo());		
	    
		
		return "redirect:/calendar.jsp";	
	}

	@RequestMapping("/getGroupByGroupName.do")
	public Group getGroupByGroupName(@ModelAttribute("Group") Group group) throws Exception {
		
		System.out.println("/getGroupByGroupName.do");
		
		return groupService.getGroupByGroupName(group);
	}

	@RequestMapping("/setGroupNo.do")
	public String setGroupNo( @RequestParam("groupNo") int groupNo, @RequestParam("currentPage") String currentPage, HttpSession session) throws Exception {
		
		System.out.println("/setGroupNo.do");
		Group group = groupService.getGroup(groupNo);
		List<GroupArr> groupArrListByGroup = groupArrService.getGroupArrByGroup(group.getGroupNo());
		int groupSize = groupArrListByGroup.size();
	
		session.setAttribute("group", group);
		session.setAttribute("groupArrListByGroup", groupArrListByGroup);
		session.setAttribute("groupSize", groupSize);
		
		System.out.println("현재 groupNo"+groupNo);
		System.out.println(currentPage);
		
		List<GmPaid> paidGmPaid=gmPaidService.getPaidGmPaidByGroup(group);
			int totalGm = 0;
			  
			for(int i = 0; i<paidGmPaid.size(); i++){
				totalGm += paidGmPaid.get(i).getGroupMoney().getGmPrice();
			}
			  
			session.setAttribute("totalGm", totalGm);
		
		 List<Payment> payment=paymentService.getPaymentByGroup(group);
		  int totalPayment = 0;
		  
		  for(int i = 0; i<payment.size(); i++){
			  totalPayment += payment.get(i).getAmount();
		  }
		  
		  session.setAttribute("totalPayment", totalPayment);
	
		
		if(currentPage.equals("/groupMoney.jsp") || currentPage.equals("/getGroupMoney.jsp")){
			return "redirect:/groupMoneyView.do";
		}else if(currentPage.equals("/memberList.jsp")){
			return "redirect:/getListGroupArr.do";
		}else{
			return "redirect:"+currentPage;	
		}
		
	}
	
	@RequestMapping("/getGroup.do")
	public Group getGroup( @RequestParam("groupNo") int groupNo) throws Exception {
		
		System.out.println("/getGroup.do");
		//Business Logic
		Group group = groupService.getGroup(groupNo);
		System.out.println(group.getUser());
		
		return group;
	}
	
	@RequestMapping("/deleteGroup.do")
	public String deleteGroup(HttpSession session) throws Exception {
		
		System.out.println("/deleteGroup.do");
		int groupNo = ((Group)session.getAttribute("group")).getGroupNo();
		//gmPaid 삭제
		gmPaidService.deleteGmPaidByGroup(groupNo);
		//groupMoney 삭제
		groupMoneyService.deleteGroupMoneyByGroup(groupNo);
		//payment 삭제
		paymentService.deletePaymentByGroup(groupNo);
		//groupArr 삭제
		groupArrService.deleteGroupArrByGroup(groupNo);
		//group 삭제
		groupService.deleteGroup(groupNo);
		
		
		return "redirect:/addGroup.jsp";	

	}
	
}
