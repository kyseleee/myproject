package com.snl.web.groupMoney;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.snl.service.domain.Group;
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
	public String addGroupMoney(@ModelAttribute("groupMoney") GroupMoney groupMoney,  HttpSession session) throws Exception{
		
		System.out.println("/addGroupMoney.do");
		System.out.println("!!!!!!!!!!!!!!!!!!***********!!!!!!!!!!!!!!!!");
		//Group group = (Group) session.getAttribute("Group");
		Group group = new Group();
		group.setGroupNo(12412);
		groupMoney.setGroup(group);
		System.out.println(groupMoney);
		groupMoneyService.addGroupMoney(groupMoney);
		/*GroupArr groupArr = new GroupArr(user, group, new String("L"));
		groupArrService.addGroupArr(groupArr); */       
		
		return "redirect:/";	
	}

	/*@RequestMapping("/getGroupByGroupName.do")
	public Group getGroupByGroupName(@ModelAttribute("Group") Group group) throws Exception {
		
		System.out.println("/getGroupByGroupName.do");
		
		return groupService.getGroupByGroupName(group);
	}

	
	
	@RequestMapping("/getGroup.do")
	public Group getGroup( @RequestParam("groupNo") int groupNo) throws Exception {
		
		System.out.println("/getGroup.do");
		//Business Logic
		Group group = groupService.getGroup(groupNo);
		
		return group;
	}*/
}
