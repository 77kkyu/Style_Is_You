package stu.member.my;

import java.util.List;
import java.util.Map;

import stu.common.common.CommandMap;

public interface MyOrderService {

	List<Map<String, Object>> myOrderList(CommandMap commandMap) throws Exception; // 내주문 리스트

	void order_ok(CommandMap commandMap) throws Exception;
	

}
