package com.snl.web.groupPaid;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.snl.service.domain.Group;
import com.snl.service.domain.GroupPaid;
import com.snl.service.group.GroupService;
import com.snl.service.groupMoney.GroupMoneyService;
import com.snl.service.groupPaid.GroupPaidService;
import com.snl.service.user.UserService;

@Controller
public class GroupPaidController {

	@Autowired
	@Qualifier("groupPaidServiceImpl")
	private GroupPaidService groupPaidService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	@Autowired
	@Qualifier("groupMoneyServiceImpl")
	private GroupMoneyService GroupMoneyService;
	
	
	public GroupPaidController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping("/ListGroupPaid.do")
	public String ListGroupPaid(Model model,
			@RequestParam("groupNo") int groupNo,
			Group group,
			HttpServletRequest request,
			HttpSession session) throws Exception{
	
		group = groupService.getGroup(groupNo);
		System.out.println("group data : " +group);
		
		GroupPaid groupPaid = new GroupPaid();
	//	groupPaid.setGroup(group);
		
		System.out.println("groupPaid data : " +groupPaid);
		model.addAttribute("groupPaid", groupPaidService.ListGroupPaid());
		
		return "paymentManager.jsp";
		
		
	/*	
		GroupPaid groupPaid = new GroupPaid();
		groupPaid.setUser((User) session.getAttribute("user"));
		System.out.println("User*********** : " + (User) session.getAttribute("user"));
		
		System.out.println("groupPaid data : " + groupPaid);
		
		model.addAttribute("list", groupPaid);*/
		
			
	}
}
