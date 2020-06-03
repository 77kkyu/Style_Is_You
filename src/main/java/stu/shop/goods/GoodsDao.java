package stu.shop.goods;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

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
		
		   return (List<Map<String,Object>>) selectList("goods.cateGoodsList" , map); 
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> goodsDetail(Map<String, Object> map) throws Exception { // 상품 디테일
		
		   return (Map<String,Object>) selectOne("goods.goodsDetail" , map); 
	}
	
	public void goodsHitCnt(Map<String,Object> map) throws Exception { // 조회수 증가
		update("goods.goodsReadCntUp", map);
	}
	
	public void insertGoods(Map<String, Object> map) throws Exception { // 상품 등록
		insert("goods.goodsInsert", map);
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

}
