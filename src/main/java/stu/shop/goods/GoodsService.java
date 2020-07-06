package stu.shop.goods;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import stu.common.common.CommandMap;

public interface GoodsService {
	
	List<Map<String, Object>> newGoodsList(Map<String, Object> map) throws Exception; // 최신 상품 리스트
	
	List<Map<String, Object>> bestGoodsList(Map<String, Object> map) throws Exception; // 베스트 상품 리스트
		
	List<Map<String, Object>> cateGoodsList(Map<String, Object> map, String keyword) throws Exception; // 카테고리별 상품순
	
	List<Map<String, Object>> mainSearch(Map<String, Object> map, String keyword) throws Exception; // 메인검색
	
	List<Map<String, Object>> selectBasketNo(Map<String, Object> map) throws Exception; // 구매할때 시퀀스값 가져오기
	
	List<Map<String, Object>> selectGoodsQna(Map<String, Object> map) throws Exception; // 상품Qna 리스트
	
	List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception; // 리뷰 리스트
	
	Map<String, Object> selectGoodsDetail(Map<String,Object> map, HttpServletRequest request) throws Exception; // 상품 디테일
	
	Map<String, Object> selectGoodsAtt(Map<String,Object> map) throws Exception; // 상품속성 디테일
	
	void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception; // 상품 등록
	
	void updateGoods(Map<String, Object> map, HttpServletRequest request) throws Exception; // 상품 수정
	
	void deleteGoods(Map<String, Object> map, HttpServletRequest request) throws Exception; // 상품 삭제(숨김)
	
	void insertGoodsLike(Map<String, Object> map) throws Exception; // 디테일에서 상품 좋아요 
	
	void deleteGoodsLike(Map<String, Object> map) throws Exception; // 상품 좋아요 삭제
		
	void insertBasket(Map<String,Object> map, HttpServletRequest request) throws Exception; // 장바구니 추가 

	Map<String, Object> selectGoodsAttNum(Map<String,Object> map) throws Exception; // 상품속성 디테일
	
	void insertGoodsQna(Map<String, Object> map, HttpServletRequest request) throws Exception; // 상품문의 등록
	
	void updateGoodsQna(Map<String, Object> map, HttpServletRequest request) throws Exception; // 상품 답변
	
	void insertGoodsReview(Map<String, Object> map, HttpServletRequest request) throws Exception; // 리뷰 등록
	
	void updateReview(Map<String, Object> map, HttpServletRequest request) throws Exception; // 리뷰 수정
	
	void gumeListDelete(Map<String, Object> map) throws Exception; // 구매리스트 초기화

}
