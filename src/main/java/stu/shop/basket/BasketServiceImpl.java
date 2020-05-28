package stu.shop.basket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;



@Service("basketService")
public class BasketServiceImpl implements BasketService{
	
Logger log = Logger.getLogger(this.getClass()); // 로그
	
	@Resource(name="basketDao") 
	private BasketDao basketDao;

	@Override
	public List<Map<String, Object>> basketList(Map<String, Object> map) throws Exception {

		return (List<Map<String, Object>>) basketDao.basketList(map);
	}

	

}
