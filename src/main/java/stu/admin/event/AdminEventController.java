package stu.admin.event;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;

@Controller
public class AdminEventController {
	
	Logger log = Logger.getLogger(this.getClass());

	// AdminEventService => Resource
	@Resource(name = "adminEventService")
	private AdminEventService adminEventService;
	
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
			mv.addObject("TOTAL", list.size());
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
	
	
	
	@RequestMapping(value = "/adminEventInU.do", method = RequestMethod.POST)
	public ModelAndView eventInsert(CommandMap commandMap, HttpServletRequest request)
	throws Exception {
		Object type = commandMap.get("TYPE");
		ModelAndView mv = new ModelAndView("redirect:/adminEventList.do");
		
		if ("insert".equals(type)) {
			adminEventService.eventInsert(commandMap.getMap(), request);
		} else if ("modify".equals(type)) {
			adminEventService.eventInsert(commandMap.getMap(), request);
		} else {}
		
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
		List<Map<String, Object>> list = adminEventService.common_eventList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		if(list.size() > 0) {
			mv.addObject("TOTAL", list.size());
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
