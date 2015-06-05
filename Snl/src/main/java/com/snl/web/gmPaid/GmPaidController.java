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
	public String getGmPaid(HttpSession session, @RequestParam("gmNo") int gmNo, HttpServletRequest request) throws Exception{
		
		System.out.println("/getGmPaid.do");

		GroupMoney groupMoney= groupMoneyService.getGroupMoney(gmNo);
		List<GmPaid> gmPaidList = gmPaidService.getGmPaidList(groupMoney);
		System.out.println(gmPaidList);
		System.out.println(gmPaidList.size());
		request.setAttribute("gmPaidList", gmPaidList);
		request.setAttribute("groupMoney", groupMoney);
		
		return "forward:/getGroupMoney.jsp";	
	}

	@RequestMapping("/paidCheck.do")
	public void paidCheck(HttpSession session, HttpServletResponse response, @RequestParam("userNo") int userNo, @RequestParam("gmNo") int gmNo) throws Exception{
		
		System.out.println("/paidCheck.do");

		int groupNo = (int) session.getAttribute("groupNo");
		GmPaid gmPaid = new GmPaid();
		
		GroupMoney groupMoney= groupMoneyService.getGroupMoney(gmNo);
		
		gmPaid.setUser(userService.getUser(userNo));
		gmPaid.setGroup(groupService.getGroup(groupNo));
		gmPaid.setGroupMoney(groupMoney);
		gmPaid.setPaid("Y");
		gmPaidService.updatePaid(gmPaid);

		List<GmPaid> gmPaidList = gmPaidService.getGmPaidList(groupMoney);
		
		int j = 0;
		
		for(int i=0; i< gmPaidList.size(); i++){
			if(gmPaidList.get(i).getRecDate().equals("Y")){
				j++;
			}
		}
		int total = j*groupMoney.getGmPrice();
		
		try{
			response.getWriter().print(total);
			
		}catch(IOException e){
			e.printStackTrace();
		}
	}

	
}
