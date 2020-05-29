package stu.shop.goods;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.dao.AbstractDao;

@Repository("goodsDao")
public class GoodsDao extends AbstractDao{
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> newGoodsList(Map<String,Object> map) throws Exception { //상품리스트출력 
		
		return (List<Map<String,Object>>) newGoodsList("goods.goodsList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> bestGoodsList(Map<String,Object> map) throws Exception { //베스트상품 
		
		return (List<Map<String,Object>>) bestGoodsList("goods.bestGoodsList", map);
	}

}
