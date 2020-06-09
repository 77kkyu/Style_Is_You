package stu.member.my;

import java.util.List;
import java.util.Map;

import stu.common.common.CommandMap;

public interface MyOrderService {

	List<Map<String, Object>> myOrderList(CommandMap commandMap) throws Exception; // 내주문 리스트

	void order_ok(CommandMap commandMap) throws Exception;

	List<Map<String, Object>> order_state_cancle(CommandMap commandMap) throws Exception; // list, detail에서 주문상태 변경 후 use_point와 save포인트를 가져옴
	

}
