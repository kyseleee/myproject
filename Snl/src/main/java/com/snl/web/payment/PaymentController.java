package com.snl.web.payment;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
							 HttpSession session,@RequestParam("file") MultipartFile file) throws Exception{
		
		
		System.out.println("/fileUpload");
//		System.out.println("---------->" + name);
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getName());
		String originalFilename = file.getOriginalFilename();
		int lastIndex = originalFilename.lastIndexOf('.');
		String path = ctx.getRealPath("/")
		//String path = "C:/workspace(gradle)/spring02/src/main/webapp/upload" 
				//+ "/" 
				+ originalFilename.substring(0, lastIndex)
				+ "_" + getCountNo()
				+ originalFilename.substring(lastIndex);
		System.out.println(path);
		System.out.println(path.substring(path.lastIndexOf('\\')+1));
		
		try {
			file.transferTo(new File(path));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		
		
		
		
		
		
		
		
		System.out.println("/addPayment");
		System.out.println(session.getAttribute("user"));
		if(payment.getMethod().equals("신용카드")){
			payment.setMethod("1");
		}
		else{
			payment.setMethod("2");
		}
		payment.setGroup(groupService.getGroup(10021));
		payment.setReceit(path.substring(path.lastIndexOf('\\')+1));
		System.out.println(payment);
		
		paymentService.addPayment(payment);
		
		
		
		return "redirect:/index.jsp";
	}
	
	synchronized private int getCountNo() {
		if (countNo > 1000)
			countNo = 0;
		return ++countNo;
	}
	
	@RequestMapping(value="/listPaymentByMonth.do", method=RequestMethod.GET)
	@ResponseBody
	public String listPaymentByMonth(@RequestParam("groupNo") int groupNo) throws Exception{
		
		System.out.println("/listPaymentByMonth");
		System.out.println(groupNo);
		Map<String , Object> map=paymentService.getPaymentListByMonth(groupNo);
		List<Payment> payList = (List<Payment>)map.get("list");
		System.out.println(map.get("list"));
		System.out.println(((List<Payment>)map.get("list")).get(0).getPayDate().substring(5));
		
		String data="{\"Group\": [";
		int index=0;
		for(int i=0;i<12;i++) {
			if(Integer.parseInt(payList.get(index).getPayDate().substring(5))==i+1){
				data+=payList.get(index).getAmount();
				index++;
				System.out.println("index================"+index);
			}
			else{
				data+="0";
			}
			
			if(i!=11){
				data+=",";
			}
		}
		data+="]}";
		System.out.println("결과========="+data);
		return data;
	}
	
	@RequestMapping(value="/listPaymentByMonth.do", method=RequestMethod.POST)
	@ResponseBody
	public String listPaymentByMonthDuration(@RequestParam("groupNo") int groupNo,
									@RequestParam("startDate") String startDate, 
									@RequestParam("endDate") String endDate) throws Exception{
		
		System.out.println("/listPaymentByMonthDuration");
		System.out.println(startDate+"===="+endDate);
		
		Map<String , Object> map=paymentService.getPaymentListByMonthDuration(groupNo, startDate, endDate);
		List<Payment> payList = (List<Payment>)map.get("list");
		System.out.println(map.get("list"));
		System.out.println(((List<Payment>)map.get("list")).get(0).getPayDate().substring(5)+"==="+payList.size());
		
		String data="{\"Group\": [";
		int index=0;
		for(int i=0;i<12;i++) {
			System.out.println("i=============="+i);
			if(Integer.parseInt(payList.get(index).getPayDate().substring(5))==i+1){
				data+=payList.get(index).getAmount();
				System.out.println("index================"+index+" amount===="+payList.get(index).getAmount());
				index++;
				System.out.println("++++++index================"+index);
				if(index==payList.size()){
					break;
				}
			}
			else{
				data+="0";
			}
			
			if(i!=11){
				data+=",";
			}
		}
		data+="]}";
		System.out.println("결과========="+data);
		return data;
	}
	
	@RequestMapping("/listPaymentByDay.do")
	@ResponseBody
	public String listPaymentByDay(@RequestParam("groupNo") int groupNo) throws Exception{
		
		System.out.println("/listPaymentByDay");
		
		Map<String , Object> map=paymentService.getPaymentListByDay(groupNo);
		List<Payment> payList = (List<Payment>)map.get("list");
		System.out.println(map.get("list"));
		String tem = ((List<Payment>)map.get("list")).get(0).getPayDate().substring(0,19);
		System.out.println(tem+"--"+payList.size());
//		1383811827000
		
//		System.out.println(((List<Payment>)map.get("list")).get(0).getPayDate().substring(8,10));
		System.out.println(new java.text.SimpleDateFormat("YYYY-MM-dd HH:mm:ss").parse(tem).getTime()/1000);
		System.out.println();
		System.out.println(new java.text.SimpleDateFormat("YYYY-MM-DDDD HH:mm:ss").parse("2013-11-07 00:10:27").getTime()/1000);
		String data="{\"Group\": [";
		int index=0;
		for(int i=0;i<31;i++) {
			if(Integer.parseInt(payList.get(index).getPayDate().substring(8,10))==i+1){
				data+=payList.get(index).getAmount();
				index++;
			}
			else{
				data+="0";
			}
			
			if(i!=30){
				data+=",";
			}
		}
		data+="]}";
		System.out.println("결과========="+data);
		return data;
	}
	
}
