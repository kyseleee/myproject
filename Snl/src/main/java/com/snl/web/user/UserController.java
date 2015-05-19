package com.snl.web.user;

import java.io.IOException;
import java.io.PrintWriter;

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

import com.snl.service.domain.User;
import com.snl.service.user.UserService;

@Controller
public class UserController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	
	
	public UserController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping("/addUser.do")
	public String addUser(@ModelAttribute("user") User user,@RequestParam("sgroupNo") String sgroupNo) throws Exception{

		System.out.println("/addUser.do");
		System.out.println("============="+sgroupNo);	
		userService.addUser(user);
		
		if(sgroupNo != ""){
			return "redirect:/addGroupArr.do?sgroupNo="+ sgroupNo+"&id="+user.getId();	
		}
		
		return "redirect:/index.jsp";	
	}
	
	@RequestMapping("/getUser.do")
	public void getUser( @RequestParam("id") String id, HttpServletResponse response) throws Exception {
		
		System.out.println("/getUser.do");
		//Business Logic
		User user = userService.getUser(id);
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
	
	@RequestMapping("/loginchk.do")
	public void logInChk(@RequestParam("id") String id,@RequestParam("pw") String pw , HttpSession session, HttpServletResponse response ) throws Exception{
		
		System.out.println("/loginchk.do");
		
		System.out.println("================"+id+"++"+pw);
		User dbUser=userService.getUser(id);
		
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
	   public String login(@RequestParam("userId") String id , @RequestParam("userPw") String pw,HttpSession session, HttpServletRequest request) throws Exception{
	      
	      System.out.println("/login.do");
	      
	      User dbUser=userService.getUser(id);
	      
	      System.out.println("디비유저-------"+dbUser);
	      if ((dbUser==null)||!( pw.equals(dbUser.getPw()) && id.equals(dbUser.getId()))){
	    	  return "forward:login.jsp?fail=<font color='red'>등록되지 않은 아이디이거나,</br>아이디 또는 비밀번호를 잘못 입력하셨습니다.</font>";
	      }
	      else{
	    	  session.setAttribute("user", dbUser);
	    	  return "redirect:index.jsp"; 
	      }
	      
	      
	      
	   }
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/logout.do");
		
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

		System.out.println("/updateUser.do");
		//Business Logic
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getId();
		if(sessionId.equals(user.getId())){
			session.setAttribute("user", user);
		}
		
		return "redirect:/getUser.do?userId="+user.getId();
	}
	
	
	
	
}
