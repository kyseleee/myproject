package com.snl.web.groupMoney;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
import com.snl.service.textMsg.Coolsms;

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
	public String addGroupMoney(@ModelAttribute("groupMoney") GroupMoney groupMoney, HttpSession session) throws Exception{
		
		System.out.println("/addGroupMoney.do");

		int groupNo = (int) session.getAttribute("groupNo");
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

		Group group = (Group)session.getAttribute("group");
		

		List<GroupArr> groupArrListByGroup = (List<GroupArr>) session.getAttribute("groupArrListByGroup");
		
		//group의 회비List
		List<GroupMoney> groupMoneyList= groupMoneyService.getGroupMoneybyGroup(group.getGroupNo());
		
		
		GmPaid gmPaid = new GmPaid();
		gmPaid.setGroup(group);
		
		//회비마다 수납인원 파악하기.(회비list 순서)
		int[] paidList = new int[groupMoneyList.size()];

		for(int i=0; i<groupMoneyList.size(); i++){
			gmPaid.setGroupMoney(groupMoneyList.get(i));
			paidList[i] = 0;
			for(int j=0;j<groupArrListByGroup.size(); j++){
				gmPaid.setUser(groupArrListByGroup.get(j).getUser());
				if(gmPaidService.getGmPaid(gmPaid).getPaid().equals("Y")){
					paidList[i] ++;
					System.out.println("11111111");
				}
			}			
		}
		
		System.out.println("22222");
		session.setAttribute("groupMoneyList", groupMoneyList);
		session.setAttribute("paidList", paidList);
		System.out.println("3333");
		
		return "redirect:/groupMoney.jsp";	
	}
	
	
	@RequestMapping("/gmSendMail.do")
	public String gmSendMail(@RequestParam("email") String toEmail, HttpSession session) throws Exception{
		
		System.out.println("/gmSendMail.do");

		GroupMoney groupMoney = (GroupMoney) session.getAttribute("groupMoney");
		Group group = (Group) session.getAttribute("group");
		
		mailService.sendMail(toEmail, group.getGroupName()+"회비 납부 안내드립니다. \n\n " +
										"회비금액"+groupMoney.getGmPrice()+"원 납부 부탁드립니다. \n\n " +
										"http://127.0.0.1:8080/Snl/") ;
		
		return "redirect:/getGroupMoney.jsp?sendMail=ok";	
	}
	
	@RequestMapping("/gmSendTel.do")
	public String gmSendTel(@RequestParam("tel") String tel, HttpSession session) throws Exception{
		
		System.out.println("/gmSendTel.do");
		
		GroupMoney groupMoney = (GroupMoney) session.getAttribute("groupMoney");
		Group group = (Group) session.getAttribute("group");
		
		String text= "<Snl회비안내> \n"+ group.getGroupName() + "의 "+ groupMoney.getGmName() + 
						" \n : "+ groupMoney.getGmPrice()+"원 \n 납부부탁드립니다.";

		
		String[] telArray = tel.split("\\-");
		String to = "";
		
		
		for(int i=0; i<telArray.length; i++){
			to += telArray[i];
		}
		System.out.println(to);
		
		String api_key = "NCS5577D2B700722";
		String api_secret = "8C761B6D690151CA86E2FE1C1CC8379F";
		Coolsms coolsms = new Coolsms(api_key, api_secret);
	
		/*
		 * Parameters
		 * 관련정보 : http://www.coolsms.co.kr/SDK_Java_API_Reference_ko#toc-0
		 */
		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", to); // 받는사람 번호
		set.put("from", "01097035383"); // 보내는사람 번호
		set.put("text", text); // 문자내용
		set.put("type", "sms"); // 문자 타입
		set.put("app_version", ""); // 어플리케이션 버젼 예) Purplebook 4.1
	
		
		JSONObject result = coolsms.send(set); // 보내기&전송결과받기
		if (result.get("code") == null) {
			// 메시지 보내기 성공 및 전송결과 출력
			System.out.println("성공");			
			System.out.println(result.get("group_id")); // 그룹아이디
			System.out.println(result.get("result_code")); // 결과코드
			System.out.println(result.get("result_message"));  // 결과 메시지
			System.out.println(result.get("success_count")); // 메시지아이디
			System.out.println(result.get("error_count"));  // 여러개 보낼시 오류난 메시지 수

			return "redirect:/getGroupMoney.jsp?sendTel=ok";	

		} else {
			// 메시지 보내기 실패
			System.out.println("실패");
			System.out.println(result.get("code")); // 에러 메시지
		
			return "redirect:/getGroupMoney.jsp";	

		}		
		
	}
	

	
}
