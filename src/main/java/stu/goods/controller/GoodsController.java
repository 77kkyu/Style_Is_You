package stu.goods.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;
import stu.goods.service.GoodsService;

@Controller
public class GoodsController {
	
	Logger log = Logger.getLogger(this.getClass()); //로그
	
	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	@RequestMapping(value="/goods/boardList.do")
	public ModelAndView goodsCateList(Map<String,Object> commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("boardList");
		
		List<Map<String,Object>> list = goodsService.goodCateList(commandMap);
		
		mv.addObject("list", list);
		
		return mv;
		
	}

}
