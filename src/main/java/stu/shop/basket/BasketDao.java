package stu.shop.basket;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.dao.AbstractDao;

@Repository("basketDao")
public class BasketDao extends AbstractDao{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> basketList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>) basketList("basket.basketList", map);
	}

	
	
	
	


	
	
	

}
