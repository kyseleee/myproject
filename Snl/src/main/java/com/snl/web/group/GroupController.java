package com.snl.web.group;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String addGroup(@ModelAttribute("group") Group group, HttpSession session) throws Exception{
		
		System.out.println("/addGroup.do");
		
		User user = (User) session.getAttribute("user");
		group.setUser(user);
		
		groupService.addGroup(group);
		
		
		return "redirect:/";	
	}
	
	@RequestMapping("/getGroup.do")
	public Group getGroup( @RequestParam("groupNo") int groupNo) throws Exception {
		
		System.out.println("/getGroup.do");
		//Business Logic
		Group group = groupService.getGroup(groupNo);
		
		return group;
	}

}
