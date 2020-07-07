package stu.member.join;

import java.io.PrintWriter;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		// 이메일, SMS 수신 여부
		String email_agree = (String)commandMap.get("EMAIL_AGREE");
		String sms_agree = (String)commandMap.get("SMS_AGREE");
		
		// 체크를 하지 않으면 '0' 으로 set 후 넘김
		if(email_agree == null) {
			email_agree = "0";
			commandMap.put("EMAIL_AGREE", email_agree);
		}
		if(sms_agree == null) {
			sms_agree = "0";
			commandMap.put("SMS_AGREE", sms_agree);
		}
		
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

	//아이디 중복 체크 - KMK 수정
	@RequestMapping(value="/selectIdCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public int selectIdCheck(@RequestParam("mem_userid") String mem_userid) throws Exception{
		
		int cnt = joinService.selectIdCheck(mem_userid);
		
		return cnt;
	}
	
	//이메일 중복 체크 - KMK 추가
	@RequestMapping(value="/selectEmailCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public int selectEmailCheck(@RequestParam("user_email") String user_email) throws Exception{
		
		int cnt = joinService.selectEmailCheck(user_email);
		
		return cnt;
	}
	
	//이메일 인증-회원가입 - KMK 추가
    @RequestMapping(value = "/emailAuth.do", produces = "application/json")
    @ResponseBody
    public boolean sendMailAuth(HttpSession session, @RequestParam String user_email) {
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
 
        String subject = "<STYLE IS YOU> 회원가입 인증 코드입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
        return joinService.send(subject, sb.toString(), "1teampjt@gmail.com", user_email, null);
    }
    
    //이메일 인증확인 - KMK 추가
    @RequestMapping(value = "/emailAuthCheck.do", produces = "application/json")
    @ResponseBody
    public ModelAndView emailAuth(HttpSession session, @RequestParam String joinCode) {
    	ModelAndView mv = new ModelAndView("jsonView");
    	String originalJoinCode = (String)session.getAttribute("joinCode");
    	log.debug("originalJoinCode >>>>"+originalJoinCode +" & "+joinCode);
    	if(originalJoinCode.equals(joinCode)) mv.addObject("result","complete");
    	else mv.addObject("result","fail");
    	
    	return mv;
    }
}
