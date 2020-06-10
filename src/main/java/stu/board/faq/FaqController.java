package stu.board.faq;

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
public class FaqController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="faqService")
	private FaqService faqService;
	
	@RequestMapping(value="/board/openFaqList.do")
    public ModelAndView openFaqList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/board/faqList");
    	
    	return mv;
    }
	
	@RequestMapping(value="/board/selectFaqList.do")
    public ModelAndView selectFaqList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = faqService.selectFaqList(commandMap.getMap());
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/board/openFaqWrite.do")
	public ModelAndView openFaqWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/faqWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/board/insertFaq.do")
	public ModelAndView insertFaq(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/openFaqList.do");
		
		faqService.insertFaq(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/board/openFaqDetail.do")
	public ModelAndView openFaqDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/faqDetail");
		
		Map<String,Object> map = faqService.selectFaqDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/board/openFaqUpdate.do")
	public ModelAndView openFaqUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/faqUpdate");
		
		Map<String,Object> map = faqService.selectFaqDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/board/updateFaq.do")
	public ModelAndView updateFaq(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/openFaqDetail.do");
		
		faqService.updateFaq(commandMap.getMap(), request);
		
		mv.addObject("NOTICE_NO", commandMap.get("NOTICE_NO"));
		return mv;
	}
	
	@RequestMapping(value="/board/deleteFaq.do")
	public ModelAndView deleteFaq(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/openFaqList.do");
		
		faqService.deleteFaq(commandMap.getMap());
		
		return mv;
	}
}
