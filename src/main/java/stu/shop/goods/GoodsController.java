package stu.shop.goods;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;

@Controller
public class GoodsController {
	
	Logger log = Logger.getLogger(this.getClass()); //로그
	
	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	@RequestMapping(value="/shop/newGoodsList.do") // url 
	public ModelAndView goodsCateList(CommandMap commandMap) throws Exception { // 최신상품 리스트 출력
		
		ModelAndView mv = new ModelAndView("shop/goodsList"); // 보낼 url

		List<Map<String,Object>> list = goodsService.newGoodsList(commandMap.getMap());
		
		mv.addObject("list", list);
		mv.addObject("titleMain", "새상품");
		
		return mv;
		
	}
	
	@RequestMapping(value="/shop/bestGoodsList.do") // url 
	public ModelAndView bestGoodsList(CommandMap commandMap) throws Exception { // 베스트 상품 리스트 출력
		
		ModelAndView mv = new ModelAndView("shop/goodsList"); // 보낼 url
		
		List<Map<String,Object>> list = goodsService.bestGoodsList(commandMap.getMap());
		list.get(0);
		System.out.println("index"+ list.get(0));
		System.out.println("get!!!!!!!!!!!!!"+commandMap.get("GOODS_NAME"));
		mv.addObject("list", list);
		mv.addObject("titleMain", "베스트");
		
		return mv;
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/shop/cateGoodsList/{cate}/{orderBy}.do", method=RequestMethod.GET)
	public ModelAndView cateList(@PathVariable String cate, @PathVariable String orderBy, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map<String,Object>> list = null;

		mv.setViewName("shop/cateGoodsList");

		System.out.println("카테고리 = " + cate);
		System.out.println("카테고리 순서 =" + orderBy);
		
		// category
		commandMap.put("cate", cate);
		
		// order by
		if( orderBy == null ||  "NewItem".equals(orderBy)) { // 신상품순
			commandMap.put("orderBy", "GOODS_DATE");
			commandMap.put("orderSort", "DESC");
		}
		
		
		
		list = goodsService.cateGoodsList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		
		
		
		return mv;
	}

}
