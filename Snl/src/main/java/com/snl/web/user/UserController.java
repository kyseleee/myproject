package com.snl.web.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.snl.service.domain.GmPaid;
import com.snl.service.domain.Group;
import com.snl.service.domain.GroupArr;
import com.snl.service.domain.Payment;
import com.snl.service.domain.User;
import com.snl.service.gmPaid.GmPaidService;
import com.snl.service.group.GroupService;
import com.snl.service.groupArr.GroupArrService;
import com.snl.service.groupMoney.GroupMoneyService;
import com.snl.service.mail.MailService;
import com.snl.service.payment.PaymentService;
import com.snl.service.user.UserService;

@Controller
public class UserController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	@Autowired
	@Qualifier("groupMoneyServiceImpl")
	private GroupMoneyService groupMoneyService;
	
	@Autowired
	@Qualifier("groupArrServiceImpl")
	private GroupArrService groupArrService;
	
	@Autowired
	@Qualifier("mailService")
	private MailService mailService;

	@Autowired
	@Qualifier("gmPaidServiceImpl")
	private GmPaidService gmPaidService;
	

	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	public UserController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping("/addUser.do")
	public String addUser(@ModelAttribute("user") User user,@RequestParam("sgroupNo") String sgroupNo) throws Exception{
		
		System.out.println("/addUser.do");
		userService.addUser(user);

		if(sgroupNo != "" ){
			return "redirect:/addGroupArr.do?sgroupNo="+ sgroupNo+"&id="+user.getId();	
		}
		
		return "redirect:/login.jsp";	
	}
	
	@RequestMapping("/getUser.do")
	public String getUser(Model model , @RequestParam("userNo") int userNo, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
	
		System.out.println("/getUser.do");
		System.out.println("user : " +userService.getUser(userNo));
		
		User user = userService.getUser(userNo);
		
		model.addAttribute("user", user);
		
		
		return "/getUser.jsp";
	}
	
	@RequestMapping("/updateUserView.do")
	public String updateUserView( @RequestParam("id") String id , Model model ) throws Exception{

		System.out.println("/updateUserView.do");

		User user = userService.getUserById(id);
		
		model.addAttribute("user", user);
		
		return "updateUser.jsp";
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser(@ModelAttribute("user") User user, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) throws Exception{
		
		System.out.println("/updateUser.do");
		
		System.out.println("user :" +user);
		
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getId();
		
		if(sessionId.equals(user.getId())) {
			session.setAttribute("user", user);
		}
		
		
		
		return "redirect:/getUser.do?userNo="+user.getUserNo();
	}
	
	@RequestMapping("/deleteUser.do")
	public String deleteUser(@RequestParam("userNo") int userNo, Model model, HttpSession session) throws Exception {
		
		System.out.println("/deleteUser.do");
		
		if(session.getAttribute("group") != null) {
		
		//gmPaid table에서 user_no Delete
		GmPaid gmPaid = new GmPaid();
		gmPaid.setUser(userService.getUser(userNo));
		gmPaid.setGroup((Group) session.getAttribute("group"));
		gmPaidService.deleteGmPaidByGroupUser(gmPaid);
		
		//groupArr table에서 user_no Delete
		GroupArr groupArr = new GroupArr();
		groupArr.setGroup((Group) session.getAttribute("group"));
		groupArr.setUser(userService.getUser(userNo));
		groupArrService.deleteGroupArrByGroupUser(groupArr);
		
		//group table에서 user_no Delete
		Group group = new Group();
		group = (Group) session.getAttribute("group");
		group.setUser(userService.getUser(userNo));
		groupService.deleteGroupByUser(userNo);
		
		//user table에서 user_no Delete
				userService.deleteUser(userNo);
		} else {
			userService.deleteUser(userNo);
		}
		
		return "logout.do";
	}
	
	@RequestMapping("/getUserById.do")
	public void getUserById( @RequestParam("id") String id, HttpServletResponse response) throws Exception {
		
		System.out.println("/getUserById.do");
		//Business Logic
		User user = userService.getUserById(id);
		String result = "{  \"result\"  :    \"false\"   }";
		if(user == null){
			result = "{  \"result\"  :    \"true\"   }";
		}
			
		try{
			response.getWriter().print(result);
			
		}catch(IOException e){
			e.printStackTrace();
		}
	
	}
	
	@RequestMapping("/getUserByEmail.do")
	public void getUserByEmail( @RequestParam("email") String email, HttpServletResponse response) throws Exception {
		
		System.out.println("/getUserByEmail.do");
		System.out.println(email);
		User user = userService.getUserByEmail(email);
		String result = "{  \"result\"  :    \"false\"   }";
		
		if(user == null){
			result = "{  \"result\"  :    \"true\"   }";
		}
		
		try{
			response.getWriter().print(result);
			
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/searchId.do")
	public void searchId( @RequestParam("email") String email, HttpServletResponse response) throws Exception {
		
		System.out.println("/searchId.do");
		System.out.println(email);
		User user = userService.getUserByEmail(email);
		String msg;
		if(user != null){
	        mailService.sendMail(email, "당신의 ID는 "+ user.getId() + "입니다.");		
	        msg ="당신의 ID가 입력하신 메일로 발송 되었습니다.";
		}
		else{
			msg ="입력하신 메일에 해당되는 ID가 없습니다.";	
		}
        
		try{
			response.getWriter().print(msg);
			
		}catch(IOException e){
			e.printStackTrace();
		}
	
	
	}
	
	@RequestMapping("/searchPw.do")
	public void searchPw(@ModelAttribute("user") User user, HttpServletResponse response) throws Exception {
		
		System.out.println("/searchPw.do");
		
		User dbUser = userService.getUserByIdEmail(user);
		String msg = "";
		  
		if(dbUser != null){
			
			String password = "";
			for(int i = 0; i < 8; i++){
			   char lowerStr = (char)(Math.random() * 26 + 97);
			   if(i%2 == 0){
			    password += (int)(Math.random() * 10);
			   }else{
			    password += lowerStr;
			   }
			}
			
			dbUser.setPw(password);
			userService.updateUser(dbUser);
			  
	        msg ="임시 비밀번호가 메일로 발송 되었습니다.";
	        mailService.sendMail(dbUser.getEmail(), 
	        		"ID '"+ dbUser.getId() + "'의 임시 비밀번호는 "+password+"입니다.");		
		}
		else{
			msg ="입력하신 정보가 맞지 않습니다.";	
		}
        
		try{
			response.getWriter().print(msg);
			
		}catch(IOException e){
			e.printStackTrace();
		}
	
	
	}
	
	@RequestMapping("/loginchk.do")
	public void logInChk(@RequestParam("id") String id,@RequestParam("pw") String pw , HttpSession session, HttpServletResponse response ) throws Exception{
		
		System.out.println("/loginchk.do");
		
		System.out.println("================"+id+"++"+pw);
		User dbUser=userService.getUserById(id);
		
		System.out.println("디비유저-------"+dbUser);
		
		PrintWriter out = response.getWriter();
	      if ((dbUser==null)||!( pw.equals(dbUser.getPw()) && id.equals(dbUser.getId()))){
	    	  out.print("no");
	    	  
	      }
	      else{
	    	  out.print("yes");
	    	  
	      }
		
	}
	
	@RequestMapping("/login.do")
	public String login(@RequestParam("userId") String id , @RequestParam("userPw") String pw, HttpSession session) throws Exception{
	      
	      System.out.println("/login.do");
	      
	      User dbUser=userService.getUserById(id);
    	  session.setAttribute("user", dbUser);
    	  String sgroupNo = (String) session.getAttribute("sgroupNo");
    	  System.out.println(sgroupNo);
    	  if(groupArrService.getGroupArrByUser(dbUser).size() == 0 && sgroupNo == null ){
    		  
    		  return "redirect:addGroup.jsp";     		  
    	
    	  }else if(groupArrService.getGroupArrByUser(dbUser).size() == 0 && sgroupNo != null){
  			
    		  return "redirect:/addGroupArr.do?sgroupNo="+ sgroupNo+"&id="+dbUser.getId();	
    	  
    	  }else{   	  
    		  //user가 속한 group들
    		  List<GroupArr> groupArrListByUser= groupArrService.getGroupArrByUser(dbUser);
	    	  //group들 중 default
    		  Group group = groupService.getGroup(groupArrListByUser.get(groupArrListByUser.size()-1).getGroup().getGroupNo());
	    	  //default group의 user리스트
  			  List<GroupArr> groupArrListByGroup = groupArrService.getGroupArrByGroup(group.getGroupNo());
  			  //그 그룹인원
  			  int groupSize = groupArrListByGroup.size();

  			  session.setAttribute("groupArrListByUser", groupArrListByUser);
  			  session.setAttribute("group", group);
  			  session.setAttribute("groupSize", groupSize);
  			  session.setAttribute("groupArrListByGroup", groupArrListByGroup);
  			  System.out.println(session.getAttribute("group"));
  			  List<GmPaid> paidGmPaid=gmPaidService.getPaidGmPaidByGroup(group);
  			  int totalGm = 0;
  			  
  			  if(paidGmPaid != null){
	  			  for(int i = 0; i<paidGmPaid.size(); i++){
	  				  totalGm += paidGmPaid.get(i).getGroupMoney().getGmPrice();
	  			  }
  			  }
  			  
  			  session.setAttribute("totalGm", totalGm);

  			  List<Payment> payment=paymentService.getPaymentByGroup(group);
  			  int totalPayment = 0;
  			  
  			  for(int i = 0; i<payment.size(); i++){
  				  totalPayment += payment.get(i).getAmount();
  			  }
  			  
  			  session.setAttribute("totalPayment", totalPayment);
  			  
  			  if(sgroupNo != null){
  	    		  return "redirect:/addGroupArr.do?sgroupNo="+ sgroupNo+"&id="+dbUser.getId();	  				  
  			  }
  			  
  	    	  return "redirect:calendar.jsp"; 
    	  } 
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) throws Exception{
		
		System.out.println("/logout.do");

		session.invalidate();
		
		return "redirect:/main.jsp";
	}
	
	
	
	
	
	
}
