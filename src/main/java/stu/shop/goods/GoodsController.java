package stu.shop.goods;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class GoodsController {
	
	Logger log = Logger.getLogger(this.getClass()); //로그
	
	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	@RequestMapping(value="/shop/newGoodsList.do") // url 
	public ModelAndView goodsCateList(Map<String,Object> commandMap) throws Exception { // 최신상품 리스트 출력
		
		ModelAndView mv = new ModelAndView("shop/newGoodsList"); // 보낼 url
		
		List<Map<String,Object>> list = goodsService.newGoodsList(commandMap);
		
		mv.addObject("list", list);
		
		return mv;
		
	}
	
	@RequestMapping(value="/shop/bestGoodsList.do") // url 
	public ModelAndView bestGoodsList(Map<String,Object> commandMap) throws Exception { // 베스트 상품 리스트 출력
		
		ModelAndView mv = new ModelAndView("shop/bestGoodsList"); // 보낼 url
		
		List<Map<String,Object>> list = goodsService.bestGoodsList(commandMap);
		
		mv.addObject("list", list);
		
		return mv;
		
	}

}
