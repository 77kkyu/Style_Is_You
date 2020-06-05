package stu.admin.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMainController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminMainService")
	private AdminMainService adminMainService;
	
	// adminMain
	@RequestMapping(value="/adminMain.do", method = RequestMethod.GET)
	public ModelAndView adminView(Map<String,Object> commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin/adminMain");
		
		List<Map<String,Object>> dashList = adminMainService.dashBoard(commandMap);
		mv.addObject("dashList", dashList);
			
		return mv;
	}
	
	// order_admin_a
	@RequestMapping(value="/order_admin_a")
	public ModelAndView order_admin_a(Map<String,Object> commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin/order_admin_a");
		
		List<Map<String,Object>> order_a = adminMainService.order_admin_a(commandMap);
		mv.addObject("order_a", order_a);
			
		return mv;
	}
	
	
}











