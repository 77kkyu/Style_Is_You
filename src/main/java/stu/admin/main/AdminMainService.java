package stu.admin.main;

import java.util.List;
import java.util.Map;

public interface AdminMainService {
	
	List<Map<String, Object>> dashBoard(Map<String, Object> map) throws Exception; // AdminMain대쉬보드
	
	List<Map<String, Object>> order_admin_a(Map<String, Object> map) throws Exception; // 주문/배송-신규주문건

}
