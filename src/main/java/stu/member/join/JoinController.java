package stu.member.join;

import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@RequestMapping(value="/joinAction.do", method=RequestMethod.POST)
	public ModelAndView insertMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("login/joinAction");
		
		// 이메일
		// 직접입력이 아닌 선택입력일 경우
		String email = request.getParameter("MEMBER_EMAIL") + "@" + request.getParameter("MEMBER_EMAIL2");
		// 직접입력일 경우
		if(request.getParameter("MEMBER_EMAIL2") == "") {
			email = request.getParameter("MEMBER_EMAIL");
		}
		commandMap.remove("MEMBER_EMAIL"); // 기존 MEMBER_EMAIL 데이터 삭제
		commandMap.put("MEMBER_EMAIL", email); // 위에 정의한 email로 put
		
		// 생일
		
		// birth = 년  + 월  + 일;
		String birth = request.getParameter("MEMBER_BIRTH") + request.getParameter("MEMBER_BIRTH2") 
						+ request.getParameter("MEMBER_BIRTH3");	
		commandMap.remove("MEMBER_BIRTH"); // 기존 MEMBER_BIRTH 데이터 삭제
		commandMap.put("MEMBER_BIRTH", birth); // 위에 정의한 birth로 put 
	
		// DB 처리
		joinService.insertMember(commandMap.getMap()); // 위에 정의한 MEMBER_EMAIL과 MEMBER_BIRTH 작업 이후의 데이터 INSERT
		
		System.out.println(commandMap.getMap()); // 다시한번 프린트로 확인을 위한 라인	
		
		// joinAction.jsp에서 EL사용 할 수 있도록 MEMBER_NAME의 데이터를 addObject
        mv.addObject("MEMBER_NAME", commandMap.get("MEMBER_NAME")); 
        
		
		/*
		 * HttpSession session = request.getSession(); session.setAttribute("MEMBER_ID",
		 * commandMap.get("MEMBER_ID"));
		 * 
		 * System.out.println("세션아이디 저장 : " + commandMap.get("MEMBER_ID"));
		 */
		
		return mv;
	}
	
	// 아이디 중복 체크
	@RequestMapping(value="/selectIdCheck.do")
	@ResponseBody
	public void selectIdCheck(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap) throws Exception{
		PrintWriter out = response.getWriter();
		String paramId= (request.getParameter("MEMBER_ID") == null)?"":String.valueOf(request.getParameter("MEMBER_ID"));
		int checkId = joinService.selectIdCheck(paramId);
		
		out.print(checkId);
		out.flush();
		out.close();
	}
	
	// 첫번째 약관 내용보기
	@RequestMapping(value="/pop1.do")
	public ModelAndView pop1() throws Exception {
		ModelAndView mv = new ModelAndView("popUps/pop1");
		
		return mv;
	}
	
	// 두번째 약관 내용보기
	@RequestMapping(value="/pop2.do")
	public ModelAndView pop2() throws Exception {
		ModelAndView mv = new ModelAndView("popUps/pop2");
		
		return mv;
	}
	


}
