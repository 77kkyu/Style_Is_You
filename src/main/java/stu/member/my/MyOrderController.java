package stu.member.my;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;
import stu.admin.main.*;

@Controller
public class MyOrderController {

Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myOrderService")
	private MyOrderService myOrderService;
	
	@Resource(name="adminMainService")
	private AdminMainService adminMainService;
	
	/* mvc:annotation-driven을 선언하면 HandlerMethodArgumentResolver가 Map형식일때 동작을 못함 해서
	 * 기본 Map형식이 아닌 map을 가지는 클래스를 만들어 사용 commandMap */
	// 마이페이지 - 주문리스트
	@RequestMapping(value="/myOrderList.do")
	public ModelAndView myOrderList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("/my/myOrderList");
		
		Object MEMBER_NO = ""; 
		//세션값 가져오기 
		HttpSession session = request.getSession(); 
		MEMBER_NO = (Object)session.getAttribute("SESSION_NO"); 
		commandMap.remove("MEMBER_NO"); 
		// 기존 회원번호 데이터 삭제 
		commandMap.put("member_no", MEMBER_NO); 
		// 세션 값으로 적용
		
		List<Map<String,Object>> my_order = myOrderService.myOrderList(commandMap);
		mv.addObject("my_order", my_order);
			
		return mv;
	}
	
	// 마이페이지 - 수취확인
	@RequestMapping(value="/order_ok.do")
	public ModelAndView order_ok(CommandMap commandMap,HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("my/myOrderList");

		
		String member_no = ""; String order_no = "";
  
		if (request.getParameter("mem_no") != null && request.getParameter("order_no") != null) {
			member_no = request.getParameter("mem_no");
			order_no = request.getParameter("order_no");
		}
		commandMap.put("member_no", member_no);
		commandMap.put("order_no", order_no);

		// STATE를 5로변경
		myOrderService.order_ok(commandMap);

		//처리후 다시 리스트 불러오기
		List<Map<String, Object>> my_order = myOrderService.myOrderList(commandMap);
		mv.addObject("my_order", my_order);

		System.out.println("mv:" + mv);

		return mv;
	}
	
	// 마이페이지 - 주문취소
	@RequestMapping(value="/order_cancle.do")
	public ModelAndView order_cancle(CommandMap commandMap,HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("my/myOrderList");
		
		/* 추가작업 - 주문 취소시 state에 입금전이라면 Order_list에 주문만 취소 시킴 */
		
		String member_no = ""; String order_no = "";
  
		if (request.getParameter("mem_no") != null && request.getParameter("order_no") != null) {
			member_no = request.getParameter("mem_no");
			order_no = request.getParameter("order_no");
		}
		commandMap.put("member_no", member_no);
		commandMap.put("order_no", order_no);
		//System.out.println("member_no : "+member_no+" / "+"order_no : "+order_no);
		System.out.println(commandMap.getMap());

		// Sevice단에서 캔슬 로직 처리
		myOrderService.order_state_cancle(commandMap);
		
		//처리후 다시 리스트 불러오기
		List<Map<String, Object>> my_order = myOrderService.myOrderList(commandMap);
		mv.addObject("my_order", my_order);
	
		return mv;
	}
	
	// 마이페이지 - 교환신청폼
	@RequestMapping(value="/order_as_form.do")
	public ModelAndView order_as_form(CommandMap commandMap,HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("my/myOrderChangeForm");
		
		String member_no = ""; String order_no = "";
  
		if (request.getParameter("mem_no") != null && request.getParameter("order_no") != null) {
			member_no = request.getParameter("mem_no");
			order_no = request.getParameter("order_no");
		}
		commandMap.put("member_no", member_no);
		commandMap.put("order_no", order_no);
		System.out.println("member_no : "+member_no+" / "+"order_no : "+order_no);
		
		// order_list에서 order_no를 통해 주문정보를 가져옴 changeForm_a 리스트맵에 담고
		List<Map<String, Object>> changeForm_a = myOrderService.changeForm_a(commandMap);
		mv.addObject("changeForm_a", changeForm_a);
		
		// order_detail에서 order_no를 통해 주문상품 전체를 가져옴 changeForm_b 리스트맵에 담고
		List<Map<String, Object>> changeForm_b = myOrderService.changeForm_b(commandMap);
		mv.addObject("changeForm_b", changeForm_b);
		System.out.println("changeForm_b :"+changeForm_b);

		return mv;
	}
	
	// AS_LIST 테이블에 입력
	@RequestMapping(value="/order_change.do")
	public ModelAndView order_change(CommandMap commandMap,HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("my/myOrderList");
		/* 
		name값으로 불러 들여 addParam으로 넣고
		버튼에서 onClick(1교환or2환불or3AS)구분자 받아서 구분 섹션에 넣기
	     */
		int order_state = Integer.parseInt(request.getParameter("chfOrder_state"));
		//System.out.println("order_state :"+order_state);
		int member_no = Integer.parseInt(commandMap.getMap().get("chfMember_no").toString());
		//System.out.println("member_no :"+member_no);
		System.out.println("commandMap.getMap() :"+commandMap.getMap());
		
		
		/* 현재 테이블에 2개 이상 신청시 한꺼번에 묶어줄 컬럼이 없기 때문에 여러개 신청시 레코드를 여러개 만들고 1개씩 처리 하는 방식으로 함
		   select_detail_no값을 ','로 잘라서 신청한 물품당 1개씩 AS_LIST테이블에 레코드 처리  - AS_STATE는 1신청, 2처리중, 3처리완료    */
		String[] detail_no = request.getParameter("select_detail_no").split(",");
		String order_detail_no = "";
		for(int i=0;i<detail_no.length;i++) {
			System.out.println("detail_no : "+detail_no[i]);
			order_detail_no = detail_no[i];
			commandMap.put("order_state", order_state);
			commandMap.put("order_detail_no", order_detail_no);
			myOrderService.order_change(commandMap);
			
		}
		
		commandMap.put("member_no", member_no);
		//처리후 다시 리스트 불러오기
		List<Map<String, Object>> my_order = myOrderService.myOrderList(commandMap);
		mv.addObject("my_order", my_order);
		
		return mv;
	}
	
	// 비밀번호 가져오기
	@RequestMapping(value="/password_f.do", method = RequestMethod.POST)
	@ResponseBody
	public String password_f(CommandMap commandMap,HttpServletRequest request) throws Exception {

		int member_no = Integer.parseInt(request.getParameter("mem_no"));
		//System.out.println("컨트롤러member_no :"+member_no);
		commandMap.put("member_no", member_no);
		
		String dbPasswd = myOrderService.pwd_chk(commandMap);
		//System.out.println("컨트롤러dbPasswd :"+dbPasswd);
		
		return dbPasswd;
	}
	
	// 마이페이지 - 교환.환불.as 리스트
	@RequestMapping(value="/myAsList.do")
	public ModelAndView myAsList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("my/myAsList");
		
		Object SESSION_NO = "";
		/*
		//세션값 가져오기
		HttpSession session = request.getSession();
		SESSION_NO = (Object)session.getAttribute("SESSION_NO");
		
		commandMap.remove("SESSION_NO"); // 기존 회원번호 데이터 삭제
		commandMap.put("SESSION_NO", SESSION_NO); // 세션 값으로 적용 추후에 바꿈
		*/
		//테스트용 세션값
		String member_no = "2";
		
		// 세션이 존재할 때만
		/*
		 * if (member_no == null) { mv.addObject("order_msg", "로그인한 사용자만 이용할수 있습니다.");
		 * return mv; }
		 */
		commandMap.put("member_no", member_no);
		
		List<Map<String,Object>> my_as_list = myOrderService.myAsList(commandMap);
		mv.addObject("my_as_list", my_as_list);
			
		return mv;
	}
	
	// 주문/변경 상세보기 
	@RequestMapping(value = "/my_detail.do")
	public ModelAndView my_detail(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("my/my_detail");

		String order_no = request.getParameter("order_no");

		List<Map<String, Object>> my_detail = adminMainService.order_detail(commandMap);
		System.out.println("my_detail:" + my_detail);

		List<Map<String, Object>> my_detail_sub = adminMainService.order_detail_sub(commandMap);
		System.out.println("my_detail_sub:" + my_detail_sub);

		mv.addObject("my_detail", my_detail);
		mv.addObject("my_detail_sub", my_detail_sub);

		return mv;
	}
	
	
}
