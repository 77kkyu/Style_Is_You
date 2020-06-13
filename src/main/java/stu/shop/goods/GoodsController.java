package stu.shop.goods;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import stu.common.common.CommandMap;

@Controller
public class GoodsController {
	
	Logger log = Logger.getLogger(this.getClass()); //로그
	
	   //페이징 숫자
	
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
	
	@RequestMapping(value="/shop/goodsList/{cate}/{orderBy}.do")
    public ModelAndView openBoardList(@PathVariable String cate, @PathVariable String orderBy, CommandMap commandMap,
			@RequestParam(value = "keyword", defaultValue="") String keyword, HttpServletRequest request ) throws Exception{
    	ModelAndView mv = new ModelAndView("/shop/cateGoodsList");
    	commandMap.put("cate", cate);
    	request.setAttribute("keyword", keyword);
    	mv.addObject("IDX", commandMap.getMap().get("IDX"));
    	if( "NewItem".equals(orderBy) ) { // 신상품순
			commandMap.put("orderBy", "GOODS_DATE");
			commandMap.put("orderSort", "DESC");
		}else if( "favorite".equals(orderBy) ) { //인기상품
			commandMap.put("orderBy", "GOODS_READCNT");
			commandMap.put("orderSort", "DESC");
		}else if( "low".equals(orderBy) ) { // 낮은가격순
			commandMap.put("orderBy", "GOODS_SELL_PRICE");
			commandMap.put("orderSort", "ASC");
		}else if( "high".equals(orderBy) ) { // 높은가격순
			commandMap.put("orderBy", "GOODS_SELL_PRICE");
			commandMap.put("orderSort", "DESC");
		}
    	mv.addObject("category", cate);
    	String filePath_temp = request.getContextPath() + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
    	return mv;
    }
	
	
	@RequestMapping(value="/shop/cateGoodsList/{cate}/{orderBy}.do")
	public ModelAndView selectGoodsList(@PathVariable String cate, @PathVariable String orderBy, CommandMap commandMap,
			@RequestParam(value = "keyword", defaultValue="") String keyword, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> list = null;
		
		System.out.println("검색어: " + keyword);
		System.out.println("카테고리 = " + cate);
		System.out.println("카테고리 순서 =" + orderBy);
		
		// category
		commandMap.put("cate", cate);
		commandMap.put("orderBy", orderBy);
		
		// order by
		if( "NewItem".equals(orderBy) ) { // 신상품순
			commandMap.put("orderBy", "GOODS_DATE");
			commandMap.put("orderSort", "DESC");
		}else if( "favorite".equals(orderBy) ) { //인기상품
			commandMap.put("orderBy", "GOODS_READCNT");
			commandMap.put("orderSort", "DESC");
		}else if( "low".equals(orderBy) ) { // 낮은가격순
			commandMap.put("orderBy", "GOODS_SELL_PRICE");
			commandMap.put("orderSort", "ASC");
		}else if( "high".equals(orderBy) ) { // 높은가격순
			commandMap.put("orderBy", "GOODS_SELL_PRICE");
			commandMap.put("orderSort", "DESC");
		}
			
		list = goodsService.cateGoodsList(commandMap.getMap(), keyword);
		
		/*
		 * System.out.println("dd"+list.get(0).get("TOTAL_COUNT"));
		 * list.get(0).get("TOTAL_COUNT");
		 */
		System.out.println("토탈카운트"+list.get(0).get("TOTAL_COUNT"));
		mv.addObject("list", list);
		if(list.size() > 0){
            mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
        }
        else{
            mv.addObject("TOTAL", 0);
        }
		//mv.addObject("category", cate);

		return mv;
	}
	
//	@RequestMapping(value="/shop/cateGoodsList11/{cate}/{orderBy}.do", method=RequestMethod.GET)
//	public ModelAndView cateList(CommandMap commandMap, @PathVariable String cate, @PathVariable String orderBy,
//			@RequestParam(value = "keyword", defaultValue="") String keyword, HttpServletRequest request) throws Exception {
//		
//		ModelAndView mv = new ModelAndView("shop/cateGoodsList");
//		
//		request.setAttribute("keyword", keyword);
//		
//		String filePath_temp = request.getContextPath() + "/file/";
//		System.out.println(filePath_temp);
//		mv.addObject("path", filePath_temp);
//		mv.addObject("category", cate);
//		request.setAttribute("path", filePath_temp);
//
//		return mv;
//	}
	
