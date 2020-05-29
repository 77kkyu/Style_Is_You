package stu.common.main;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import stu.shop.goods.GoodsService;

@Controller
public class MainController {

	Logger log = Logger.getLogger(this.getClass()); //로그
	
	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	@RequestMapping(value="main.do" ,method = RequestMethod.GET) // url 
	public ModelAndView mainView(Map<String,Object> commandMap) throws Exception { // 메인 상품 리스트
		
		ModelAndView mv = new ModelAndView("main"); // 보낼 url
		
		List<Map<String,Object>> newList = goodsService.newGoodsList(commandMap);
		mv.addObject("newList", newList);
		
		List<Map<String,Object>> bestList = goodsService.bestGoodsList(commandMap);
		mv.addObject("bestList", bestList);
		
		return mv;
	}
}
