package stu.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.dao.AbstractDao;

@Repository("goodsDao")
public class GoodsDao extends AbstractDao{
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> GoodsList(Map<String,Object> map) throws Exception {
		
		return (List<Map<String,Object>>) goodsList("goods.goodsList", map);
	}
	
	

}