	@RequestMapping(value="/shop/goodsDetail.do") // url 
	public ModelAndView goodsDetail(CommandMap commandMap, HttpServletRequest request) throws Exception { // 베스트 상품 리스트 출력
		
		ModelAndView mv = new ModelAndView("shop/goodsDetail"); // 보낼 url 
		Map<String,Object> map = goodsService.selectGoodsDetail(commandMap.getMap(), request);
		System.out.println("IDX = "+commandMap.getMap());
		Map<String, Object> IDX = commandMap.getMap();
		System.out.println("map = " + map);
		
		mv.addObject("map", map.get("map"));  // 상품의 PK값
		mv.addObject("list", map); // 상품 상세 정보
		
		Map<String,Object> map1 = goodsService.selectGoodsAtt(commandMap.getMap());
		
		System.out.println("map1=" +map1);
		
		
		String Size = map1.get("GOODS_ATT_SIZE").toString();
		String[] SizeList = Size.split(",");
		String Color = map1.get("GOODS_ATT_COLOR").toString();
		String[] ColorList = Color.split(",");
		System.out.println("SizeList"+SizeList.toString());
		

		ArrayList<String> arrColor = new ArrayList<>();
		ArrayList<String> arrSize = new ArrayList<>();
		TreeSet<String> treeSet = new TreeSet<>();
		for(String data : SizeList) {
			if(! arrSize.contains(data))
				arrSize.add(data);
		}
		
		for(String data : ColorList) {
			if(!arrColor.contains(data))
				arrColor.add(data);
		}
		
		System.out.println("arrColor="+ arrColor);
		System.out.println("arrSize="+arrSize);
		
		//Map<String,Object> map2 = goodsService.selectGoodsAttNum(commandMap.getMap());
		
		//System.out.println("map22222="+map2);
		//System.out.println("commandMap.getMap()222="+commandMap.getMap());
		
		
		mv.addObject("Color", arrColor);
		mv.addObject("Size", arrSize);
		return mv;
		 
	}
	

	
	@RequestMapping(value="/shop/openGoodsWrite.do") // url 
	public ModelAndView goodsWriteForm(CommandMap commandMap) throws Exception { // 글쓰기 폼
		
		ModelAndView mv = new ModelAndView("shop/goodsWrite"); // 보낼 url
		
		return mv;
		
	}
	
	
	@RequestMapping(value="/shop/goodsWrite.do" ,method = RequestMethod.POST) // url 
	public ModelAndView goodsWrite(CommandMap commandMap, HttpServletRequest request) throws Exception { // 글쓰기 작성완료
		
		ModelAndView mv = new ModelAndView("redirect:http://localhost:8080/stu/main.do"); // 보낼 url
		
		goodsService.insertGoods(commandMap.getMap(), request);
		System.out.println("글쓰기입니당"+commandMap.getMap());
		return mv;
		
	}
	
