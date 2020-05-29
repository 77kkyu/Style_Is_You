package stu.shop.basket;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.common.CommandMap;
import stu.common.dao.AbstractDao;

@Repository("basketDao")
public class BasketDao extends AbstractDao{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> basketList(CommandMap map) throws Exception{
		return (List<Map<String,Object>>) basketList("basket.basketList", map);
	}
	
	@SuppressWarnings("unchecked")
	public void basketModify(CommandMap map) {
		basketModify("basket.basketModify", map);
	}


	
	
	
	


	
	
	

}
