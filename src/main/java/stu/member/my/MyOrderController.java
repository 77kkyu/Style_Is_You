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
		
		Map<String, Object> Size = commandMap.getMap();
		System.out.println("commandMap1111="+Size);
		// list, detail에서 주문상태 변경 후 use_point와 save포인트를 가져옴
		List<Map<String, Object>> point =  myOrderService.order_state_cancle(commandMap);
		System.out.println("point:"+point);
		
		
		
		
		
		/*
		 * myOrderService.order_ok(commandMap);
		 * 
		 * //처리후 다시 리스트 불러오기 List<Map<String, Object>> my_order =
		 * myOrderService.myOrderList(commandMap); mv.addObject("my_order", my_order);
		 * 
		 * System.out.println("mv:" + mv);
		 */
		return mv;
	}	
	
	
}
