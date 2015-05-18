package com.snl.web.group;

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
import com.snl.service.mail.MailService;

@Controller
public class GroupController {

	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;

	@Autowired
	@Qualifier("mailService")
	private MailService mailService;

	
	public GroupController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping("/addGroup.do")
	public String addGroup(@ModelAttribute("group") Group group, HttpSession session) throws Exception{
		
		System.out.println("/addGroup.do");
		
		User user = (User) session.getAttribute("user");
		group.setUser(user);

		groupService.addGroup(group);
		System.out.println(group);
		 
        mailService.sendMail("kyseleee@naver.com", group.getGroupName()+"에 초대 되었습니다. \n\n http://127.0.0.1:8080/Snl?groupNo="+group.getGroupNo());		
		
		return "redirect:/";	
	}

	@RequestMapping("/getGroupByGroupName.do")
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
	}
}
