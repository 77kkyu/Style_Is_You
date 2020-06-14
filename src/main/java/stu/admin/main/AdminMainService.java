package stu.admin.main;

import java.util.List;
import java.util.Map;

import stu.common.common.CommandMap;

public interface AdminMainService {
	
	List<Map<String, Object>> dashBoard(CommandMap commandMap) throws Exception; // AdminMain대쉬보드
	
	List<Map<String, Object>> order_admin_a(CommandMap map) throws Exception; // 주문/배송-신규주문건
	
	void order_state(CommandMap map) throws Exception; // 주문/배송- 주문상태변경
	
	void order_state_ex(CommandMap commandMap) throws Exception; // 주문/배송 - 송장번호 입력

	List<Map<String, Object>> order_detail(CommandMap commandMap) throws Exception; //어드민 - 주문변경 상세

	List<Map<String, Object>> order_detail_sub(CommandMap commandMap) throws Exception;//어드민 - 주문변경 detail상세

	List<Map<String, Object>> as_admin_list(CommandMap commandMap) throws Exception; // 교환.환불.AS 신청목록 

	

}
