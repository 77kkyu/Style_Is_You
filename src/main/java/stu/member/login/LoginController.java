package stu.member.login;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;


@Controller
public class LoginController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	
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
				//System.out.println("사용자가 입력한 비밀번호 : " + chk.get("MEMBER_PASSWD") + "\nDB에 저장된 비밀번호 : " + commandMap.get("MEMBER_PASSWD"));
				
				 if (chk.get("MEMBER_PASSWD").equals(commandMap.get("MEMBER_PASSWD"))) { // 비밀번호가 일치 했을때 -> DB 비밀번호랑, 적은 비밀번호랑 비교
			            session.setAttribute("MEMBER_NO", chk.get("MEMBER_NO"));   //세션에 회원번호 값 저장
			            session.setAttribute("MEMBER_NAME", chk.get("MEMBER_NAME")); // 세션에 이름 값 저장
			            
			            // 세션 값이 잘 입력되었는지 확인
			           // System.out.println("세션 값 : " + session.getAttribute("MEMBER_NO") + " + " + session.getAttribute("MEMBER_NAME"));
			            
			            mv.setViewName("login/loginAction"); // View단 설정
			            mv.addObject("MEMBER", chk); // chk(키,값) view단에 ${MEMBER.ID } 사용 할 수 있도록 add
			            
				 } 
				 return mv;
			}
			
		}
		
	// 로그아웃
		@RequestMapping(value = "/logout.do")
		   public ModelAndView logout(HttpServletRequest request, CommandMap commandMap) {
			
			//세션 초기화
		      HttpSession session = request.getSession(false); // false로 생성된 세션 반환
		      if (session != null) // 세션에 저장된 데이터가 있다면
		         session.invalidate(); // 세션 초기화 실행
		      ModelAndView mv = new ModelAndView(); // mv 인스턴스화
		      mv.setViewName("redirect:login/main.do"); // view 단 main.do로 redirect
		      return mv;
		   }
			
	// 아이디 찾기 폼
		@RequestMapping(value="/findId.do")
		public ModelAndView findId(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("login/findId");
			
			return mv;
		}
		
	// 아이디 찾기 결과
		@RequestMapping(value="/findIdAction.do")
		public ModelAndView findIdAction(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("login/findIdAction");
			
			loginService.selectFindId(commandMap.getMap());
			
			return mv;
		}
		
	// 비밀번호 찾기 폼
		@RequestMapping(value="/findPw.do")
		public ModelAndView findPw(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("login/findPw");
			
			return mv;
		}
			
	// 비밀번호 찾기 결과
		@RequestMapping(value="/findPwAction.do")
		public ModelAndView findPwAction(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("login/findPwAction");
			
			loginService.selectFindPw(commandMap.getMap());
			
			return mv;
		}
		
	// 로그인한 아이디 출력
		public ModelAndView selectName(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("login/selectName");
			
			loginService.selectName(commandMap.getMap());
			
			return mv;
		}
}