	@RequestMapping(value="/shop/goodsLike.do", method = RequestMethod.POST)
	public ModelAndView goodsLike(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/goodsDetail.do");
		mv.addObject("IDX", commandMap.getMap().get("IDX"));
		System.out.println("좋아요!!!!="+commandMap.getMap().get("GOODS_NO") );
		//mv.addObject("MEMBER_NO", commandMap.getMap().get("MEMBER_NO"));
		goodsService.insertGoodsLike(commandMap.getMap());
		return mv;
	}
	
	
//	@RequestMapping(value="/shop/insertBasket.do", method = RequestMethod.POST)
//	public ModelAndView insertBasket(CommandMap commandMap, HttpServletRequest request) throws Exception{
//		ModelAndView mv = new ModelAndView("redirect:/main.do");
//		int resultYn = 0;
//		mv.addObject("IDX", commandMap.getMap().get("IDX"));
//		
//		//List<CommandMap> list = new ArrayList<CommandMap>();
//		
//		//List<Map<String, Object>>
//		
//		//String[] list = request.getParameterValues("resultList");;
//		
//		//System.out.println("디테일에서 넘어온 데이터1="+list[0].toString());
//		System.out.println("commandMap1="+ commandMap.getMap().get("resultList").toString());
////		String[] Size = (String[])commandMap.getMap().get("ORDER_SIZE");
////		String[] Color = (String[])commandMap.getMap().get("ORDER_COLOR");
////		String[] Amount = (String[])commandMap.getMap().get("BASKET_GOODS_AMOUNT");
////		String[] Goods_No = (String[])commandMap.getMap().get("IDX");
////		String[] Member_No =  (String[])commandMap.getMap().get("MEMBER_NO");
//		
//		
//		
////		System.out.println("Size1Size1="+Size.length);
////		
////		String IDX = Goods_No[0].toString();
////		System.out.println("IDXIDX="+IDX);
////		System.out.println("Size.length="+Size.length);
//
//		
//		List<CommandMap> resultList = new ArrayList<CommandMap>();
//		resultList.add(commandMap);
//		
//		
//		
////		for(int j=0; j<=Size.length-1; j++) {
////			commandMap.put("ORDER_SIZE", Size[j]);
////			commandMap.put("ORDER_COLOR", Color[j]);
////			commandMap.put("BASKET_GOODS_AMOUNT", Amount[j]);
////			commandMap.put("IDX", Goods_No[j]);
////			commandMap.put("MEMBER_NO", Member_No[j]);
////			System.out.println("Size1111="+Size[j]);
////			resultList.add(commandMap);
////			//resultYn = goodsService.insertBasket(resultList, request);
////			System.out.println("resultList.add(commandMap);"+commandMap);
////		}
//		
////		System.out.println("컨트롤러 0번 resultList="+resultList.get(0).get("ORDER_SIZE"));
////		System.out.println("컨트롤러 1번 resultList="+resultList.get(1).get("ORDER_SIZE"));
//		resultYn = goodsService.insertBasket(resultList, request);
//		/*
//		 * System.out.println("resultList배열="+resultList.get(0).get("ORDER_SIZE"));
//		 * System.out.println("resultList배열="+resultList.get(1).get("ORDER_SIZE"));
//		 * System.out.println("commandMap="+commandMap.getMap());
//		 * System.out.println("resultList="+resultList);
//		 */
//		
//		
//		
//		if(resultYn < 1) {
//			mv.addObject("RESULT", "FAIL");
//		}else {
//			mv.addObject("RESULT", "SUCC");
//		}
//		
//		return mv;
//	}
	
	
	@RequestMapping(value="/shop/insertBasket.do", method = RequestMethod.POST)
	public ModelAndView insertBasket(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/main.do");
		
		System.out.println("CommandMap="+commandMap.getMap());
		commandMap.remove("resultList");
//		String[] Size = (String[])commandMap.getMap().get("ORDER_SIZE");
//		String[] Color = (String[])commandMap.getMap().get("ORDER_COLOR");
//		String[] Amount = (String[])commandMap.getMap().get("BASKET_GOODS_AMOUNT");
//		String[] Goods_No = (String[])commandMap.getMap().get("IDX");
//		String[] Member_No =  (String[])commandMap.getMap().get("MEMBER_NO");
		
	      

		if(commandMap.get("ORDER_SIZE").getClass().getName().equals("java.lang.String")){ 
			Map<String,Object> map = new HashMap<String,Object>();
			System.out.println("CommandMap1="+commandMap.getMap());
			
//			String[] Goods_No1 = (String[])commandMap.getMap().get("IDX"); 
//			String Goods_No2 = Goods_No1[0].toString();
//			String Goods_No3 = Goods_No1[1].toString();
//			System.out.println(Goods_No2);
//			System.out.println(Goods_No3);
//			String IDX=Arrays.toString(Goods_No1).replace("[", "");
//		    IDX=IDX.replace("]", "");
			map.put("IDX", commandMap.get("IDX"));
			map.put("MEMBER_NO", commandMap.get("MEMBER_NO"));
			map.put("ORDER_SIZE", commandMap.get("ORDER_SIZE"));
			map.put("ORDER_COLOR", commandMap.get("ORDER_COLOR"));
			map.put("BASKET_GOODS_AMOUNT", commandMap.get("BASKET_GOODS_AMOUNT"));
			
			goodsService.insertBasket(map, request);
		}else {
			System.out.println("CommandMap2="+commandMap.getMap());
			String[] Size = (String[])commandMap.getMap().get("ORDER_SIZE");
			String[] Color = (String[])commandMap.getMap().get("ORDER_COLOR");
			String[] Amount = (String[])commandMap.getMap().get("BASKET_GOODS_AMOUNT");
			String[] Goods_No = (String[])commandMap.getMap().get("IDX");
			String[] Member_No =  (String[])commandMap.getMap().get("MEMBER_NO");
			System.out.println("다중 사이즈0="+ Goods_No[0]);
			System.out.println("다중 사이즈1="+ Goods_No[1]);
			Map<String,Object> map1 = new HashMap<String,Object>();
			for(int j=0; j<=Size.length-1; j++) {
			map1.put("ORDER_SIZE", Size[j]);
			map1.put("ORDER_COLOR", Color[j]);
			map1.put("BASKET_GOODS_AMOUNT", Amount[j]);
			map1.put("IDX", Goods_No[j]);
			map1.put("MEMBER_NO", Member_No[j]);
			System.out.println("Size1111="+Size[j]);
			goodsService.insertBasket(map1, request);
			}
		}
			
		
//		List<CommandMap> resultList = new ArrayList<CommandMap>();
//		resultList.add(commandMap);
		
		
		
//		for(int j=0; j<=Size.length-1; j++) {
//			commandMap.put("ORDER_SIZE", Size[j]);
//			commandMap.put("ORDER_COLOR", Color[j]);
//			commandMap.put("BASKET_GOODS_AMOUNT", Amount[j]);
//			commandMap.put("IDX", Goods_No[j]);
//			commandMap.put("MEMBER_NO", Member_No[j]);
//			System.out.println("Size1111="+Size[j]);
//			resultList.add(commandMap);
//			//resultYn = goodsService.insertBasket(resultList, request);
//			System.out.println("resultList.add(commandMap);"+commandMap);
//		}
		
		return mv;
	}
	
}
