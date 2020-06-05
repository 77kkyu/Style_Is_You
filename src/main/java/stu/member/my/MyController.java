package stu.member.my;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;

@Controller
public class MyController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myService")
	private MyService myService;
	
	/* mvc:annotation-driven을 선언하면 HandlerMethodArgumentResolver가 Map형식일때 동작을 못함 해서
	 * 기본 Map형식이 아닌 map을 가지는 클래스를 만들어 사용 commandMap */
	// adminMain
	@RequestMapping(value="/my_side.do")
	public ModelAndView myView(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("mypage/my_side");
		
		List<Map<String,Object>> mydashList = myService.myDash(commandMap);
		mv.addObject("mydashList", mydashList);
			
		return mv;
	}
	/*
	 * // order_admin_a
	 * 
	 * @RequestMapping(value="/order_admin_a.do") public ModelAndView
	 * order_admin_a(CommandMap commandMap,HttpServletRequest request) throws
	 * Exception {
	 * 
	 * ModelAndView mv = new ModelAndView("admin/order_admin_a");
	 * 
	 * String order_state = "0";
	 * System.out.println("뷰에서 받는값:"+request.getParameter("os"));
	 * if(request.getParameter("os") != null && request.getParameter("os") != ""){
	 * 
	 * order_state = request.getParameter("os"); } commandMap.put("order_state",
	 * order_state);
	 * 
	 * List<Map<String,Object>> order_a = myService.order_admin_a(commandMap);
	 * System.out.println("order_a:"+order_a);
	 * 
	 * mv.addObject("order_a", order_a);
	 * 
	 * return mv; }
	 * 
	 * 
	 * // state변경
	 * 
	 * @RequestMapping(value="/order_admin_a.do", method = RequestMethod.POST)
	 * public ModelAndView order_state(CommandMap commandMap,HttpServletRequest
	 * request) throws Exception {
	 * 
	 * ModelAndView mv = new ModelAndView("admin/order_admin_a");
	 * 
	 * String order_state = "0"; String order_no = "";
	 * //System.out.println("뷰에서 받는값:"+request.getParameter("os"));
	 * 
	 * if(request.getParameter("os") != null && request.getParameter("os") != ""){
	 * order_state = request.getParameter("os"); }
	 * if(request.getParameter("order_no") != null &&
	 * request.getParameter("order_no") != ""){ order_no =
	 * request.getParameter("order_no"); }
	 * 
	 * commandMap.put("order_state",order_no);
	 * commandMap.put("order_state",order_state);
	 * 
	 * myService.order_state(commandMap); //System.out.println("order_a:"+order_a);
	 * 
	 * List<Map<String,Object>> order_a = myService.order_admin_a(commandMap);
	 * 
	 * mv.addObject("order_a", order_a);
	 * 
	 * return mv; }
	 */
	 
}











