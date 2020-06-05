package stu.shop.basket;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//GOODS_ATT_COLOR, GOODS_NAME, GOODS_SELL_PRICE, GOODS_SALE_PRICE, UPLOAD_SAVE_NAME, MEMBER_GRADE
		
		mv.addObject("list", list);
		System.out.println(list);
		return mv;
		
	}
	
	@RequestMapping(value="/basket/basketModify.do")
	public ModelAndView basketModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/basket/basketList.do");
		/*
		 * commandMap.put("BASKET_GOODS_AMOUNT",
		 * request.getParameter("BASKET_GOODS_AMOUNT")); commandMap.put("BASKET_NO",
		 * request.getParameter("BASKET_NO"));
		 */
		basketService.basketModify(commandMap, request);
		return mv;
	}
	
	@RequestMapping(value="/basket/basketDelete.do")
	public ModelAndView basketDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/basket/basketList.do");
		System.out.println(commandMap.get("BASKET_NO"));
		basketService.basketDelete(commandMap, request);
		return mv;
	}
	
	@RequestMapping(value="/basket/basketAllDelete.do")
	public ModelAndView basketAllDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/basket/basketList.do");
		System.out.println(commandMap.get("MEMBER_NO"));
		basketService.basketAllDelete(commandMap, request);
		return mv;
	}
	
	@RequestMapping(value="/basket/like.do")
	public ModelAndView goodsLike(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/basket/basketList.do");
		  Map<String,Object> map = basketService.selectGoodsLike(commandMap, request);
		  String like_cnt = String.valueOf(map.get("LIKE_CNT"));
		  
		  if(like_cnt.equals("0")) { 
			  basketService.insertGoodsLike(commandMap, request);
		  }
		  return mv;
	}
	
	
	

}
