package stu.shop.basket;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.common.CommandMap;
import stu.common.dao.AbstractDao;

@Repository("basketDao")
public class BasketDao extends AbstractDao{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> basketList(Map<String, Object> commandMap) throws Exception{
		return (List<Map<String,Object>>) basketList("basket.basketList", commandMap);
	}
	
	public void basketModify(CommandMap commandMap) {
		basketModify("basket.basketModify", commandMap.getMap());
	}
	
	public void basketDelete(CommandMap commandMap) {
		basketDelete("basket.basketDelete", commandMap.getMap());
		
	}

	public void basketAllDelete(CommandMap commandMap) {
		System.out.println(commandMap.get("MEMBER_NO"));
		basketAllDelete("basket.basketAllDelete", commandMap.getMap());
		
	}


	
	
	
	


	
	
	

}
