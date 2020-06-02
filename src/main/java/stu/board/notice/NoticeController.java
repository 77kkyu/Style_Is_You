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
	
	@RequestMapping(value="/board/openNoticeList.do")
    public ModelAndView openNoticeList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/board/notice/noticeList");
    	
    	return mv;
    }
	
	@RequestMapping(value="/board/selectNoticeList.do")
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
	
	@RequestMapping(value="/board/openNoticeWrite.do")
	public ModelAndView openNoticeWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/notice/noticeWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/board/insertNotice.do")
	public ModelAndView insertNotice(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/openNoticeList.do");
		
		noticeService.insertNotice(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/board/openNoticeDetail.do")
	public ModelAndView openNoticeDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/notice/noticeDetail");
		
		Map<String,Object> map = noticeService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/board/openNoticeUpdate.do")
	public ModelAndView openNoticeUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/notice/noticeUpdate");
		
		Map<String,Object> map = noticeService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/board/updateNotice.do")
	public ModelAndView updateNotice(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/openNoticeDetail.do");
		
		noticeService.updateNotice(commandMap.getMap(), request);
		
		mv.addObject("NOTICE_NO", commandMap.get("NOTICE_NO"));
		return mv;
	}
	
	@RequestMapping(value="/board/deleteNotice.do")
	public ModelAndView deleteNotice(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/openNoticeList.do");
		
		noticeService.deleteNotice(commandMap.getMap());
		
		return mv;
	}
}
