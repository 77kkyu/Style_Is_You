package stu.admin.coupon;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;

@Controller
public class AdminCouponController {
	
	Logger log = Logger.getLogger(this.getClass());

	// AdminCouponService => Resource
	@Resource(name = "adminCouponService")
	private AdminCouponService adminCouponService;
	
	// Coupon List View (최초 조회) => http://localhost:8080/stu/adminCouponList.do
	@RequestMapping(value="/adminCouponList.do", method = RequestMethod.GET)
    public ModelAndView couponList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/coupon/couponList");
    	
    	return mv;
    }
	@RequestMapping(value = "/adminCouponList.do", method = RequestMethod.POST)
	public ModelAndView searchCouponList(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = adminCouponService.couponList(commandMap.getMap());
		
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
	
	
	// start Coupon new InsertForm
	@RequestMapping(value = "/adminCouponWriteForm.do", method = RequestMethod.GET)
	public ModelAndView couponInsertForm() throws Exception {
		ModelAndView mv = new ModelAndView("/coupon/couponWrite");
		return mv;
	}
	@RequestMapping(value = "/adminCouponWrite.do")
	@ResponseBody
	public ModelAndView couponWrite() throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		String NEXT_COUPON_NO = adminCouponService.couponNextVal();
		mv.addObject("NEXT_COUPON_NO", NEXT_COUPON_NO);
		return mv;
	}
	// end
	////////////////////////////////////////////
	
	
	
	
	//List -> title click
	@RequestMapping(value="/adminCouponDetailForm.do", method = RequestMethod.POST)
    public ModelAndView couponDetailFormP(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/coupon/couponDetail");
    	return mv;
    }
	
	// Coupon List View => Title onclick  Detail View => http://localhost:8080/stu/adminCouponDetail.do
	@RequestMapping(value = "/adminCouponDetail.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView detailCouponInfo(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		Object COUPON_NO = commandMap.getMap().get("COUPON_NO");
		
		if (COUPON_NO == null || COUPON_NO == "") {
			ModelAndView mv = new ModelAndView("redirect:/adminCouponList.do");
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("jsonView");
			
			List<Map<String, Object>> list = adminCouponService.couponDetail(commandMap.getMap());
			mv.addObject("list", list);
			
			return mv;
		}
	}
	
	@RequestMapping(value = "/adminCouponInU.do", method = RequestMethod.POST)
	public ModelAndView CouponInU(CommandMap commandMap) throws Exception {
		
		Object type = commandMap.get("TYPE");
		ModelAndView mv = new ModelAndView("redirect:/adminCouponList.do");
		
		if ("insert".equals(type)) {
			adminCouponService.couponInsert(commandMap.getMap());
		} else if ("modify".equals(type)) {
			adminCouponService.couponUpdate(commandMap.getMap());
		} else {}
		
		return mv;
	}
	
	
	
	@RequestMapping(value = "/couponSave.do", method = RequestMethod.GET)
	public ModelAndView couponSave
	(CommandMap commandMap, HttpServletRequest request, @RequestParam("COUPON_NO") String COUPON_NO, HttpServletResponse response)
	throws Exception {
		HttpSession session = request.getSession(); 
		Object session_no = (Object)session.getAttribute("SESSION_NO");
		ModelAndView mv = new ModelAndView("/event/redirect");
		
		if (session_no == null || session_no == "") {
			mv.addObject("message", "로그인 후 이용 바랍니다.");
			mv.addObject("urlPage", "/loginForm.do");
			return mv;
		} else {
			commandMap.put("session_no", session_no);
			boolean result = adminCouponService.couponSave(commandMap.getMap());
			
			if (result == true) {
				mv.addObject("message", "쿠폰발급 완료");
				mv.addObject("urlPage", "/event/list.do");
				return mv;
			} else {
				mv.addObject("message", "이미 발급된 쿠폰입니다.");
				mv.addObject("urlPage", "/event/list.do");
				return mv;
			}
		}
	}
	//http://localhost:8080/stu/couponSave.do?COUPON_NO=2
}
