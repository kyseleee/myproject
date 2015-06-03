package com.snl.web.groupMoney;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.snl.service.domain.GroupMoney;
import com.snl.service.group.GroupService;
import com.snl.service.groupMoney.GroupMoneyService;

@Controller
public class GroupMoneyController {

	@Autowired
	@Qualifier("groupMoneyServiceImpl")
	private GroupMoneyService groupMoneyService;
	
	
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	
	public GroupMoneyController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping("/addGroupMoney.do")
	public String addGroupMoney(@ModelAttribute("groupMoney") GroupMoney groupMoney, @RequestParam("groupNo") int groupNo) throws Exception{
		
		System.out.println("/addGroupMoney.do");

		
		groupMoney.setGroup(groupService.getGroup(groupNo));
		System.out.println("*************"+groupMoney);
		groupMoneyService.addGroupMoney(groupMoney);
   
		
		return "redirect:/groupMoney.jsp";	
	}

	
	
	@RequestMapping("/groupMoneyView.do")
	public String groupMoneyView(HttpSession session) throws Exception{
		
		System.out.println("/groupMoneyView.do");

		int groupNo = (int)session.getAttribute("groupNo");
		List<GroupMoney> groupMoneyList= groupMoneyService.getGroupMoneybyGroup(groupNo);
		session.setAttribute("groupMoneyList", groupMoneyList);
		System.out.println(groupMoneyList);
	
		return "redirect:/groupMoney.jsp";	
	}
	
	
}
