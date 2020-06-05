package stu.admin.main;

import java.util.List;
import java.util.Map;


import stu.common.common.CommandMap;

public interface AdminMainService {
	
	List<Map<String, Object>> dashBoard(CommandMap commandMap) throws Exception; // AdminMain대쉬보드
	
	List<Map<String, Object>> order_admin_a(CommandMap map) throws Exception; // 주문/배송-신규주문건

	void order_state(CommandMap map) throws Exception; // 주문/배송-신규주문건

}
