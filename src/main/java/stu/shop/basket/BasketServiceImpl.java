package stu.shop.basket;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import stu.common.common.CommandMap;
import stu.shop.goods.GoodsDao;




@Service("basketService")
public class BasketServiceImpl implements BasketService{
	
Logger log = Logger.getLogger(this.getClass()); // 로그
	
	@Resource(name="basketDao") 
	private BasketDao basketDao;

	@Override
	public List<Map<String, Object>> basketList(CommandMap commandMap) throws Exception {
		return (List<Map<String, Object>>) basketDao.basketList(commandMap);
	}

	@Override
	public void basketModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		basketDao.basketModify(commandMap);
		
	}

	@Override
	public void basketDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		basketDao.basketDelete(commandMap);
		
	}

	@Override
	public void basketAllDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		basketDao.basketAllDelete(commandMap);
	}

	@Override
	public Map<String, Object> selectGoodsLike(CommandMap commandMap, HttpServletRequest request) throws Exception {
		return basketDao.selectGoodsLike(commandMap);
	}

	@Override
	public void insertGoodsLike(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		basketDao.insertGoodsLike(commandMap);
		
	}

	@Override
	public List<Map<String, Object>> basketSelectList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		return (List<Map<String, Object>>) basketDao.basketSelectList(commandMap);
	}

	
	

	

}
