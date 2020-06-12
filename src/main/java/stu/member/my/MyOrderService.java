package stu.member.my;

import java.util.List;
import java.util.Map;

import stu.common.common.CommandMap;

public interface MyOrderService {

	List<Map<String, Object>> myOrderList(CommandMap commandMap) throws Exception; // 내주문 리스트

	void order_ok(CommandMap commandMap) throws Exception; // 수취확인

	void order_state_cancle(CommandMap commandMap) throws Exception; // 주문취소 - 마이페이지 입금확인전까지 취소
		
	List<Map<String, Object>> changeForm_b(CommandMap commandMap) throws Exception; // 교환 신청폼에 필요한 order_detail를 가져옴
	

}
