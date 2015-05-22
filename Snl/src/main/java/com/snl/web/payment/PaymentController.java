package com.snl.web.payment;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.snl.service.domain.Payment;
import com.snl.service.group.GroupService;
import com.snl.service.payment.PaymentService;
import com.snl.service.user.UserService;

@Controller
public class PaymentController {

	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	ServletContext ctx;
	
	int countNo;
	
	public PaymentController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/addPayment.do")
	public String addPayment(@ModelAttribute("payment") Payment payment,
							 HttpSession session) throws Exception{
		
		System.out.println("/addPayment");
		System.out.println(session.getAttribute("user"));
		payment.setGroup(groupService.getGroup(10000));
		System.out.println(payment);
		
		
		
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/fileUpload.do")
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile file,
			Model model) {
//		System.out.println("---------->" + name);
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getName());
		String originalFilename = file.getOriginalFilename();
		int lastIndex = originalFilename.lastIndexOf('.');
		String path = ctx.getRealPath("/")
		//String path = "C:/workspace(gradle)/spring02/src/main/webapp/upload" 
				//+ "/" 
				+ System.currentTimeMillis()
				+ "_" + getCountNo()
				+ originalFilename.substring(lastIndex);
		System.out.println(path);
		
		model.addAttribute("filename", file.getOriginalFilename());
		
		try {
			file.transferTo(new File(path));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return "http://localhost:8080/Snl/";
	}
	
	synchronized private int getCountNo() {
		if (countNo > 1000)
			countNo = 0;
		return ++countNo;
	}
	
}
