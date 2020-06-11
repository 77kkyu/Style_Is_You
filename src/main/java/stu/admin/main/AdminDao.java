package stu.admin.main;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.common.CommandMap;
import stu.common.dao.AbstractDao;

@Repository("adminDao")
public class AdminDao extends AbstractDao{ 
	// 로그값을 받기 위해 AbstractDao를 상속한다 AbstractDao에서 MyBatis와 로그, 커넥션을 가져와 처리한다
	// 굳이 따로 빼서 처리가 필요없다면 adminDao에서 커넥션을 받아와 바로 처리한다
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> dashBoard(CommandMap map) throws Exception { //adminMain대쉬보드 
		
		return (List<Map<String,Object>>) dashBoard("admin.dash_count",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> order_admin_a(CommandMap map) throws Exception { //admin주문현황 
		
		return (List<Map<String,Object>>) order_admin_a("admin.order_admin_a",map.getMap());
	}

	@SuppressWarnings("unchecked")
	public void order_state(CommandMap map) throws Exception {  // 주문상태 변경
		// TODO Auto-generated method stub
		order_state("admin.order_state",map.getMap());
	}
	
	@SuppressWarnings("unchecked")
	public void order_state_ex(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		//order_state_ex("admin.order_state_ex",commandMap.getMap());
	}
	/*
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * order_detail(CommandMap commandMap) throws Exception { // TODO Auto-generated
	 * method stub return (List<Map<String,Object>>)
	 * order_detail("admin.order_detail", commandMap.getMap()); }
	 * 
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * order_detail_sub(CommandMap commandMap) throws Exception { // TODO
	 * Auto-generated method stub return (List<Map<String,Object>>)
	 * order_detail_sub("admin.order_detail_sub", commandMap.getMap()); }
	 */
	
	
}
