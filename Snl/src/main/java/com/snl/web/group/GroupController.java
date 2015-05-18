package com.snl.web.group;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
	
	@Autowired
	private JavaMailSender mailSender;


	
	
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
		sendMail("endy2048@gmail.com","SNL 그룹 초대 되었습니다.",group.getGroupName()+"에 초대 되었습니다. <br> http://127.0.0.1:8080/Snl?groupNo="+group.getGroupNo());
		
		return "redirect:/";	
	}
	
	
	public void sendMail(String to, String subject, String text){
		
		SimpleMailMessage message = new SimpleMailMessage();
		
		
		message.setTo(to);
		message.setSubject(subject);
		message.setText(text);
		
		mailSender.send(message);
		
		
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
