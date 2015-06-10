package com.snl.web.group;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.snl.service.domain.Group;
import com.snl.service.domain.GroupArr;
import com.snl.service.domain.User;
import com.snl.service.group.GroupService;
import com.snl.service.groupArr.GroupArrService;
import com.snl.service.mail.MailService;

@Controller
public class GroupController {

	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	
	@Autowired
	@Qualifier("groupArrServiceImpl")
	private GroupArrService groupArrService;

	@Autowired
	@Qualifier("mailService")
	private MailService mailService;
	
	
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

		mailService.sendMail(toEmail, group.getGroupName()+"에 초대 되었습니다. \n\n http://127.0.0.1:8080/Snl/invite.jsp?sgroupNo="+group.getGroupNo());		
	    
		
		return "redirect:/";	
	}

	@RequestMapping("/getGroupByGroupName.do")
	public Group getGroupByGroupName(@ModelAttribute("Group") Group group) throws Exception {
		
		System.out.println("/getGroupByGroupName.do");
		
		return groupService.getGroupByGroupName(group);
	}

	@RequestMapping("/setGroupNo.do")
	public String setGroupNo( @RequestParam("groupNo") int groupNo, HttpSession session) throws Exception {
		
		System.out.println("/setGroupNo.do");
		session.setAttribute("groupNo", groupNo);
		Group group = groupService.getGroup(groupNo);
		session.setAttribute("group", group);

		System.out.println("현재 groupNo"+groupNo);
		
		return "redirect:/index.jsp";	
		
	}
	@RequestMapping("/getGroup.do")
	public Group getGroup( @RequestParam("groupNo") int groupNo) throws Exception {
		
		System.out.println("/getGroup.do");
		//Business Logic
		Group group = groupService.getGroup(groupNo);
		System.out.println(group.getUser());
		
		return group;
	}
}
