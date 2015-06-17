package com.snl.web.payment;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.snl.service.domain.Group;
import com.snl.service.domain.GroupArr;
import com.snl.service.domain.Payment;
import com.snl.service.domain.User;
import com.snl.service.group.GroupService;
import com.snl.service.payment.PaymentService;
import com.snl.service.textMsg.Coolsms;
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
	
	@RequestMapping("/deletePayment.do")
	public String deletePayment(@RequestParam("payNo") int payNo, HttpSession session) throws Exception{
		
		System.out.println("/deletePayment");
		paymentService.deletePayment(payNo);
		
		Group group = (Group) session.getAttribute("group");
		List<Payment> paymentList =paymentService.getPaymentByGroup(group);
		int totalPayment = 0;
		  
		for(int i = 0; i<paymentList.size(); i++){
			totalPayment += paymentList.get(i).getAmount();
		}
		  
		session.setAttribute("totalPayment", totalPayment);
		return "redirect:/calendar.jsp";
	}
	
	@RequestMapping("/addPayment.do")
	public String addPayment(@ModelAttribute("payment") Payment payment,
							 @RequestParam("groupNo") int groupNo,
							 @RequestParam(value="txtMsg", required=false, defaultValue="n") String txtMsg,
							 HttpSession session,@RequestParam("file") MultipartFile file) throws Exception{
		
		
		System.out.println("/fileUpload");
		System.out.println(txtMsg);
		if(file.isEmpty()) {
			System.out.println("널이다``````````````");
		}
		else {
			System.out.println(file.getOriginalFilename());
			System.out.println(file.getName());
			String originalFilename = file.getOriginalFilename();
			int lastIndex = originalFilename.lastIndexOf('.');
			String path = ctx.getRealPath("/")+"receit/"+groupNo+"/"
			//String path = "C:/workspace(gradle)/spring02/src/main/webapp/upload" 
					//+ "/" 
					+ originalFilename.substring(0, lastIndex)
					+ "_" + getCountNo()
					+ originalFilename.substring(lastIndex);
			System.out.println(path);
			System.out.println(path.substring(path.lastIndexOf('\\')+1));
//			System.IO.Directory.CreateDirectory
			File pathFile= new File(path);
			System.out.println(pathFile.exists());
			if(!pathFile.isDirectory()) {
				if(pathFile.mkdirs()){
					System.out.println("SUCCESSSSSSSS");
				}
				else{
					System.out.println("FAILLLLLLLLLLLLLLL");
				}
			}
			
			try {
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			} 
			payment.setReceit(path.substring(path.lastIndexOf('\\')+1));
		}
		
		
		
		
		
		
		
		
		System.out.println("/addPayment");
		System.out.println(session.getAttribute("user"));
		System.out.println(session.getAttribute("groupArrListByGroup"));
		
		if(payment.getMethod().equals("신용카드")) {
			payment.setMethod("1");
		}
		else {
			payment.setMethod("2");
		}
		payment.setGroup(groupService.getGroup(groupNo));
		
		System.out.println(payment);
		
		paymentService.addPayment(payment);
		
//		String api_key = "NCS5577D2B700722";
//		String api_secret = "8C761B6D690151CA86E2FE1C1CC8379F";
		String api_key = "NCS557E35C39AA7B";
		String api_secret = "4CA56172DC58B73B992266FF5A14A119";
		Coolsms coolsms = new Coolsms(api_key, api_secret);
		
		HashMap<String, String> set = new HashMap<String, String>();
		String toTel="";
		String method="신용카드";
		
		List<GroupArr> groupArrListByGroup=(List<GroupArr>) session.getAttribute("groupArrListByGroup");
		User user=(User)session.getAttribute("user");
		
		String tem[]=user.getTel().split("-");
		String fromTel="";
		
		Group group = (Group) session.getAttribute("group");
		List<Payment> paymentList =paymentService.getPaymentByGroup(group);
		int totalPayment = 0;
		  
		for(int i = 0; i<paymentList.size(); i++){
			totalPayment += paymentList.get(i).getAmount();
		}
		  
		session.setAttribute("totalPayment", totalPayment);

		
		
		for(String element:tem) {
			fromTel+=element;
		}
		
		for(GroupArr groupArr:groupArrListByGroup) {
			tem = userService.getUser(groupArr.getUser().getUserNo()).getTel().split("-");
			for(String element:tem) {
				toTel+=element;
			}
			toTel+=",";
		}
		System.out.println("=============="+toTel);
		if(payment.getMethod().equals("2")) {
			method="현금";
		}
		String receit="";
		if(payment.getReceit()==null) {
			receit="없음";
		}
	
		else {
			receit="http://192.168.200.122:8080/Snl/"+payment.getReceit();
		}
		String txtContent="결제수단 : "+method+"\n날짜 : "+payment.getPayDate()+"\n상호명 : "+payment.getPayName()+"\n금액 : "+payment.getAmount()+"원 \n영수증 : "+receit;
		
		set.put("to", toTel); // 받는사람 번호
		set.put("from", fromTel); // 보내는사람 번호
		set.put("text", txtContent); // 문자내용
		set.put("type", "lms"); // 문자 타입
		System.out.println("======"+set);
		
//		JSONObject result = coolsms.send(set); // 보내기&전송결과받기
//		if (result.get("code") == null) {
//			// 메시지 보내기 성공 및 전송결과 출력
//			System.out.println("성공");			
//			System.out.println(result.get("group_id")); // 그룹아이디
//			System.out.println(result.get("result_code")); // 결과코드
//			System.out.println(result.get("result_message"));  // 결과 메시지
//			System.out.println(result.get("success_count")); // 메시지아이디
//			System.out.println(result.get("error_count"));  // 여러개 보낼시 오류난 메시지 수
//		} else {
//			// 메시지 보내기 실패
//			System.out.println("실패");
//			System.out.println(result.get("code")); // 에러 메시지
//		}
		
		return "redirect:/calendar.jsp";
	}
	
	synchronized private int getCountNo() {
		if (countNo > 1000)
			countNo = 0;
		return ++countNo;
	}
	
	@RequestMapping("/updatePayment.do")
	public String updatePayment(@ModelAttribute("payment") Payment payment,
								@RequestParam("payNo") int payNo,
							 HttpSession session, @RequestParam("file") MultipartFile file) throws Exception {
		
		
		System.out.println("/updatePayment");
		
		int groupNo=((Group)session.getAttribute("group")).getGroupNo();
		int sameReceipt=0;
		if(file.isEmpty()){
			System.out.println("널이다``````````````");
			sameReceipt=1;
		}
		else{
			System.out.println(file.getOriginalFilename());
			System.out.println(file.getName());
			String originalFilename = file.getOriginalFilename();
			int lastIndex = originalFilename.lastIndexOf('.');
			String path = ctx.getRealPath("/")+"receit/"+groupNo+"/"
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
		
		System.out.println(session.getAttribute("user"));
		if(payment.getMethod().equals("신용카드")){
			payment.setMethod("1");
		}
		else{
			payment.setMethod("2");
		}
		payment.setGroup(groupService.getGroup(groupNo));
		payment.setPayNo(payNo);
		
		System.out.println(payment);
		
		if(sameReceipt==1) {
			paymentService.updatePaymentSameReceipt(payment);
		}
		else {
			paymentService.updatePayment(payment);
		}
		
		
		Group group = (Group) session.getAttribute("group");
		List<Payment> paymentList =paymentService.getPaymentByGroup(group);
		int totalPayment = 0;
		  
		for(int i = 0; i<paymentList.size(); i++){
			totalPayment += paymentList.get(i).getAmount();
		}
		
		session.setAttribute("totalPayment", totalPayment);
		
		return "redirect:/calendar.jsp";
	}
	
	
	@RequestMapping(value="/listPaymentByMonth.do", method=RequestMethod.GET)
	@ResponseBody
	public String listPaymentByMonth(@RequestParam("groupNo") int groupNo) throws Exception{
		
		System.out.println("/listPaymentByMonth");
		System.out.println(groupNo);
		Map<String , Object> map=paymentService.getPaymentListByMonth(groupNo);
		List<Payment> payList = (List<Payment>)map.get("list");
		System.out.println(map.get("list"));
		System.out.println(payList.size());
		
		String data="{\"name\": \""+groupService.getGroup(groupNo).getGroupName()+"\",\"Group\": [";
		
		if(payList.size()==0) {
			data="{\"name\": \""+groupService.getGroup(groupNo).getGroupName()+"\",\"Group\": \"nodata\"}";
			return data;
		}
		
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
		
		
		String data="{\"name\": \""+groupService.getGroup(groupNo).getGroupName()+"\",\"Group\": [";
		
		if(payList.size()==0) {
			data="{\"name\": \""+groupService.getGroup(groupNo).getGroupName()+"\",\"Group\": \"nodata\"}";
			return data;
		}
		
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
	public String listPaymentByDay(@RequestParam("groupNo") int groupNo, HttpServletResponse response,
									HttpServletRequest request) throws Exception{
		 
		System.out.println("/listPaymentByDay");
		request.setCharacterEncoding("UTF-8");
		
		
		Map<String , Object> map=paymentService.getPaymentListByDay(groupNo);
		List<Payment> payList = (List<Payment>)map.get("list");
		System.out.println(map.get("list"));
		System.out.println(payList.size());
		
		String data="[{";
		for(int i=0;i<payList.size();i++){
//			data+="\"title\" : \""+URLEncoder.encode(payList.get(i).getPayName()+"  "+payList.get(i).getAmount()+"원", "UTF-8")+"\",";
//			data+="\"title\" : \""+URLEncoder.encode(payList.get(i).getAmount()+"원", "UTF-8")+"\",";
			data+="\"title\" : \""+payList.get(i).getAmount()+"\",";
			data+="\"start\" : \""+payList.get(i).getPayDate().substring(0,10)+"\",";
			data+="\"payNo\" : \""+payList.get(i).getPayNo()+"\",";
			data+="\"method\" : \""+URLEncoder.encode(payList.get(i).getMethod(), "UTF-8")+"\",";
			if (payList.get(i).getReceit()==null) {
				data+="\"receit\" : \"-\",";
			}
			else {
				data+="\"receit\" : \""+URLEncoder.encode(payList.get(i).getReceit(), "UTF-8")+"\",";
			}
			data+="\"payName\" : \""+URLEncoder.encode(payList.get(i).getPayName(), "UTF-8")+"\",";
			data+="\"amount\" : \""+payList.get(i).getAmount()+"\",";
			data+="\"payDate\" : \""+payList.get(i).getPayDate().substring(0,10)+"\"}";
			
			if (i!=payList.size()-1){
				data+=",{";
			}
		}
		data+="]";
		response.setContentType("text/plain;charset=UTF-8");
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
		
	
	@RequestMapping("/getMonthlyPayment.do")
	@ResponseBody
	public String getMonthlyPayment(@RequestParam("date") String date, @RequestParam("groupNo") int groupNo) throws Exception{
		
		System.out.println("/getMonthlyPayment");
		
		date=date.substring(0,7);
		System.out.println(date+"==="+groupNo);
		
		Payment payment = paymentService.getMonthlyPayment(groupNo,date);
		if(payment==null) {
			payment=new Payment();
			payment.setAmount(0);
		}
		System.out.println(payment+"============");
		System.out.println(payment.getAmount());
		return Integer.toString(payment.getAmount());
	}
	
	@RequestMapping("/listPaymentByDayDuration.do")
	@ResponseBody
	public String listPaymentByDayDuration(@RequestParam(value="fromGraph", required=false, defaultValue="n") String fromGraph,
											@RequestParam("startDate") String startDate,
											@RequestParam("endDate") String endDate,
									HttpServletResponse response, HttpSession session,
									HttpServletRequest request) throws Exception{
		System.out.println("/listPaymentByDayDuration");
		
		if(fromGraph.equals("y")) {
			
		}
		
		
//		request.setCharacterEncoding("UTF-8");
		int groupNo=((Group)session.getAttribute("group")).getGroupNo();
		
		Map<String , Object> map=paymentService.getPaymentListByDayDuration(groupNo, startDate, endDate);
		List<Payment> payList = (List<Payment>)map.get("list");
		
		String data="[";
		String method="";
		for(int i=0;i<payList.size();i++) {
			data+="{\"payDate\" : \""+payList.get(i).getPayDate().substring(0, 10)+"\",";
			data+="\"payName\" : \""+URLEncoder.encode(payList.get(i).getPayName(), "UTF-8")+"\",";
			data+="\"amount\" : \""+payList.get(i).getAmount()+"\",";
			if(payList.get(i).getMethod()=="1") {
				method="신용카드";
			}
			else {
				method="현금";
			}
			data+="\"method\" : \""+URLEncoder.encode(method, "UTF-8")+"\",";
			if (payList.get(i).getReceit()==null) {
				data+="\"receipt\" : \"-\"}";
			}
			else {
				data+="\"receipt\" : \""+payList.get(i).getReceit()+"\"}";
			}
			
			if (i!=payList.size()-1) {
				data+=",";
			}
			
		}
		data+="]";
//		response.setContentType("text/plain;charset=UTF-8");
		return data;
	}
	
}
	
	


