package com.snl.web.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import com.snl.service.groupArr.GroupArrService;
import com.snl.service.mail.MailService;
import com.snl.service.payment.PaymentService;
import com.snl.service.user.UserService;

@Controller
public class UserController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;


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
		
		return "redirect:/main.jsp";	
	}
	
	@RequestMapping("/getUser.do")
	public String getUser(Model model , @RequestParam("userNo") int userNo) throws Exception {
		
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
	public String updateUser(@ModelAttribute("user") User user, HttpSession session) throws Exception{

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
	public String deleteUser(@RequestParam("userNo") int userNo , Model model) throws Exception {
		
		System.out.println("/deleteUser.do");
		//groupArrService.
		userService.deleteUser(userNo);
		
		System.out.println("******!!!!!!!!!!!**********");
			
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
	public void getUserByEmail( @RequestParam("userEmail") String email, HttpServletResponse response) throws Exception {
		
		System.out.println("/getUserByEmail.do");
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
	
	
	@RequestMapping("/getUserByIdEmail.do")
	public void getUserByIdEmail(@ModelAttribute("user") User user, HttpServletResponse response) throws Exception {
		
		System.out.println("/getUserByIdEmail.do");
		
		User dbUser = userService.getUserByIdEmail(user);
		String msg = "";
		if(dbUser != null){
	        msg ="당신의 PW가 메일로 발송 되었습니다.";
	        mailService.sendMail(dbUser.getEmail(), "ID '"+ dbUser.getId() + "'의 PW는 "+dbUser.getPw()+"입니다.");		
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
	      
	      
//	      try{
//				response.getWriter().print(result);
//				
//			}catch(IOException e){
//				e.printStackTrace();
//			}
		
	}
	
	@RequestMapping("/login.do")
	public String login(@RequestParam("userId") String id , @RequestParam("userPw") String pw,HttpSession session, @RequestParam("sgroupNo") String sgroupNo) throws Exception{
	      
	      System.out.println("/login.do");
	      
	      User dbUser=userService.getUserById(id);
	      
	      if ((dbUser==null)||!( pw.equals(dbUser.getPw()) && id.equals(dbUser.getId()))){
	    	  return "forward:login.jsp?fail=<font color='red'>등록되지 않은 아이디이거나,</br>아이디 또는 비밀번호를 잘못 입력하셨습니다.</font>";
	      }
	      else{
	    	  
	    	  session.setAttribute("user", dbUser);
	    	  
	    	  if(groupArrService.getGroupArrByUser(dbUser).size() != 0){
		    	  
	    		  //user가 속한 group들
	    		  List<GroupArr> groupArrListByUser= groupArrService.getGroupArrByUser(dbUser);
		    	  //group들 중 default
	    		  Group group = groupArrListByUser.get(groupArrListByUser.size()-1).getGroup();
		    	  //default group의 user리스트
	  			  List<GroupArr> groupArrListByGroup = groupArrService.getGroupArrByGroup(group.getGroupNo());
	  			  //그 그룹인원
	  			  int groupSize = groupArrListByGroup.size();

	  			  session.setAttribute("groupArrListByUser", groupArrListByUser);
	  			  session.setAttribute("group", group);
	  			  session.setAttribute("groupSize", groupSize);
	  			  session.setAttribute("groupArrListByGroup", groupArrListByGroup);
	  			  
	  			  List<GmPaid> paidGmPaid=gmPaidService.getPaidGmPaidByGroup(group);
	  			  int totalGm = 0;
	  			  
	  			  for(int i = 0; i<paidGmPaid.size(); i++){
	  				  totalGm += paidGmPaid.get(i).getGroupMoney().getGmPrice();
	  			  }
	  			  
	  			  session.setAttribute("totalGm", totalGm);
	  			  

	  			  List<Payment> payment=paymentService.getPaymentByGroup(group);
	  			  int totalPayment = 0;
	  			  
	  			  for(int i = 0; i<payment.size(); i++){
	  				  totalPayment += payment.get(i).getAmount();
	  			  }
	  			  
	  			  session.setAttribute("totalPayment", totalPayment);
		  			


	    	  }
	    	  
	    	  if(sgroupNo != ""){
	  			return "redirect:/addGroupArr.do?sgroupNo="+ sgroupNo+"&id="+dbUser.getId();	
	    	  }
	    	  return "redirect:index.jsp"; 
	    	 
	    	  
	      }
	      
	      
	      
	   }
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) throws Exception{
		
		System.out.println("/logout.do");

		session.invalidate();
		
		return "redirect:/main.jsp";
	}
	
	
	
	
	
	
}
