package stu.board.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;

@Controller
public class NoticeController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@RequestMapping(value="/notice/openNoticeList.do")
    public ModelAndView openNoticeList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/board/noticeList");
    	
    	return mv;
    }
	
	@RequestMapping(value="/notice/selectNoticeList.do")
    public ModelAndView selectNoticeList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = noticeService.selectNoticeList(commandMap.getMap());
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/notice/openNoticeWrite.do")
	public ModelAndView openNoticeWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/noticeWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/notice/insertNotice.do")
	public ModelAndView insertNotice(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/notice/openNoticeList.do");
		
		noticeService.insertNotice(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/notice/openNoticeDetail.do")
	public ModelAndView openNoticeDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/noticeDetail");
		
		Map<String,Object> map = noticeService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/notice/openNoticeUpdate.do")
	public ModelAndView openNoticeUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/noticeUpdate");
		
		Map<String,Object> map = noticeService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/notice/updateNotice.do")
	public ModelAndView updateNotice(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/notice/openNoticeDetail.do");
		
		noticeService.updateNotice(commandMap.getMap(), request);
		
		mv.addObject("NOTICE_NO", commandMap.get("NOTICE_NO"));
		return mv;
	}
	
	@RequestMapping(value="/notice/deleteNotice.do")
	public ModelAndView deleteNotice(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/notice/openNoticeList.do");
		
		noticeService.deleteNotice(commandMap.getMap());
		
		return mv;
	}
}
