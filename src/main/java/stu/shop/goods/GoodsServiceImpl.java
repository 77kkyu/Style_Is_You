package stu.shop.goods;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	
	Logger log = Logger.getLogger(this.getClass()); // 로그
	
	@Resource(name="goodsDao") 
	private GoodsDao goodsDao;

	@Override
	public List<Map<String, Object>> newGoodsList(Map<String, Object> map) throws Exception { // 카테고리 상품 리스트 
		
		return goodsDao.newGoodsList(map);
	}

	@Override
	public List<Map<String, Object>> bestGoodsList(Map<String, Object> map) throws Exception {
		
		return goodsDao.bestGoodsList(map);
	}

	@Override
	public List<Map<String, Object>> cateGoodsList(Map<String, Object> map) throws Exception {
		
		return goodsDao.cateGoodsList(map);
	}





}
