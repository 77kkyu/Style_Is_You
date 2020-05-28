package stu.common.main;

import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	Logger log = Logger.getLogger(this.getClass()); //로그
	
	@RequestMapping(value="main.do" ,method = RequestMethod.GET) // url 
	public ModelAndView mainView() throws Exception {
		
		ModelAndView mv = new ModelAndView("main"); // 보낼 url
		
		return mv;
	}
}
