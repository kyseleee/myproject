package com.snl.web.group;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.snl.service.domain.Group;
import com.snl.service.domain.User;
import com.snl.service.group.GroupService;

@Controller
public class GroupController {

	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;

	
	
	public GroupController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping("/addGroup.do")
	public String addGroup(@ModelAttribute("group") Group groups, HttpSession session) throws Exception{
		
		System.out.println("/addGroup.do");
		User user = (User) session.getAttribute("user");
	
		
		groups.setUserNo(user.getUserNo());
		
		System.out.println("groupName!!!!!!!!!!!!! = " +groups.getGroupName());
		System.out.println("user session!!!!!!!!!!!!!!!! : " + session.getAttribute("user"));
		
		groupService.addGroup(groups);
		
		
		return "redirect:/";	
	}

}
