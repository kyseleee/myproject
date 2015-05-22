//package com.snl.web.payment;
//
//import org.json.simple.JSONArray;
//import org.json.simple.JSONObject;
//import org.json.simple.parser.JSONParser;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.snl.service.domain.Payment;
//import com.snl.service.group.GroupService;
//import com.snl.service.payment.PaymentService;
//import com.snl.service.user.UserService;
//
//@Controller
//public class PaymentController_tem {
//
//	@Autowired
//	@Qualifier("paymentServiceImpl")
//	private PaymentService paymentService;
//	
//	@Autowired
//	@Qualifier("groupServiceImpl")
//	private GroupService groupService;
//	@Autowired
//	@Qualifier("userServiceImpl")
//	private UserService userService;
//	
//	public PaymentController_tem(){
//		System.out.println(this.getClass());
//	}
//	
//	@RequestMapping("/addPayment.do")
//	public String addPayment(@RequestParam("place") String json) throws Exception{
//		
//		System.out.println("/addPayment");
//		
//		//json = URLDecoder.decode((URLDecoder.decode(json, "8859_1")), "UTF-8");
//		System.out.println(json);
//		Payment payment = new Payment();
//		
//		JSONParser jsonParser = new JSONParser();
//		JSONObject jsonObject = (JSONObject) jsonParser.parse(json);
//		JSONArray dataInfoArray = (JSONArray) jsonObject.get("data");
//		System.out.println(dataInfoArray.get(0));
//		System.out.println("data================");
//		for(int i=0; i<dataInfoArray.size();i++){
//			JSONObject dataObject = (JSONObject) dataInfoArray.get(i);
//			System.out.println("method : "+dataObject.get("method"));
//			System.out.println("receit : "+dataObject.get("receit"));
//			System.out.println("date : "+dataObject.get("date"));
//			System.out.println("place : "+dataObject.get("place"));
//			System.out.println("amount : "+dataObject.get("amount"));
////			payment.setGroup(groupService.getGroup(groupNo));
//			
//			payment.setGroup(groupService.getGroup(10000));
//			String methodTem=(String)dataObject.get("method");
//			if (methodTem.equals("신용카드")) {
//				payment.setMethod("1");
//			}
//			else {
//				payment.setMethod("2");
//			}
//			payment.setReceit((String)dataObject.get("receit"));
//			payment.setPayDate((String)dataObject.get("date"));
//			payment.setPayName((String)dataObject.get("place"));
//			payment.setAmount(Integer.valueOf((String)dataObject.get("amount")));
//			System.out.println("============"+payment);
//			paymentService.addPayment(payment);
//			
//		}
//		
////		System.out.println("=========================================================================");
////		String jsonInfo = "{\"books\":[{\"genre\":\"소설\",\"price\":\"100\",\"name\":\"사람은 무엇으로 사는가?\",\"writer\":\"톨스토이\",\"publisher\":\"톨스토이 출판사\"},{\"genre\":\"소설\",\"price\":\"300\",\"name\":\"홍길동전\",\"writer\":\"허균\",\"publisher\":\"허균 출판사\"},{\"genre\":\"소설\",\"price\":\"900\",\"name\":\"레미제라블\",\"writer\":\"빅토르 위고\",\"publisher\":\"빅토르 위고 출판사\"}],\"persons\":[{\"nickname\":\"남궁민수\",\"age\":\"25\",\"name\":\"송강호\",\"gender\":\"남자\"},{\"nickname\":\"예니콜\",\"age\":\"21\",\"name\":\"전지현\",\"gender\":\"여자\"}]}";
////
////		JSONParser jsonParser = new JSONParser();
////        //JSON데이터를 넣어 JSON Object 로 만들어 준다.
////        JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonInfo);
////        //books의 배열을 추출
////        JSONArray bookInfoArray = (JSONArray) jsonObject.get("books");
////
////        System.out.println("* BOOKS *");
////
////        for(int i=0; i<bookInfoArray.size(); i++){
////
////            System.out.println("=BOOK_"+i+" ===========================================");
////            //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
////            JSONObject bookObject = (JSONObject) bookInfoArray.get(i);
////            //JSON name으로 추출
////            System.out.println("bookInfo: name==>"+bookObject.get("name"));
////            System.out.println("bookInfo: writer==>"+bookObject.get("writer"));
////            System.out.println("bookInfo: price==>"+bookObject.get("price"));
////            System.out.println("bookInfo: genre==>"+bookObject.get("genre"));
////            System.out.println("bookInfo: publisher==>"+bookObject.get("publisher"));
////
////        }
////
////        JSONArray personInfoArray = (JSONArray) jsonObject.get("persons");
////
////        System.out.println("\r\n* PERSONS *");
////
////        for(int i=0; i<personInfoArray.size(); i++){
////
////            System.out.println("=PERSON_"+i+" ===========================================");
////            JSONObject personObject = (JSONObject) personInfoArray.get(i);
////            System.out.println("personInfo: name==>"+personObject.get("name"));
////            System.out.println("personInfo: age==>"+personObject.get("age"));
////            System.out.println("personInfo: gender==>"+personObject.get("gender"));
////            System.out.println("personInfo: nickname==>"+personObject.get("nickname"));
////
////        }
//		
//		
//		
//		return "redirect:/index.html";
//	}
//}
