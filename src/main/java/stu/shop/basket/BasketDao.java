package stu.shop.basket;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.common.CommandMap;
import stu.common.dao.AbstractDao;

@Repository("basketDao")
public class BasketDao extends AbstractDao{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> basketList(CommandMap commandMap) throws Exception{
		return (List<Map<String,Object>>) selectList("basket.basketList", commandMap.getMap());
	}
	
	public void basketModify(CommandMap commandMap) throws Exception{
		update("basket.basketModify", commandMap.getMap());
	}
	
	public void basketDelete(CommandMap commandMap) throws Exception{
		delete("basket.basketDelete", commandMap.getMap());
		
	}

	public void basketAllDelete(CommandMap commandMap) throws Exception{
		delete("basket.basketAllDelete", commandMap.getMap());
		
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsLike(CommandMap commandMap) throws Exception{
		return (Map<String, Object>) selectOne("basket.selectGoodsLike", commandMap.getMap());
	}

	public void insertGoodsLike(CommandMap commandMap) {
		insert("basket.insertGoodsLike", commandMap.getMap());
		
	}

	public List<Map<String, Object>> basketSelectList(CommandMap commandMap) {
		return (List<Map<String,Object>>) selectList("basket.basketSelectList", commandMap.getMap());
	}


	
	
	
	


	
	
	

}
