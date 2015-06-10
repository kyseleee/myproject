package com.snl.web.groupMoney;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.snl.service.domain.GmPaid;
import com.snl.service.domain.Group;
import com.snl.service.domain.GroupArr;
import com.snl.service.domain.GroupMoney;
import com.snl.service.domain.User;
import com.snl.service.gmPaid.GmPaidService;
import com.snl.service.group.GroupService;
import com.snl.service.groupArr.GroupArrService;
import com.snl.service.groupMoney.GroupMoneyService;
import com.snl.service.mail.MailService;

@Controller
public class GroupMoneyController {

	@Autowired
	@Qualifier("groupMoneyServiceImpl")
	private GroupMoneyService groupMoneyService;
	
	
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	@Autowired
	@Qualifier("groupArrServiceImpl")
	private GroupArrService groupArrService;
	
	@Autowired
	@Qualifier("gmPaidServiceImpl")
	private GmPaidService gmPaidService;
	
	@Autowired
	@Qualifier("mailService")
	private MailService mailService;
	
	public GroupMoneyController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping("/addGroupMoney.do")
	public String addGroupMoney(@ModelAttribute("groupMoney") GroupMoney groupMoney, @RequestParam("groupNo") int groupNo) throws Exception{
		
		System.out.println("/addGroupMoney.do");

		
		groupMoney.setGroup(groupService.getGroup(groupNo));
		groupMoneyService.addGroupMoney(groupMoney);
		System.out.println("gmNo*************"+groupMoney.getGmNo());
	
		Group group = groupService.getGroup(groupNo);
		System.out.println("group ======= "+group);

		List<GroupArr> groupArrList = groupArrService.getGroupArrByGroup(groupNo);
		System.out.println("groupArrList ======= "+groupArrList);

		for(int i=0; i<groupArrList.size(); i++){
			
			GroupArr groupArr = groupArrList.get(i);
			
			GmPaid gmPaid = new GmPaid();

			gmPaid.setUser(groupArr.getUser());
			gmPaid.setGroupMoney(groupMoney);
			gmPaid.setGroup(group);
			gmPaid.setPaid("N");
		
			gmPaidService.addGmPaid(gmPaid);

		}
		
		return "redirect:/groupMoneyView.do";	
	}

	
	
	@RequestMapping("/groupMoneyView.do")
	public String groupMoneyView(HttpSession session) throws Exception{
		
		System.out.println("/groupMoneyView.do");

		int groupNo = (int)session.getAttribute("groupNo");
		List<GroupMoney> groupMoneyList= groupMoneyService.getGroupMoneybyGroup(groupNo);
		session.setAttribute("groupMoneyList", groupMoneyList);
		Group group = groupService.getGroup(groupNo);
		GmPaid gmPaid = new GmPaid();
		gmPaid.setGroup(group);
		List<GroupArr> groupArrList = groupArrService.getGroupArrByGroup(groupNo);
		System.out.println(groupArrList);
		int groupSize = groupArrList.size();
		int paid[] = new int[groupMoneyList.size()];

		for(int i=0; i<groupMoneyList.size(); i++){
			gmPaid.setGroupMoney(groupMoneyList.get(i));
			paid[i] = 0;
			for(int j=0;j<groupArrList.size(); j++){
				gmPaid.setUser(groupArrList.get(j).getUser());
				if(gmPaidService.getGmPaid(gmPaid).getPaid().equals("Y")){
					paid[i] ++;
				}
			}			
		}

		
		session.setAttribute("group", group);
		session.setAttribute("paid", paid);
		session.setAttribute("groupSize", groupSize);
			
		return "redirect:/groupMoney.jsp";	
	}
	
	
	@RequestMapping("/gmSendMail.do")
	public String gmSendMail(@RequestParam("email") String toEmail, HttpSession session) throws Exception{
		
		System.out.println("/gmSendMail.do");

		GroupMoney groupMoney = (GroupMoney) session.getAttribute("groupMoney");
		Group group = groupService.getGroup((int) session.getAttribute("groupNo"));
		
		mailService.sendMail(toEmail, group.getGroupName()+"회비 납부 안내드립니다. \n\n " +
										"회비금액"+groupMoney.getGmPrice()+"원 납부 부탁드립니다. \n\n " +
										"http://127.0.0.1:8080/Snl/") ;		
		return "redirect:/getGroupMoney.jsp?sendMail=ok";	
	}
	
	@RequestMapping("/gmSendTel.do")
	public String gmSendTel(@RequestParam("tel") String tel, HttpSession session) throws Exception{
		
		System.out.println("/gmSendTel.do");

		return "redirect:/getGroupMoney.jsp?sendTel=ok";	
	}
	
}
