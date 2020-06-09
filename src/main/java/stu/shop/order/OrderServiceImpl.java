package stu.shop.order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import stu.common.common.CommandMap;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
Logger log = Logger.getLogger(this.getClass()); // 로그
	
	@Resource(name="orderDao") 
	private OrderDao orderDao;

	@Override
	public Map<String, Object> orderMemberInfo(CommandMap commandMap, HttpServletRequest request) throws Exception {
		return (Map<String, Object>) orderDao.orderMemberInfo(commandMap);
	}

	@Override
	public List<Map<String, Object>> memberCoupon(CommandMap commandMap) throws Exception {
		return (List<Map<String, Object>>) orderDao.memberCoupon(commandMap);
	}

	@Override
	public void insertOrder(CommandMap commandMap, HttpServletRequest request) throws Exception {
		orderDao.insertOrder(commandMap);
		
	}
	
	

}
