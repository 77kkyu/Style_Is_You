package stu.admin.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;

@Controller
public class AdminMainController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminMainService")
	private AdminMainService adminMainService;
	
	/* mvc:annotation-driven을 선언하면 HandlerMethodArgumentResolver가 Map형식일때 동작을 못함 해서
	 * 기본 Map형식이 아닌 map을 가지는 클래스를 만들어 사용 commandMap */
	// adminMain
	@RequestMapping(value="/adminMain.do", method = RequestMethod.GET)
	public ModelAndView adminView(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin/adminMain");
		
		List<Map<String,Object>> dashList = adminMainService.dashBoard(commandMap);
		mv.addObject("dashList", dashList);
			
		return mv;
	}
	
	// order_admin_a
	@RequestMapping(value="/order_admin_a.do")
	public ModelAndView order_admin_a(CommandMap commandMap,HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin/order_admin_a");
		
		String order_state = "0";
<<<<<<< HEAD
		if(request.getParameter("order_state") != null && request.getParameter("order_state") != ""){

			order_state = request.getParameter("order_state");
=======
		System.out.println("뷰에서 받는값:"+request.getParameter("os"));
		if(request.getParameter("os") != null && request.getParameter("os") != ""){

			order_state = request.getParameter("os");
>>>>>>> origin/syk_06-05_1
        }
		commandMap.put("order_state", order_state);
		
		List<Map<String,Object>> order_a = adminMainService.order_admin_a(commandMap);
<<<<<<< HEAD
		System.out.println("order_a:"+order_a);
		
		mv.addObject("order_a", order_a);
			
=======
		System.out.println("order_state:"+order_state);
		
		if (order_a.isEmpty()) {
			mv.addObject("order_a", order_a);
			mv.addObject("order_state", order_state);
		}else {
			mv.addObject("order_a", order_a);
		}

		System.out.println("mv:"+mv);	
>>>>>>> origin/syk_06-05_1
		return mv;
	}
	
	
<<<<<<< HEAD
=======
	  // state변경 
	  
	  @RequestMapping(value="/order_admin_a.do", method = RequestMethod.POST)
	  public ModelAndView order_state(CommandMap commandMap,HttpServletRequest
	  request) throws Exception {
	  
	  ModelAndView mv = new ModelAndView("admin/order_admin_a");
	  
	  String order_state = "0"; String order_no = "";
	  //System.out.println("뷰에서 받는값:"+request.getParameter("os"));
	  
	  if(request.getParameter("os") != null && request.getParameter("os") != ""){	  
		  order_state = request.getParameter("os"); 
	  }
	  if(request.getParameter("order_no") != null && request.getParameter("order_no") != ""){	  
		  order_no = request.getParameter("order_no"); 
	  }
	  
	  commandMap.put("order_state",order_no);
	  commandMap.put("order_state",order_state);
	  
	  adminMainService.order_state(commandMap);
	  //System.out.println("order_a:"+order_a);
	  
	  List<Map<String,Object>> order_a = adminMainService.order_admin_a(commandMap);
	  
	  
	  
	  
	  
	  mv.addObject("order_a", order_a);
	  
	  return mv; }
	 
>>>>>>> origin/syk_06-05_1
}











