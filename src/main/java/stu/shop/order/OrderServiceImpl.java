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

	//주문페이지에서 필요한 정보 검색
	@Override
	public Map<String, Object> orderMemberInfo(CommandMap commandMap, HttpServletRequest request) throws Exception {
		return (Map<String, Object>) orderDao.orderMemberInfo(commandMap);
	}

	//해당 회원이 보유한 쿠폰 검색
	@Override
	public List<Map<String, Object>> memberCoupon(CommandMap commandMap) throws Exception {
		return (List<Map<String, Object>>) orderDao.memberCoupon(commandMap);
	}

	//주문테이블 입력
	@Override
	public void insertOrder(CommandMap commandMap, HttpServletRequest request) throws Exception {
		orderDao.insertOrder(commandMap);
	}
	
	//입력한 주문 번호검색(주문완료 페이지에서 주문번호 보여주기)
	@Override public Map<String, Object> selectOrder(CommandMap commandMap, HttpServletRequest request) throws Exception { 
		return (Map<String, Object>) orderDao.selectOrder(commandMap); 
	}

	@Override
	public void orderModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		orderDao.orderModify(commandMap);
		
	}

	@Override
	public void updateMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
		orderDao.updateMember(commandMap);
		
	}
	
	
	
	
	  
	 
	
}
