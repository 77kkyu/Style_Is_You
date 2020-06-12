package stu.shop.goods;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.common.CommandMap;
import stu.common.dao.AbstractDao;

@Repository("goodsDao")
public class GoodsDao extends AbstractDao{
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> newGoodsList(Map<String,Object> map) throws Exception { //상품리스트출력 
		
		return (List<Map<String,Object>>) newGoodsList("goods.newGoodsList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> bestGoodsList(Map<String,Object> map) throws Exception { //베스트상품 
		
		return (List<Map<String,Object>>) bestGoodsList("goods.bestGoodsList", map);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> cateGoodsList(Map<String, Object> map) throws Exception { // 카테고리 별 상품
		System.out.println("카테고리리스트"+map);
	    return (List<Map<String,Object>>) selectPagingList("goods.cateGoodsList" , map); 
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("goods.selectGoodsDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsAtt(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("goods.selectGoodsAtt", map);
	}
	
	public void goodsHitCnt(Map<String,Object> map) throws Exception { // 조회수 증가
		System.out.println("goodsHitCntDao="+map);
		update("goods.goodsReadCntUp", map);
	}
	
	public void insertGoods(Map<String, Object> map) throws Exception { // 상품 등록
		insert("goods.goodsInsert", map);
	}
	
	public void updateGoods(Map<String, Object> map) throws Exception{
		update("goods.updateGoods", map);
	}
	
	public void goodsAttribute(Map<String, Object> map) throws Exception { // 상품속성
		insert("goods.attributeInsert", map);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception { // 파일등록
		insert("goods.insertFile", map);
	}
	
	public void deleteFileList(Map<String, Object> map) throws Exception { // 파일삭제
		update("goods.deleteFileList", map);
	}
	
	public void updateFile(Map<String, Object> map) throws Exception { // 파일수정
		update("goods.updateFile", map);
	}
	
	public void insertGoodsLike(Map<String, Object> map) throws Exception{ // 좋아요 등록
		System.out.println("좋아요"+map);
		insert("goods.insertGoodsLike", map);
	}
	
	public void deleteGoodsLike(Map<String, Object> map) throws Exception{ // 좋아요 삭제
		delete("shop.deleteGoodsLike", map);
	}
	
//	public int insertBasket(Map<String, Object> map) throws Exception{ // 장바구니 등록
//		
//		System.out.println("장바구니추가="+map);
//		return (int) insert("goods.insertBasket", map);
//	}
	
	public void insertBasket(Map<String, Object> map) throws Exception{ // 장바구니 등록
		
		System.out.println("장바구니추가="+map);
		 insert("goods.insertBasket", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsAttNum(Map<String, Object> map) throws Exception{ // 상품 옵션 번호 뽑아오기
		return (Map<String, Object>) selectOne("goods.selectGoodsAttNum", map);
	}

}
