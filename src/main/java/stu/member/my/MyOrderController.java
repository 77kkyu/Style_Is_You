package stu.member.my;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;

@Controller
public class MyOrderController {

Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myOrderService")
	private MyOrderService myOrderService;
	
	/* mvc:annotation-driven을 선언하면 HandlerMethodArgumentResolver가 Map형식일때 동작을 못함 해서
	 * 기본 Map형식이 아닌 map을 가지는 클래스를 만들어 사용 commandMap */
	// myOrderList
	@RequestMapping(value="/myOrderList.do", method = RequestMethod.GET)
	public ModelAndView myOrderList(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("my/myOrderList");
		
		List<Map<String,Object>> my_Order = myOrderService.myOrderList(commandMap);
		mv.addObject("my_Order", my_Order);
			
		return mv;
	}
	
}
