package stu.member.my;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;

@Controller
public class MyOrderController {

Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myOrderService")
	private MyOrderService myOrderService;
	
	/* mvc:annotation-driven을 선언하면 HandlerMethodArgumentResolver가 Map형식일때 동작을 못함 해서
	 * 기본 Map형식이 아닌 map을 가지는 클래스를 만들어 사용 commandMap */
	// 마이페이지 - 주문리스트
	@RequestMapping(value="/myOrderList.do", method = RequestMethod.GET)
	public ModelAndView myOrderList(CommandMap commandMap, ServletRequest session) throws Exception {
		
		ModelAndView mv = new ModelAndView("my/myOrderList");
		
		String member_no = (String)session.getAttribute("MEMBER_NO");
		System.out.println("세션no:"+member_no);

		//테스트용 세션값
		member_no = "2";
		
		// 세션이 존재할 때만
		/*
		 * if (member_no == null) { mv.addObject("order_msg", "로그인한 사용자만 이용할수 있습니다.");
		 * return mv; }
		 */
		commandMap.put("member_no", member_no);
		
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
	@RequestMapping(value="/order_change.do", method = RequestMethod.GET)
	public ModelAndView order_change(CommandMap commandMap,HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("my/myOrderChangeForm");
		
		String member_no = ""; String order_no = "";
  
		if (request.getParameter("mem_no") != null && request.getParameter("order_no") != null) {
			member_no = request.getParameter("mem_no");
			order_no = request.getParameter("order_no");
		}
		commandMap.put("member_no", member_no);
		commandMap.put("order_no", order_no);
		System.out.println("member_no : "+member_no+" / "+"order_no : "+order_no);
		
		// 아래 두개를 전부 서비스단에서 한꺼번에 처리??
		// order_list에서 order_no를 통해 주문 정보를 가져오고 changeForm_a 리스트맵에 담고
		List<Map<String, Object>> changeForm_a = myOrderService.changeForm_a(commandMap);
		mv.addObject("changeForm_a", changeForm_a);
		// order_detail에서 order_no를 통해 주문상품 전체를 가져옴 changeForm_b 리스트맵에 담고
		List<Map<String, Object>> changeForm_b = myOrderService.changeForm_b(commandMap);
		mv.addObject("changeForm_b", changeForm_b);
		
		
		// 결과리턴 mv.addObject("my_order", my_order);
	
		return mv;
	}
	
	
	
}
