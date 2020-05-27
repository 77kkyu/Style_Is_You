package stu.goods.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import stu.goods.dao.GoodsDao;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	
	Logger log = Logger.getLogger(this.getClass()); // 로그
	
	@Resource(name="goodsDao") 
	private GoodsDao goodsDao;

	@Override
	public List<Map<String, Object>> goodCateList(Map<String, Object> map) throws Exception {
		
		return goodsDao.GoodsList(map);
	}

}
