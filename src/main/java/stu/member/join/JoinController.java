package stu.member.join;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;


@Controller
public class JoinController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinService")
	private JoinService joinService;
	
	/*
	 * // 메인 페이지
	 * 
	 * @RequestMapping(value="/main.do") public ModelAndView Main(CommandMap
	 * commandMap) throws Exception { ModelAndView mv = new ModelAndView("main");
	 * 
	 * return mv; }
	 */
	
	// 회원가입 폼
	@RequestMapping(value="/joinForm.do")
	public ModelAndView joinForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("login/joinForm");

		
		return mv;
	}
	
	// 회원가입 처리
	@RequestMapping(value="/joinAction.do")
	public ModelAndView insertMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("login/joinAction");
		
		joinService.insertMember(commandMap.getMap());
		
		/*
		 * HttpSession session = request.getSession(); session.setAttribute("MEMBER_ID",
		 * commandMap.get("MEMBER_ID"));
		 * 
		 * System.out.println("세션아이디 저장 : " + commandMap.get("MEMBER_ID"));
		 */
		
		return mv;
	}

}
