package stu.member.my;

import java.io.PrintWriter;
import java.util.List;
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
public class myController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "myService")
	private myService myService;

	// 마이페이지 메인
	@RequestMapping(value = "/my/myMain.do", method = RequestMethod.GET)
	public ModelAndView orderList(Map<String, Object> commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("my/myMain");

		return mv;
	}

	// 수정 전 비밀번호 확인
	@RequestMapping(value = "/my/memberModify.do", method = RequestMethod.GET)
	public ModelAndView pwdCheck() throws Exception {
		ModelAndView mv = new ModelAndView("my/pwdCheck");

		return mv;
	}

	//회원 정보 수정 폼 이동
	@RequestMapping(value = "/my/memberModify.do", method = RequestMethod.POST)
	public ModelAndView select(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("비빌번호 입력시"+ commandMap.getMap());
		//세션값 가져오기
		String id = (String) session.getAttribute("SESSION_ID");
		commandMap.put("MEMBER_ID", id);

		String pw = (String) myService.pwdCheck(commandMap.getMap(), "MEMBER_ID");
		Map<String, Object> MemberInfo;

		if (id.equals(pw)) {

			mv.setViewName("my/memberModify");
			MemberInfo = myService.memberModify(id);
			mv.addObject("MEMBER", MemberInfo);

		} else {
			mv.addObject("alert", "비밀번호가 올바르지 않습니다.");
			mv.setViewName("my/pwdCheck");
		}
		return mv;
	}

	// 회원 정보 수정 처리
	@RequestMapping(value="/my/memberModifyAction.do",method=RequestMethod.POST)
	public ModelAndView memberModifyAction(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("my/myOrderList");
			System.out.println("수정클릭"+commandMap.getMap());
			Object MEMBER_NO = "";
			
			//세션값 가져오기
			HttpSession session = request.getSession();
			MEMBER_NO = (Object)session.getAttribute("SESSION_NO");
	
			commandMap.remove("MEMBER_NO"); // 기존 회원번호 데이터 삭제
			commandMap.put("MEMBER_NO", MEMBER_NO); // 세션 값으로 적용
			
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
			String email = request.getParameter("MEMBER_EMAIL");

			//System.out.println("MEMBER_EMAIL : " + email);				
			commandMap.remove("MEMBER_EMAIL"); // 기존 MEMBER_EMAIL 데이터 삭제
			commandMap.put("MEMBER_EMAIL", email); // 위에 정의한 email로 put				
			// 생일				
			// birth = 년  + 월  + 일;
			String birth = request.getParameter("MEMBER_BIRTH") 
						 + request.getParameter("MEMBER_BIRTH2") 
						 + request.getParameter("MEMBER_BIRTH3");	
			
			//System.out.println("MEMBER_BIRTH : " + birth);
		
			commandMap.remove("MEMBER_BIRTH"); // 기존 MEMBER_BIRTH 데이터 삭제
			commandMap.put("MEMBER_BIRTH", birth); // 위에 정의한 birth로 put				

			 myService.memberModifyAction(commandMap.getMap());

		return mv;
	}
	
	// 회원 탈퇴 폼
	@RequestMapping(value="/my/memberDelete.do")
	public ModelAndView memberDelete(Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("my/memberDelete");
		
		return mv;
	}
	
	// 회원 탈퇴 처리
	@RequestMapping(value="/my/memberDeleteAction.do")
	@ResponseBody
	public ModelAndView memberDeleteAction(Map<String, Object> commandMap, HttpSession session, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		String id = (String)session.getAttribute("SESSION_ID");
		commandMap.put("MEMBER_ID", id);
		myService.memberDelete(commandMap);
		
		session.removeAttribute("SESSION_ID");
		session.removeAttribute("SESSION_NO");
		session.removeAttribute("SESSION_NAME");
		
		String url = request.getScheme()+"://"
					+request.getServerName()+":"
					+request.getServerPort()
					+request.getContextPath()+"/main.do";
		mv.addObject("URL", url);
		mv.addObject("result", "complete");
		
		return mv;
	}
	
	//포인트 리스트 출력
	@RequestMapping(value="/my/myPointList.do")
	public ModelAndView myPointList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("my/myPointList");
		
		Object MEMBER_NO = ""; 
		//세션값 가져오기 
		HttpSession session = request.getSession(); 
		MEMBER_NO = (Object)session.getAttribute("SESSION_NO"); 
		commandMap.remove("MEMBER_NO"); 
		// 기존 회원번호 데이터 삭제 
		commandMap.put("MEMBER_NO", MEMBER_NO); 
		// 세션 값으로 적용
		
		List<Map<String,Object>> list = myService.myPointList(commandMap);
		//POINT_NO, POINT_VAL, POINT_SAVE_DATE, POINT_USE_DATE, POINT_TOTAL
		
		mv.addObject("list", list);
		System.out.println(list);
		return mv;
	}
	
	
	//쿠폰 리스트 출력
		@RequestMapping(value="/my/myCouponList.do")
		public ModelAndView myCouponList(CommandMap commandMap, HttpServletRequest request) throws Exception {
			
			ModelAndView mv = new ModelAndView("my/myCouponList");
			
			Object MEMBER_NO = ""; 
			//세션값 가져오기 
			HttpSession session = request.getSession(); 
			MEMBER_NO = (Object)session.getAttribute("SESSION_NO"); 
			commandMap.remove("MEMBER_NO"); 
			// 기존 회원번호 데이터 삭제 
			commandMap.put("MEMBER_NO", MEMBER_NO); 
			// 세션 값으로 적용
			 
			List<Map<String,Object>> list = myService.myCouponList(commandMap);
			//COUPON_STATUS_NO, COUPON_USE_STATE, COUPON_ISSUE_DATE, COUPON_USE_DATE, 
			//COUPON_NO, COUPON_ID, COUPON_VALUE, COUPON_S_VALIDITY, COUPON_E_VALIDITY
			
			mv.addObject("list", list);
			System.out.println(list);
			return mv;
		}
		
		//좋아요 리스트 출력
		@RequestMapping(value="/my/myLikeList.do")
		public ModelAndView myLikeList(CommandMap commandMap, HttpServletRequest request) throws Exception {
					
			ModelAndView mv = new ModelAndView("my/myLikeList");
					
			Object MEMBER_NO = ""; 
			//세션값 가져오기 
			HttpSession session = request.getSession(); 
			MEMBER_NO = (Object)session.getAttribute("SESSION_NO"); 
			commandMap.remove("MEMBER_NO"); 
			// 기존 회원번호 데이터 삭제 
			commandMap.put("MEMBER_NO", MEMBER_NO); 
			// 세션 값으로 적용
					 
			List<Map<String,Object>> list = myService.myLikeList(commandMap);
			//LIKE_NO, GOODS_NO, GOODS_NAME, GOODS_SELL_PRICE, GOODS_THUMBNAIL
					
			mv.addObject("list", list);
			System.out.println(list);
			return mv;
		}		
		
		//좋아요 삭제
		@RequestMapping(value="/my/goodsLikeDelete.do")
		public ModelAndView goodsLikeDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("redirect:/my/myLikeList.do");
			
			Object MEMBER_NO = ""; 
			//세션값 가져오기 
			HttpSession session = request.getSession(); 
			MEMBER_NO = (Object)session.getAttribute("SESSION_NO"); 
			commandMap.remove("MEMBER_NO"); 
			// 기존 회원번호 데이터 삭제 
			commandMap.put("MEMBER_NO", MEMBER_NO); 
			// 세션 값으로 적용
			myService.goodsLikeDelete(commandMap, request);
			return mv;
		}

	// 마이페이지 사이드바
	@RequestMapping(value="/my_side.do")
	public ModelAndView myView(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("mypage");
		
		List<Map<String,Object>> mydashList = myService.myDash(commandMap);
		System.out.println("mydashList : "+mydashList);
		mv.addObject("mydashList", mydashList);
			
		return mv;
	}
	
	//상품QNA리스트 페이지 열기
	@RequestMapping(value="/my/openMyGoodsQna.do")
    public ModelAndView openQnaList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/my/myGoodsQnaList");
    	
    	return mv;
    }
	
	//나의 상품QNA 출력
	@RequestMapping(value="/my/myGoodsQnaList.do")
	public ModelAndView myGoodsQnaList(CommandMap commandMap, HttpServletRequest request) throws Exception {			
		ModelAndView mv = new ModelAndView("jsonView");
				
		Object MEMBER_NO = ""; //세션값 가져오기 
		HttpSession session = request.getSession(); 
		MEMBER_NO = (Object)session.getAttribute("SESSION_NO"); 
		commandMap.remove("MEMBER_NO"); // 기존 회원번호 데이터 삭제 
		commandMap.put("MEMBER_NO", MEMBER_NO); // 세션 값으로 적용
		List<Map<String,Object>> list = myService.myGoodsQnaList(commandMap);	
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
	//나의 상품후기 리스트 페이지 열기
		@RequestMapping(value="/my/openMyReview.do")
	    public ModelAndView openReviewList(CommandMap commandMap) throws Exception{
	    	ModelAndView mv = new ModelAndView("/my/myReviewList");
	    	
	    	return mv;
	    }
		
		//나의 상품후기 출력
		@RequestMapping(value="/my/myReviewList.do")
		public ModelAndView myReviewList(CommandMap commandMap, HttpServletRequest request) throws Exception {
					
			ModelAndView mv = new ModelAndView("jsonView");
					
			Object MEMBER_NO = ""; 
				//세션값 가져오기 
			HttpSession session = request.getSession(); 
			MEMBER_NO = (Object)session.getAttribute("SESSION_NO"); 
			commandMap.remove("MEMBER_NO"); 
			// 기존 회원번호 데이터 삭제 
			commandMap.put("MEMBER_NO", MEMBER_NO); 
			// 세션 값으로 적용
					 
			List<Map<String,Object>> list = myService.myReviewList(commandMap);
			

			System.out.println(list);
					
			mv.addObject("list", list);
			if (list.size() > 0) {
				mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL", 0);
			}
			return mv;
		}
	


}
