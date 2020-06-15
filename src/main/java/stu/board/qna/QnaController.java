package stu.board.qna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;

@Controller
public class QnaController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaService")
	private QnaService qnaService;
	
	@RequestMapping(value="/qna/openQnaList.do")
    public ModelAndView openQnaList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/board/qnaList");
    	
    	return mv;
    }
	
	@RequestMapping(value="/qna/selectQnaList.do")
    public ModelAndView selectQnaList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = qnaService.selectQnaList(commandMap.getMap());
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/qna/openQnaWrite.do")
	public ModelAndView openQnaWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/qnaWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/qna/insertQna.do", method = RequestMethod.POST )
	public ModelAndView insertQna(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/qna/openQnaList.do");
		
		System.out.print(commandMap);
		System.out.print(request);
		
		qnaService.insertQna(commandMap.getMap(), request);
		
		
		
		return mv;
	}
	
	@RequestMapping(value="/qna/openQnaDetail.do")
	public ModelAndView openQnaDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/qnaDetail");
		
		Map<String,Object> map = qnaService.selectQnaDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/qna/openQnaUpdate.do")
	public ModelAndView openQnaUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/qnaUpdate");
		
		Map<String,Object> map = qnaService.selectQnaDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/qna/updateQna.do")
	public ModelAndView updateQna(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/qna/openQnaDetail.do");
		
		qnaService.updateQna(commandMap.getMap(), request);
		
		mv.addObject("QNA_NO", commandMap.get("QNA_NO"));
		return mv;
	}
	
	@RequestMapping(value="/qna/deleteQna.do")
	public ModelAndView deleteQna(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/qna/openQnaList.do");
		
		qnaService.deleteQna(commandMap.getMap());
		
		return mv;
	}

}
