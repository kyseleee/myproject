package com.snl.web.payment;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
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
		if(file.isEmpty()){
			System.out.println("널이다``````````````");
		}
		else{
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
			payment.setReceit(path.substring(path.lastIndexOf('\\')+1));
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
	public String listPaymentByDay(@RequestParam("groupNo") int groupNo, HttpServletResponse response) throws Exception{
		 
		System.out.println("/listPaymentByDay");
		response.setContentType("UTF-8");
		Map<String , Object> map=paymentService.getPaymentListByDay(groupNo);
		List<Payment> payList = (List<Payment>)map.get("list");
		System.out.println(map.get("list"));
		System.out.println(payList.size());
		
		String data="[{";
		for(int i=0;i<payList.size();i++){
//			data+="\"title\" : \""+URLEncoder.encode(payList.get(i).getPayName()+"  "+payList.get(i).getAmount()+"원", "UTF-8")+"\",";
			data+="\"title\" : \""+URLEncoder.encode(payList.get(i).getAmount()+"원", "UTF-8")+"\",";
			data+="\"start\" : \""+payList.get(i).getPayDate().substring(0,10)+"\",";
			data+="\"payNo\" : \""+payList.get(i).getPayNo()+"\",";
			data+="\"method\" : \""+URLEncoder.encode(payList.get(i).getMethod(), "UTF-8")+"\",";
			if (payList.get(i).getReceit()==null) {
				data+="\"receit\" : \"\",";
			}
			else {
				data+="\"receit\" : \""+URLEncoder.encode(payList.get(i).getReceit(), "UTF-8")+"\",";
			}
			data+="\"payName\" : \""+URLEncoder.encode(payList.get(i).getPayName(), "UTF-8")+"\",";
			data+="\"amount\" : \""+payList.get(i).getAmount()+"\",";
			data+="\"payDate\" : \""+payList.get(i).getPayDate()+"\"}";
			
			if (i!=payList.size()-1){
				data+=",{";
			}
		}
		data+="]";
		
		System.out.println(data);
		//return data;
		//return "{\"data\" : [{\"title\" : \"bunsic	23000\",\"start\" : \"2015-06-25T15:00:00\",\"method\": \"sinyong\",\"receit\": \"ss.jpg\",\"amount\": \"23000\", \"description\": \"yahoo\"}]}";
//		String temm="{\"commonVO\":{\"pageSize\":\"15\",\"page\":\"1\",\"totalPage\":\"0\",\"totalCnt\":\"0\"},\"jsonTxt\":[{\"allDay\":\"true\",\"editable\":\"false\",\"end\":\"2015-06-25\",\"id\":\"1\",\"start\":\"2015-06-25\",\"title\":\"test2\"},{title: 'eat	21000',start: '2015-04-1T20:00:00'}]}";
//		String temm="{\"data\" : {\"allDay\":\"true\",\"editable\":\"false\",\"end\":\"2015-06-25\",\"id\":\"1\",\"start\":\"2015-06-25\",\"title\":\"test2\"}}";
//		String tem11="세라믹 100원";
		//URLEncoder.encode(tem11 , "UTF-8");
//		String temm="[{\"title\": \""+URLEncoder.encode(tem11 , "UTF-8")+"\",\"id\": \"821\",\"start\": \"2015-06-10 09:00:00\",\"end\": \"2015-06-10 10:30:00\"},{\"title\": \"Zippy\",\"id\": \"822\",\"start\": \"2015-06-12 10:00:00\",\"end\": \"2015-06-12 11:30:00\"}]";
				
		return data;
		}
		
	}
	
	
//	@RequestMapping("/listPaymentByDay.do")
//	@ResponseBody
//	public String listPaymentByDay(@RequestParam("groupNo") int groupNo) throws Exception{
//		
//		System.out.println("/listPaymentByDay");
//		
//		Map<String , Object> map=paymentService.getPaymentListByDay(groupNo);
//		List<Payment> payList = (List<Payment>)map.get("list");
//		System.out.println(map.get("list"));
//		String tem = ((List<Payment>)map.get("list")).get(0).getPayDate().substring(0,19);
//		System.out.println(tem+"--"+payList.size());
////		1383811827000
//		
////		System.out.println(((List<Payment>)map.get("list")).get(0).getPayDate().substring(8,10));
//		System.out.println(new java.text.SimpleDateFormat("YYYY-MM-dd HH:mm:ss").parse(tem).getTime()/1000);
//		System.out.println();
//		System.out.println(new java.text.SimpleDateFormat("YYYY-MM-DDDD HH:mm:ss").parse("2013-11-07 00:10:27").getTime()/1000);
//		String data="[{";
//		int index=0;
//		for(int i=0;i<31;i++) {
//			if(Integer.parseInt(payList.get(index).getPayDate().substring(8,10))==i+1){
//				data+=payList.get(index).getAmount();
//				index++;
//			}
//			else{
//				data+="0";
//			}
//			
//			if(i!=30){
//				data+=",";
//			}
//		}
//		data+="]}";
//		System.out.println("결과========="+data);
//		return data;
//	}
	

