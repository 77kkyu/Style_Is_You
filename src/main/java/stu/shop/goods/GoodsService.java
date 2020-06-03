package stu.shop.goods;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface GoodsService {
	
	List<Map<String, Object>> newGoodsList(Map<String, Object> map) throws Exception; // 카테고리 상품 리스트
	
	List<Map<String, Object>> bestGoodsList(Map<String, Object> map) throws Exception; // 베스트 상품 리스트
		
	List<Map<String, Object>> cateGoodsList(Map<String, Object> map) throws Exception; // 카테고리별 상품순
	
	Map<String, Object> goodsDetail(Map<String,Object> map) throws Exception; // 상품 디테일
	
	void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception; // 글쓰기
	

}
