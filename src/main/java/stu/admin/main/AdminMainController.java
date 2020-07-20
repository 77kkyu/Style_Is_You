package stu.admin.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import stu.common.common.CommandMap;

@Controller
public class AdminMainController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminMainService")
	private AdminMainService adminMainService;
	
	/* mvc:annotation-driven을 선언하면 HandlerMethodArgumentResolver가 Map형식일때 동작을 못함 해서
	 * 기본 Map형식이 아닌 map을 가지는 클래스를 만들어 사용 commandMap */
	// adminMain
	@RequestMapping(value="/adminMain.do", method = RequestMethod.GET)
	public ModelAndView adminView(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin/adminMain");
		
		List<Map<String,Object>> dashList = adminMainService.dashBoard(commandMap);
		mv.addObject("dashList", dashList);
			
		return mv;
	}
	
	// 주문.배송에 STATE별 리스트
	@RequestMapping(value="/order_admin_a.do")
	public ModelAndView order_admin_a(CommandMap commandMap,HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin/order_admin_a");
		
		String order_state = "0";
		System.out.println("뷰에서 받는값:"+request.getParameter("os"));
		if(request.getParameter("os") != null && request.getParameter("os") != ""){

			order_state = request.getParameter("os");
        }
		commandMap.put("order_state", order_state);
		
		List<Map<String,Object>> order_a = adminMainService.order_admin_a(commandMap);
		System.out.println("order_state:"+order_state);
		
		if (order_a.isEmpty()) {
			mv.addObject("order_a", order_a);
			mv.addObject("order_state", order_state);
		}else {
			mv.addObject("order_a", order_a);
		}

		System.out.println("mv:"+mv);	
		return mv;
	}
	
	
	  // state변경 
	@RequestMapping(value="/order_admin_a.do", method = RequestMethod.POST)
	public ModelAndView order_state(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("admin/order_admin_a");

		String order_state = "0";
		String order_no = "";
		String order_express = "";
		// System.out.println("뷰에서 받는값:"+request.getParameter("os"));

		if (request.getParameter("order_state") != null && request.getParameter("order_state") != "") {
			order_state = request.getParameter("order_state");
		}
		if (request.getParameter("order_no") != null && request.getParameter("order_no") != "") {
			order_no = request.getParameter("order_no");
		}
		// System.out.println("order_state:"+request.getParameter("order_state"));
		// System.out.println("express:"+request.getParameter("express"));
		if (request.getParameter("order_state").equals("2") && request.getParameter("express") != null) {
			order_express = request.getParameter("express");
			commandMap.put("order_express", order_express);
			commandMap.put("order_no", order_no);
			commandMap.put("order_state", order_state);

			adminMainService.order_state_ex(commandMap); // 송장번호 넣기

		} else {
			commandMap.put("order_no", order_no);
			commandMap.put("order_state", order_state);

			adminMainService.order_state(commandMap);
		}

		List<Map<String, Object>> order_a = adminMainService.order_admin_a(commandMap);

		mv.addObject("order_a", order_a);

		return mv;
	}
	 
	// 주문/변경 상세보기 
	@RequestMapping(value = "/order_detail.do")
	public ModelAndView order_detail(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("admin/order_detail");

		String order_no = request.getParameter("order_no");

		List<Map<String, Object>> order_detail = adminMainService.order_detail(commandMap);
		System.out.println("order_detail:" + order_detail);

		List<Map<String, Object>> order_detail_sub = adminMainService.order_detail_sub(commandMap);
		System.out.println("order_detail_sub:" + order_detail_sub);

		mv.addObject("order_detail", order_detail);
		mv.addObject("order_detail_sub", order_detail_sub);

		return mv;
	}
	
	//어드민 AS요청 LIST
	@RequestMapping(value="/as_admin.do")
	public ModelAndView as_admin_list(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin/as_admin");
		
		String as_state = "1";
		System.out.println("뷰에서 받는값:"+request.getParameter("as"));

		if(request.getParameter("as") != null && request.getParameter("as") != ""){
		as_state = request.getParameter("as");
        }

		commandMap.put("as_state", as_state);
		
		List<Map<String,Object>> as_admin_list = adminMainService.as_admin_list(commandMap);
		System.out.println("as_state:"+as_state);
		
		if (as_admin_list.isEmpty()) {
			mv.addObject("as_admin_list", as_admin_list);
			mv.addObject("as_state", as_state);
		}else {
			mv.addObject("as_admin_list", as_admin_list);
			mv.addObject("as_state", as_state);
		}
		System.out.println("mv:"+mv);
		return mv;
	}
	
	// AS페이지 - 주문취소
	@RequestMapping(value="/as_cancle.do")
	public ModelAndView as_cancle(CommandMap commandMap,HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin/as_admin");

		//${aal.AS_NO }, ${aal.AS_STATE }, ${aal.ORDER_NO }
		String as_no = request.getParameter("as_no");
		String as_state = request.getParameter("as_state"); // as_list상태
		String order_no = request.getParameter("order_no"); // order_no
		String order_state = request.getParameter("order_state"); // order_list에서 받은 order_state
  
		if (as_no == null || as_state == null || order_no == null || order_state == null) {
			commandMap.put("as_state", '1');
			List<Map<String,Object>> as_admin_list = adminMainService.as_admin_list(commandMap);
			return mv;
		}
		
		// AS요청 캔슬 로직 처리 - 요청확인 전
		if (as_state.equals("1")) {
			commandMap.put("as_no", as_no);
			adminMainService.as_cancle_a(commandMap);
		}
		// AS요청 캔슬 로직 처리 - 요청확인 후
		if (as_state.equals("2")) {
			commandMap.put("as_no", as_no);
			commandMap.put("order_no", order_no);
			commandMap.put("order_state", order_state);
			adminMainService.as_cancle_b(commandMap);
		}
		
		
		//mv.setViewName("admin/as_admin.jsp?as=3");
		//처리후 다시 리스트 불러오기
		commandMap.put("as_state", as_state);
		List<Map<String,Object>> as_admin_list = adminMainService.as_admin_list(commandMap);
		mv.addObject("as_admin_list", as_admin_list);
		mv.addObject("as_state", as_state);
	
		return mv;
	}

	// AS페이지 - AS확인&요청처리
	@RequestMapping(value="/as_ok.do")
	public ModelAndView as_ok(CommandMap commandMap,HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin/as_admin");

		String as_no = request.getParameter("as_no");
		String as_state = request.getParameter("as_state"); // as_list 넘어온 ok값이 1(요청확인), 2(요청처리)
		String order_no = request.getParameter("order_no"); // order_no
		String order_state = request.getParameter("order_state"); // order_list에서 받은 order_state
		String gubun = request.getParameter("gubun"); // order_list에서 받은 order_state
		String gubun_num = "";
		System.out.println("gubun:"+gubun);
		
		if (as_no == null || as_state == null || order_no == null || order_state == null) {
			commandMap.put("as_state", '1');
			List<Map<String,Object>> as_admin_list = adminMainService.as_admin_list(commandMap);
			return mv;
		}
		
		if(gubun.equals("1")) { gubun_num = "97";
		}else if(gubun.equals("2")) { gubun_num = "99";
		}else if(gubun.equals("3")) { gubun_num = "96";}
		System.out.println("gubun_num:"+gubun_num);
		
		// state(1) 신규요청 처리
		if(as_state.equals("1")) {
			commandMap.put("as_no", as_no);
			commandMap.put("order_no", order_no);
			commandMap.put("state_num", "2");
			commandMap.put("gubun_num", gubun_num);
			adminMainService.as_ok_a(commandMap);
		}
		// state(2) 제품회수 후 각 구분(1:교환,2:환불,3:AS)에 맞게 처리 하고 AS_LIST state=3. as_edate=update
		if(as_state.equals("2")) {
			if(gubun.equals("1")) { //교환
				mv.addObject("as_no", as_no);
				mv.setView(new RedirectView("/stu/asChangeForm.do"));
				return mv;
			} else if(gubun.equals("2")) { //환불
				mv.addObject("as_no", as_no);
				mv.setView(new RedirectView("/stu/cashback_ok.do"));
				return mv;
				
			} else if(gubun.equals("3")) { //AS
				mv.addObject("as_no", as_no);
				mv.setView(new RedirectView("/stu/coolAs_ok.do"));
				return mv;
			}

		}
		
		//mv.setViewName("/admin/a");
		//처리후 다시 리스트 불러오기
		commandMap.put("as_state", as_state);
		List<Map<String,Object>> as_admin_list = adminMainService.as_admin_list(commandMap);
		mv.addObject("as_admin_list", as_admin_list);
		mv.addObject("as_state", as_state);
	
		return mv;
	}
	
	// AS페이지 - 교환처리 폼
	@RequestMapping(value="/asChangeForm.do")
	public ModelAndView asChangeForm(CommandMap commandMap,HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin/asChangeForm");

		String as_no = request.getParameter("as_no");
		System.out.println("as_no"+as_no);
		//상품회수후 AS_list에서 정보 가져옴  전부* 
		//주문디테일번호로 교환 요청한 상품에대한정보  goods_no, 속성번호,가격,색상,사이즈,수량
		//order_detail에서 detail_state 20(반품)
		//goods_no로 goods_attribute 정보 가져옴
		//asChangForm.jsp에 뿌림
		commandMap.put("as_no", as_no);
		List<Map<String,Object>> as_change_form_a = adminMainService.change_form_a(commandMap);
		System.out.println("as_change_form_a :"+as_change_form_a);
		
		String order_detail_no = as_change_form_a.get(0).get("ORDER_DETAIL_NO").toString();
		commandMap.put("order_detail_no", order_detail_no);
		adminMainService.change_detail_state(commandMap);
		
		String goods_no = as_change_form_a.get(0).get("GOODS_NO").toString();
		//System.out.println("goods_no : "+goods_no);
		commandMap.put("goods_no", goods_no);
		List<Map<String,Object>> as_change_form_b = adminMainService.change_form_b(commandMap);
		
		mv.addObject("as_change_form_a", as_change_form_a);
		mv.addObject("as_change_form_b", as_change_form_b);
	
		return mv;
	}
	
	// AS페이지 - 교환처리
	@RequestMapping(value="/asChange_ok.do")
	public ModelAndView asChange_ok(CommandMap commandMap,HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin/as_admin");
		//교환폼에서 선택한 goods_att_no, insert자료 가져옴
		//order_detail에 insert 시킴 10(출고)
		//goods_attribute에서 (반품)상품속성번호에 수량 증가
		//goods_attribute에서 (출고)상품속성번호에 수량 감소
		//order_list = 2, AS_LIST에서 state = 3, edate=update
		String as_no = request.getParameter("as_no");
		String order_no = request.getParameter("order_no");
		String goods_no = request.getParameter("goods_no");
		String new_goods_att_no = request.getParameter("new_goods_att_no"); //새로선택
		String old_goods_att_no = request.getParameter("old_goods_att_no"); // 회수제품
		String order_detail_price = request.getParameter("order_detail_price");
		String order_detail_color = request.getParameter("order_detail_color");
		String order_detail_size = request.getParameter("order_detail_size");
		String order_detail_amount = request.getParameter("order_detail_amount");
		String order_discount_apply = request.getParameter("order_discount_apply");
		String order_detail_save_point = request.getParameter("order_detail_save_point");
		System.out.println("new_goods_att_no"+new_goods_att_no);
		System.out.println("old_goods_att_no"+old_goods_att_no);
	
		commandMap.put("as_no", as_no);
		commandMap.put("order_no", order_no);
		commandMap.put("goods_no", goods_no);
		commandMap.put("new_goods_att_no", new_goods_att_no);
		commandMap.put("old_goods_att_no", old_goods_att_no);
		commandMap.put("order_detail_price", order_detail_price);
		commandMap.put("order_detail_color", order_detail_color);
		commandMap.put("order_detail_size", order_detail_size);
		commandMap.put("order_detail_amount", order_detail_amount);
		commandMap.put("order_discount_apply", order_discount_apply);
		commandMap.put("order_detail_save_point", order_detail_save_point);
		
		
		adminMainService.change_detail_insert(commandMap);
		adminMainService.change_goods_att_plus(commandMap);
		adminMainService.change_goods_att_minus(commandMap);
		adminMainService.as_ok_b(commandMap);

		String as_state = "1";
		commandMap.put("as_state", as_state);
		List<Map<String,Object>> as_admin_list = adminMainService.as_admin_list(commandMap);
		mv.addObject("as_admin_list", as_admin_list);
		mv.addObject("as_state", as_state);
	
		return mv;
	}
	
	// AS페이지 - 환불처리 
	@RequestMapping(value="/cashback_ok.do")
	public ModelAndView cashback_ok(CommandMap commandMap,HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin/as_admin");

		String as_no = request.getParameter("as_no");
		System.out.println("as_no"+as_no);
		//상품회수후 AS_list에서 정보 가져옴  member_no,order_detail_no
		//order_detail에서 detail_state 20(반품)
		//order_detail정보 가져옴 상품속성번호, 할인적용가, 적립포인트, 수량
		//order_list에서 총결제금액차감 , 총적립포인트차감
		//point에서 적립포인트 차감
		//goods_attribute에서 상품속성번호 만큼 수량 증가
		//order_detail에서 state로 카운터 해서 10짜리가 없으면(마지막에 state 돌릴때)
		//환불 그대로,  10짜리가 있으면 state=거래완료
		//AS_LIST에서 state = 3, edate=update
		commandMap.put("as_no", as_no);
		List<Map<String,Object>> as_change_form_a = adminMainService.change_form_a(commandMap);
		System.out.println("as_change_form_a :"+as_change_form_a);
		
		String order_detail_no = as_change_form_a.get(0).get("ORDER_DETAIL_NO").toString();
		commandMap.put("order_detail_no", order_detail_no);
		adminMainService.change_detail_state(commandMap);//order_detail에서 detail_state 20(반품)
		
		String member_no = as_change_form_a.get(0).get("MEMBER_NO").toString();
		String order_no = as_change_form_a.get(0).get("ORDER_NO").toString();
		String order_state = as_change_form_a.get(0).get("ORDER_STATE").toString();
		String goods_att_no = as_change_form_a.get(0).get("GOODS_ATT_NO").toString();
		String order_discount_apply = as_change_form_a.get(0).get("ORDER_DISCOUNT_APPLY").toString();
		int order_detail_save_point = Integer.parseInt(as_change_form_a.get(0).get("ORDER_DETAIL_SAVE_POINT").toString());
		String order_detail_amount = as_change_form_a.get(0).get("ORDER_DETAIL_AMOUNT").toString();
		
		commandMap.put("member_no", member_no);
		commandMap.put("order_no", order_no);
		commandMap.put("old_goods_att_no", goods_att_no);
		commandMap.put("order_discount_apply", order_discount_apply);
		commandMap.put("order_detail_save_point", order_detail_save_point);
		commandMap.put("order_detail_amount", order_detail_amount);
		
		adminMainService.order_list_chagam(commandMap); //order_list에서 총결제금액차감 , 총적립포인트차감
		// member에 총결제금액도 차감해야함
		
		List<Map<String,Object>> point_total = adminMainService.point_total(commandMap); // order_no로 사용자의 최근 point_total을 가져옴
		int total = Integer.parseInt(point_total.get(0).get("POINT_TOTAL").toString());
		total = total - order_detail_save_point;
		commandMap.put("total", total);
		adminMainService.point_chagam(commandMap); //point에서 적립포인트 차감
		
		adminMainService.change_goods_att_plus(commandMap);//goods_attribute에서 상품속성번호 만큼 수량 증가
		commandMap.put("order_state", order_state);
		adminMainService.as_ok_c(commandMap);
		//mv.addObject("as_change_form_a", as_change_form_a);
		
		String as_state = "1";
		commandMap.put("as_state", as_state);
		List<Map<String,Object>> as_admin_list = adminMainService.as_admin_list(commandMap);
		mv.addObject("as_admin_list", as_admin_list);
		mv.addObject("as_state", as_state);
	
		return mv;
	}
	
	// AS페이지 - AS처리 
	@RequestMapping(value="/coolAs_ok.do")
	public ModelAndView coolAs_ok(CommandMap commandMap,HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin/as_admin");

		String as_no = request.getParameter("as_no");
		System.out.println("as_no"+as_no);
		//상품회수후 AS_list에서 정보 가져옴  member_no,order_detail_no
		//order_detail정보 가져옴 상품속성번호, 수량
		//goods_attribute에서 상품속성번호에 수량 감소
		//order_list state=2(배송준비)
		//AS_LIST에서 state = 3, edate=update
		commandMap.put("as_no", as_no);
		List<Map<String,Object>> as_change_form_a = adminMainService.change_form_a(commandMap);
		System.out.println("as_change_form_a :"+as_change_form_a);
		
		String order_detail_no = as_change_form_a.get(0).get("ORDER_DETAIL_NO").toString();
		commandMap.put("order_detail_no", order_detail_no);
		String member_no = as_change_form_a.get(0).get("MEMBER_NO").toString();
		String order_no = as_change_form_a.get(0).get("ORDER_NO").toString();
		String order_state = as_change_form_a.get(0).get("ORDER_STATE").toString();
		String goods_att_no = as_change_form_a.get(0).get("GOODS_ATT_NO").toString();
		String order_discount_apply = as_change_form_a.get(0).get("ORDER_DISCOUNT_APPLY").toString();
		int order_detail_save_point = Integer.parseInt(as_change_form_a.get(0).get("ORDER_DETAIL_SAVE_POINT").toString());
		String order_detail_amount = as_change_form_a.get(0).get("ORDER_DETAIL_AMOUNT").toString();
		
		commandMap.put("member_no", member_no);
		commandMap.put("order_no", order_no);
		commandMap.put("new_goods_att_no", goods_att_no);
		commandMap.put("order_discount_apply", order_discount_apply);
		commandMap.put("order_detail_save_point", order_detail_save_point);
		commandMap.put("order_detail_amount", order_detail_amount);
		
		adminMainService.change_goods_att_minus(commandMap);//goods_attribute에서 상품속성번호 만큼 수량 차감
		commandMap.put("order_state", order_state);
		adminMainService.as_ok_b(commandMap);
		//mv.addObject("as_change_form_a", as_change_form_a);
		
		String as_state = "1";
		commandMap.put("as_state", as_state);
		List<Map<String,Object>> as_admin_list = adminMainService.as_admin_list(commandMap);
		mv.addObject("as_admin_list", as_admin_list);
		mv.addObject("as_state", as_state);
	
		return mv;
	}
	 
	//회원 목록
	@RequestMapping(value="/member_admin.do")
	public ModelAndView member_admin(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("admin/member_admin");
		
		List<Map<String, Object>> member_admin_list = adminMainService.selectMemberList(commandMap.getMap());
		
		mv.addObject("member_admin_list", member_admin_list);
		
		System.out.println("멤버리스트"+member_admin_list);
		
		return mv;
	}
	
	//회원 목록 페이징
	@RequestMapping(value="/member_admin_list.do")
	public ModelAndView member_admin_list(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> member_admin_list = adminMainService.selectMemberList(commandMap.getMap());
		
		mv.addObject("member_admin_list", member_admin_list);
		
		if(member_admin_list.size()>0) {
			mv.addObject("TOTAL", member_admin_list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	  
}








