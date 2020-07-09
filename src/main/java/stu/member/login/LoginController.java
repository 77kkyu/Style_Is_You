package stu.member.login;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import stu.common.common.CommandMap;
import stu.member.join.JoinService;


@Controller
public class LoginController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@Resource(name="joinService")
	private JoinService joinService;
	
	// 로그인 폼
		@RequestMapping(value="/loginForm.do")
		public ModelAndView loginForm(CommandMap commandMap) throws Exception {
			
			ModelAndView mv = new ModelAndView("login/loginForm");
			
			return mv;
		}
		
	// 로그인 이후 메인페이지 이동
		@RequestMapping(value="/loginAction.do", method=RequestMethod.POST)
		public ModelAndView loginAction(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView();
			System.out.println(commandMap.getMap());
			//세션 생성
			HttpSession session = request.getSession();			
			//System.out.println("아이디 : " + commandMap.get("MEMBER_ID"));					
			Map<String, Object> chk = loginService.loginAction(commandMap.getMap());			
			//System.out.println("chk : " + chk); // 아이디 , 비밀번호 콘솔 출력			
			if (chk == null) { // 사용자가 입력한 아이디가 DB에 저장된 아이디와 일치하지 않다면
				mv.setViewName("login/loginForm");
				mv.addObject("message", "해당 아이디 혹은 비밀번호가 일치하지 않습니다.");
				return mv;
			} else { // 사용
				if(chk.get("MEMBER_DELETE").equals("1")) {
					mv.setViewName("login/loginForm");
					mv.addObject("message", "탈퇴한 회원 입니다.");					
				} else {
					if (chk.get("MEMBER_PASSWD").equals(commandMap.get("MEMBER_PASSWD"))) { // 비밀번호가 일치 했을때 -> DB 비밀번호랑,
																							// 적은 비밀번호랑 비교
						session.setAttribute("SESSION_ID", chk.get("MEMBER_ID"));
						session.setAttribute("SESSION_NO", chk.get("MEMBER_NO")); // 세션에 회원번호 값 저장
						session.setAttribute("SESSION_NAME", chk.get("MEMBER_NAME"));
						// 세션 값이 잘 입력되었는지 확인
						// System.out.println("세션 값 : " + session.getAttribute("MEMBER_NO") + " + " +
						// session.getAttribute("MEMBER_NAME"));
						mv = new ModelAndView("redirect:/main.do");
						mv.addObject("MEMBER", chk); // chk(키,값) view단에 ${MEMBER.ID } 사용 할 수 있도록 add

						System.out.println("DB : " + chk);

						// 마지막 로그인 갱신
						//loginService.lastLogin(chk.get("MEMBER_NO"));
						
						// 세션 시간 설정 (web.xml 설정)
						session.getMaxInactiveInterval();

					}
				}
				 return mv;
			}
		}
		
	// 로그아웃
		@RequestMapping(value = "/logout.do")
		   public ModelAndView logout(HttpServletRequest request, CommandMap commandMap) {
			
			//세션 초기화
		      HttpSession session = request.getSession(false); // 생성된 세션 반환
		      if (session != null) // 세션에 저장된 데이터가 있다면
		         session.invalidate(); // 세션 초기화 실행
		      
				/* System.out.println(session.getAttribute("MEMBER_NO")); */
		      
		      ModelAndView mv = new ModelAndView(); // mv 인스턴스화
		      mv.setViewName("redirect:/main.do"); // view 단 main.do로 redirect
		      return mv;
		      
		      
		   }
			
	// 아이디 찾기 폼
		@RequestMapping(value="/findId.do")
		public ModelAndView findId(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("login/findId");
			
			return mv;
		}
		
	// 아이디 찾기
		@RequestMapping(value="/findIdAction.do", method=RequestMethod.POST)
		public String selectSearchMyId(HttpSession session, CommandMap commandMap, RedirectAttributes ra) throws Exception{
			String email = (String)commandMap.get("MEMBER_EMAIL");
			Map<String, Object> map = loginService.selectFindId(commandMap.getMap());
			if (map == null) {
				  ra.addFlashAttribute("resultMsg", "입력된 정보가 일치하지 않습니다."); 
				  return  "redirect:/findId.do";
			  } 
			String user_name = (String)map.get("MEMBER_NAME");
			String user = (String)map.get("MEMBER_ID");
			
			String subject = "<STYLE IS YOU>"+user_name+"님, 아이디 찾기 결과 입니다."; 
			StringBuilder sb = new  StringBuilder();
			sb.append("귀하의 아이디는 " + user + " 입니다.");
			joinService.send(subject, sb.toString(), "1teampjt@gmail.com",  email, null); 
			ra.addFlashAttribute("resultMsg", "아이디가 발송되었습니다. 이메일을 확인해주세요.");  
			ra.addFlashAttribute("isResult", "1");
			
			return "redirect:/findId.do";
		}
		
	// 비밀번호 초기화 폼
		@RequestMapping(value="/findPw.do")
		public ModelAndView findPw(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("login/findPw");
			
			return mv;
		}
			
	// 비밀번호 초기화
		@RequestMapping(value = "/findPwAction.do", method = RequestMethod.POST)
		public String sendMailPassword(HttpSession session, CommandMap commandMap, RedirectAttributes ra)
				throws Exception {
			String email = (String) commandMap.get("MEMBER_EMAIL");
			String user = loginService.selectFindPw(commandMap.getMap());

			if (user == null) {
				ra.addFlashAttribute("resultMsg", "입력된 정보가 일치하지 않습니다.");
				return "redirect:/findPw.do";
			}
			
			int ran = new Random().nextInt(100000) + 10000;
			String password = String.valueOf(ran);

			commandMap.put("MEMBER_PASSWD", password);
			loginService.updatePw(commandMap.getMap());

			String subject = "<STYLE IS YOU>임시 비밀번호입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 임시 비밀번호는 " + password + " 입니다. 로그인 후 패스워드를 변경해 주세요.");
			joinService.send(subject, sb.toString(), "1teampjt@gmail.com", email, null);
			ra.addFlashAttribute("resultMsg", "비밀번호가 재설정 되었습니다. 이메일을 확인해주세요.");
			ra.addFlashAttribute("isResult", "1");

			return "redirect:/findPw.do";
		}
}











