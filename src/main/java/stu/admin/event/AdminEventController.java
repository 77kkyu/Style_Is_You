package stu.admin.event;

import java.io.PrintWriter;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import stu.admin.coupon.AdminCouponService;
import stu.common.common.CommandMap;

@Controller
public class AdminEventController {
	
	Logger log = Logger.getLogger(this.getClass());

	// AdminEventService => Resource
	@Resource(name = "adminEventService")
	private AdminEventService adminEventService;
	
	// AdminCouponService => Resource
	@Resource(name = "adminCouponService")
	private AdminCouponService adminCouponService;
	
	// start    Event List View  => http://localhost:8080/stu/adminEventList.do
	@RequestMapping(value = "/adminEventList.do", method = RequestMethod.GET)
	public ModelAndView eventList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/event/eventList");
		return mv;
	}
	@RequestMapping(value = "/adminEventList.do", method = RequestMethod.POST)
	public ModelAndView searchEventList(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = adminEventService.eventList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		if(list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}
		else{
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	// end
	////////////////////////////////////////////
	
	
	
	// start Event new InsertForm
	@RequestMapping(value = "/adminEventWriteForm.do", method = RequestMethod.GET)
	public ModelAndView eventInsertForm() throws Exception {
		ModelAndView mv = new ModelAndView("/event/eventWrite");
		return mv;
	}
	@RequestMapping(value = "/adminEventWrite.do")
	@ResponseBody
	public ModelAndView eventWrite() throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = adminEventService.eventNextVal();
		mv.addObject("list", list);
		return mv;
	}
	// end
	////////////////////////////////////////////
	
	
	
	// startEvent old DetailForm
	@RequestMapping(value = "/adminEventDetailForm.do", method = RequestMethod.POST)
	public ModelAndView eventDetailForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/event/eventDetail");
		return mv;
	}
	
	//Event Detail View (이벤트 수정)
	@RequestMapping(value = "/adminEventDetail.do")
	@ResponseBody
	public ModelAndView eventDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		Object EVENT_NO = commandMap.get("EVENT_NO");
		
		if (EVENT_NO == null || EVENT_NO == "") {
			ModelAndView mv = new ModelAndView("redirect:/adminCouponList.do");
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("jsonView");
			
			List<Map<String, Object>> list = adminEventService.eventDetail(commandMap.getMap());
			mv.addObject("list", list);
			
			return mv;
		}
		
		
	}
	// end
	////////////////////////////////////////////
	
	
	//이벤트 등록 및 업데이트
	@RequestMapping(value = "/adminEventInU.do", method = RequestMethod.POST)
	public ModelAndView adminEventInU(CommandMap commandMap, HttpServletRequest request)
	throws Exception {
		
		//전달된 타입에 따라 (insert-신규, modify-수정) 으로 구분해서 전달
		Object type = commandMap.get("TYPE");
		
		//기본 mv, 변수 선언
		ModelAndView mv = new ModelAndView("/event/redirect");
		String msg = "", url = "", a_link_coupon_state = "";
		String gubun = (String) commandMap.get("EVENT_GUBUN"); // 0 비공개, 1 공개
		
		//S A태그의 쿠폰번호 가져오는 작업
		String content = (String) commandMap.get("EVENT_CONTENT"); // 저장된 본문을 불러옴
		int start_index = content.indexOf("<a href=\"/stu/couponSave.do?COUPON_NO="),   last_index = content.lastIndexOf("<a href=\"/stu/couponSave.do?COUPON_NO="), a_link_coupon_no = 0;
		if (start_index >= 0) {
			a_link_coupon_no = Integer.parseInt(content.substring(start_index, start_index+40).replaceAll("[^0-9]","")); //숫자만 추출
			commandMap.put("COUPON_NO", a_link_coupon_no);
			a_link_coupon_state = adminCouponService.coupon_state(commandMap.getMap());
		}
		System.out.println("state : "+a_link_coupon_state);
		//E A태그의 쿠폰번호 가져오는 작업
		
		//전달된 type 이 정해진 insert, modify가 아닌 경우 false 리턴
		if ( ("insert".equals(type) || "modify".equals(type)) && a_link_coupon_state != null) {  //신규, 수정 요청이면서 종료된 쿠폰 상태가 아닌 경우 작업 진행
			
			if ("end".equals(a_link_coupon_state)) {
				if ("0".equals(gubun)) { //비공개로 설정할 경우
					adminEventService.adminEventInU(commandMap.getMap(), request); //종료된 쿠폰을 a태그로 걸더라도 비공개로 저장하는 경우 서비스 전달.
					msg = "정상처리되었습니다";
					url = "/adminEventList.do";
				} else { //공개로 설정할 경우
					msg = "공개된 이벤트에 종료된 쿠폰url은 등록 불가합니다.";
					if ("insert".equals(type)) { url = "/adminEventWriteForm.do"; }
					else { url = "javascript:history.back(-2)"; }
				}
			}
			else if (a_link_coupon_state != "end") {
				if (start_index == last_index) { //등록된 쿠폰no a태그의  0~1개 일 경우 in/up처리 후 정상 msg 리턴
					adminEventService.adminEventInU(commandMap.getMap(), request); //정상인 경우만 서비스 전달.
					msg = "정상처리되었습니다";
					url = "/adminEventList.do";
				}
				else { //등록된 쿠폰no a태그가 2개 이상인 경우
					msg = "쿠폰 URL 링크는 1개만 설정 가능합니다.";
					if ("insert".equals(type)) { url = "/adminEventWriteForm.do"; }
					else { url = "javascript:history.back(-2)"; }
				}
			}

		} else { msg = "잘못된 접근입니다."; }
		
		//url이 설정되지 않은 경우 아래 주소로 저장
		if ("".equals(url)) { url = "/adminEventList.do"; }
		
		mv.addObject("message", msg);
		mv.addObject("urlPage", url);
		
		return mv;
	}
	/////////////////////////////////////
	
	
	@RequestMapping(value = "/event/list.do", method = RequestMethod.GET)
	public ModelAndView eventListView()
	throws Exception {
		ModelAndView mv = new ModelAndView("event/main_eventlist");
		return mv;
	}
	@RequestMapping(value = "/event/list.do", method = RequestMethod.POST)
	public ModelAndView eventListView_POST(CommandMap commandMap, HttpServletRequest request)
	throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		//쇼핑몰 메인에 이벤트 리스트가 불러지기 전 종료된 쿠폰의 이벤트를 비공개로 업데이트 할 필요성이 있음..
		
		List<Map<String, Object>> list = adminEventService.common_eventList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		if(list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}
		else{
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	////////////////////////////////////////////
	
	
	
	@RequestMapping(value = "/event/detailViewForm.do", method = RequestMethod.POST)
	public ModelAndView detailViewForm(CommandMap commandMap, HttpServletRequest request)
	throws Exception {
		ModelAndView mv = new ModelAndView("/event/main_eventDetail");
		return mv;
	}
	
	@RequestMapping(value = "/event/detail.do")
	public ModelAndView detailView(CommandMap commandMap, HttpServletRequest request)
	throws Exception {
		
		Object EVENT_NO = commandMap.get("EVENT_NO");
		
		if (EVENT_NO == null || EVENT_NO == "") {
			ModelAndView mv = new ModelAndView("redirect:/event/list.do");
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("jsonView");
			
			List<Map<String, Object>> list = adminEventService.common_eventDetail(commandMap.getMap());
			mv.addObject("list", list);
			
			return mv;
		}
		
	}
	////////////////////////////////////////////

	
}
