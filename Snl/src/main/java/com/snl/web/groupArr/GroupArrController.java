package com.snl.web.groupArr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.snl.service.domain.Group;
import com.snl.service.domain.GroupArr;
import com.snl.service.domain.User;
import com.snl.service.group.GroupService;
import com.snl.service.groupArr.GroupArrService;
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
	
	public GroupArrController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping("/addGroupArr.do")
	public String addGroupArr(@RequestParam("sgroupNo") String sgroupNo, @RequestParam("id") String id) throws Exception{
		
		System.out.println("/addGroupArr.do");
		System.out.println(sgroupNo);
		int groupNo = Integer.valueOf((String)sgroupNo);
		Group group = groupService.getGroup(groupNo);
		User user = userService.getUser(id);
		
		GroupArr groupArr = new GroupArr();
		groupArr.setUser(user);
		groupArr.setGroup(group);
		groupArr.setRole("M");
		
		groupArrService.addGroupArr(groupArr);
		
		
		return "redirect:/";	
	}

}
