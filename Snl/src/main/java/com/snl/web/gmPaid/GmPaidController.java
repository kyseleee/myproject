package com.snl.web.gmPaid;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.snl.service.domain.GmPaid;
import com.snl.service.domain.Group;
import com.snl.service.domain.GroupMoney;
import com.snl.service.domain.User;
import com.snl.service.gmPaid.GmPaidService;
import com.snl.service.group.GroupService;
import com.snl.service.groupMoney.GroupMoneyService;
import com.snl.service.user.UserService;

@Controller
public class GmPaidController {

	@Autowired
	@Qualifier("gmPaidServiceImpl")
	private GmPaidService gmPaidService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	@Autowired
	@Qualifier("groupMoneyServiceImpl")
	private GroupMoneyService groupMoneyService;
	
	
	public GmPaidController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping("/getGmPaid.do")
	public String getGmPaid(HttpSession session, @RequestParam("gmNo") int gmNo) throws Exception{
		
		System.out.println("/getGmPaid.do");

		GroupMoney groupMoney= groupMoneyService.getGroupMoney(gmNo);
		List<GmPaid> gmPaidList = gmPaidService.getGmPaidList(groupMoney);
		System.out.println(gmPaidList);
		System.out.println(gmPaidList.size());
		session.setAttribute("gmPaidList", gmPaidList);
		session.setAttribute("groupMoney", groupMoney);
		
		return "forward:/getGroupMoney.jsp";	
	}

	@RequestMapping("/updateGmPaid.do")
	public String updateGmPaid(HttpSession session,@RequestParam("userNo") int userNo, @RequestParam("gmNo") int gmNo,HttpServletRequest request) throws Exception{
		
		System.out.println("/updateGmPaid.do");

		int groupNo = (int) session.getAttribute("groupNo");
		System.out.println("session groupNo =====> " +groupNo);
		GmPaid gmPaid = new GmPaid();
		
		GroupMoney groupMoney= groupMoneyService.getGroupMoney(gmNo);
		
		gmPaid.setUser(userService.getUser(userNo));
		gmPaid.setGroup(groupService.getGroup(groupNo));
		gmPaid.setGroupMoney(groupMoney);
		gmPaid.setPaid("Y");
		gmPaidService.updatePaid(gmPaid);

		List<GmPaid> gmPaidList = gmPaidService.getGmPaidList(groupMoney);
		request.setAttribute("gmPaidList", gmPaidList);
		request.setAttribute("groupMoney", groupMoney);


		return "forward:/getGroupMoney.jsp";	

		
	}

	
}
