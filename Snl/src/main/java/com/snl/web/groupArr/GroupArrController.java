package com.snl.web.groupArr;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.snl.service.domain.Group;
import com.snl.service.domain.GroupArr;
import com.snl.service.domain.User;
import com.snl.service.group.GroupService;
import com.snl.service.groupArr.GroupArrService;
import com.snl.service.mail.MailService;
import com.snl.service.user.UserService;

@Controller
public class GroupArrController {

	@Autowired
	@Qualifier("groupArrServiceImpl")
	private GroupArrService groupArrService;
	
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	

	@Autowired
	@Qualifier("mailService")
	private MailService mailService;
	
	public GroupArrController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/sendInviteMail.do")
	public String sendInviteMail(@RequestParam("sendMsg") String toEmail, HttpSession session) throws Exception{
		
		System.out.println("/sendInviteMail.do");
		System.out.println("*********************" + toEmail);

		Group group = (Group) session.getAttribute("group");

		mailService.sendMail(toEmail, group.getGroupName()+"에 초대 되었습니다. \n\n http://127.0.0.1:8080/Snl/inviteIndex.jsp?sgroupNo="+group.getGroupNo());		
	    	
		return "redirect:/memberList.jsp";	
	}
	
	@RequestMapping("/addGroupArr.do")
	public String addGroupArr(@RequestParam("sgroupNo") String sgroupNo, @RequestParam("id") String id) throws Exception{
		
		System.out.println("/addGroupArr.do");
		System.out.println(sgroupNo);
		int groupNo = Integer.valueOf((String)sgroupNo);
		Group group = groupService.getGroup(groupNo);
		User user = userService.getUserById(id);
		
		GroupArr groupArr = new GroupArr();
		groupArr.setUser(user);
		groupArr.setGroup(group);
		groupArr.setRole("M");
		
		groupArrService.addGroupArr(groupArr);
		
		
		return "redirect:/";	
	}

	@RequestMapping("/deleteGroupArr.do")
	public String deleteUser(@RequestParam("suserNo") int suserNo , Model model) throws Exception {
		
		System.out.println("/deleteGroupArr.do");
		System.out.println("suerNo : " +Integer.valueOf(suserNo));
		int userNo = Integer.valueOf(suserNo);
		User user = userService.getUser(userNo);
		
		GroupArr groupArr = new GroupArr();
		groupArr.setUser(user);
		
		groupArrService.deleteGroupArr(groupArr);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		return "index.jsp";
	}
	
	
	@RequestMapping("/getListGroupArr.do")
	public String getListGroupArr(Model model, HttpSession session) throws Exception {
		
		System.out.println("/getListGroupArr.do");
		
	//	System.out.println("sgroupNo ##### : " +sgroupNo);
	//	System.out.println("groupNo ##### : " +groupNo);
		
		Group group = (Group) session.getAttribute("group");
		
		GroupArr groupArr = new GroupArr();		
		
		groupArr.setGroup(group);
		//groupArr.setUser((User)session.getAttribute("user"));
		
		groupArrService.getListGroupArr(groupArr);
		
		System.out.println("groupArr ##### : " +groupArrService.getListGroupArr(groupArr));
		
		model.addAttribute("list", groupArrService.getListGroupArr(groupArr));
		
		return "memberList.jsp";
		
	}

	

}
