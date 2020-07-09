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

	// 회원정보 수정 폼
	@RequestMapping(value = "/my/memberModify.do",method=RequestMethod.GET)
	public ModelAndView memberModify(Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Object MEMBER_NO = "";
		
		//세션값 가져오기
		HttpSession session = request.getSession();
		MEMBER_NO = (Object)session.getAttribute("SESSION_NO");

		commandMap.remove("MEMBER_NO"); // 기존 회원번호 데이터 삭제
		commandMap.put("MEMBER_NO", MEMBER_NO); // 세션 값으로 적용
	
		// 서비스와 DAO로 보내서 리턴받은 값 저장
		Map<String,Object> chk = myService.memberModify(commandMap);
		System.out.println(chk);

		
		mv = new ModelAndView("my/memberModify");
		mv.addObject("MEMBER", chk); // 뷰에서 쓸수 있게 저장	
		
		return mv;
	}
	
	// 회원 정보 수정 처리
	@RequestMapping(value="/my/memberModifyAction.do",method=RequestMethod.POST)
	public ModelAndView memberModifyAction(Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("my/myOrderList");
		
			Object MEMBER_NO = "";
			
			//세션값 가져오기
			HttpSession session = request.getSession();
			MEMBER_NO = (Object)session.getAttribute("SESSION_NO");
	
			commandMap.remove("MEMBER_NO"); // 기존 회원번호 데이터 삭제
			commandMap.put("MEMBER_NO", MEMBER_NO); // 세션 값으로 적용
			
				// 이메일
				// 직접입력이 아닌 선택입력일 경우
				String email = request.getParameter("MEMBER_EMAIL") 
						     + "@" 
						     + request.getParameter("MEMBER_EMAIL2");
				// 직접입력일 경우
				if(request.getParameter("MEMBER_EMAIL2") == "") {
					email = request.getParameter("MEMBER_EMAIL");
				}				
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
		
				String pass = request.getParameter("MEMBER_PASSWD");
				String phone = request.getParameter("MEMBER_PHONE");
				String zip = request.getParameter("MEMBER_ZIPCODE");
				String addr1 = request.getParameter("MEMBER_ADDR1");
				String addr2 = request.getParameter("MEMBER_ADDR2");
				
				commandMap.remove("MEMBER_PASSWD");
				commandMap.remove("MEMBER_PHONE");
				commandMap.remove("MEMBER_ZIPCODE");
				commandMap.remove("MEMBER_ADDR1");
				commandMap.remove("MEMBER_ADDR2");
				
				commandMap.put("MEMBER_PASSWD", pass);
				commandMap.put("MEMBER_PHONE", phone);
				commandMap.put("MEMBER_ZIPCODE", zip);
				commandMap.put("MEMBER_ADDR1", addr1);
				commandMap.put("MEMBER_ADDR2", addr2);
				
				
				 myService.memberModifyAction(commandMap);

		return mv;
	}
	
	// 회원 탈퇴 폼
	@RequestMapping(value="/my/memberDelete.do")
	public ModelAndView memberDelete(Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("my/memberDelete");
		
		Object MEMBER_NO = "";
		
		HttpSession session = request.getSession();
		MEMBER_NO = (Object)session.getAttribute("SESSION_NO");
		
		commandMap.remove("MEMBER_NO");
		commandMap.put("MEMBER_NO", MEMBER_NO);
		
		myService.memberDelete(commandMap);
		
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
				
		Object MEMBER_NO = ""; 
			//세션값 가져오기 
		HttpSession session = request.getSession(); 
		MEMBER_NO = (Object)session.getAttribute("SESSION_NO"); 
		commandMap.remove("MEMBER_NO"); 
		// 기존 회원번호 데이터 삭제 
		commandMap.put("MEMBER_NO", MEMBER_NO); 
		// 세션 값으로 적용
				 
		List<Map<String,Object>> list = myService.myGoodsQnaList(commandMap);
		//
		//
				
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		System.out.println(list);
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
