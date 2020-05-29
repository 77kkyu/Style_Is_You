package stu.shop.basket;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;


@Controller
public class BasketController {
	
Logger log = Logger.getLogger(this.getClass()); //로그
	
	@Resource(name="basketService")
	private BasketService basketService;
	
	@RequestMapping(value="/basket/basketList.do")
	public ModelAndView basketList(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("basket/basketList");
		
		List<Map<String,Object>> list = basketService.basketList(commandMap);
		//GOODS_NO, BASKET_NO, MEMBER_NO, BASKET_GOODS_AMOUNT, GOODS_ATT_NO, GOODS_ATT_SIZE,
		//GOODS_ATT_COLOR, GOODS_NAME, GOODS_SELL_PRICE, UPLOAD_SAVE_NAME, MEMBER_GRADE
		
		mv.addObject("list", list);
		System.out.println(list);
		return mv;
		
	}
	
	@RequestMapping(value="/basket/basketModify.do")
	public void basketModify(CommandMap commandMap) throws Exception {
		basketService.basketModify(commandMap);
		
	}

}
