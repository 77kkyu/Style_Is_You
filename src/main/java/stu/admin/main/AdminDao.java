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
		order_state_ex("admin.order_state_ex",commandMap.getMap());
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> order_detail(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>) order_detail("admin.order_detail", commandMap.getMap());
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> order_detail_sub(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>) order_detail_sub("admin.order_detail_sub", commandMap.getMap());
	}

	public List<Map<String, Object>> as_admin_list(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>) as_admin_list("admin.as_admin_list", commandMap.getMap());
	}

	public void as_cancle_a(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		as_cancle_a("admin.as_cancle_a",commandMap.getMap());
	}

	public void order_list_cancle(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		order_list_cancle("admin.order_list_cancle",commandMap.getMap());
	}

	public void as_ok_state(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		as_ok_state("admin.as_ok_state",commandMap.getMap());
	}

	public void as_ok_orderState(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		as_ok_orderState("admin.as_ok_orderState",commandMap.getMap());
	}

	public List<Map<String, Object>> change_form_a(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>) change_form_a("admin.change_form_a", commandMap.getMap());
	}

	public List<Map<String, Object>> change_form_b(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>) change_form_b("admin.change_form_b", commandMap.getMap());
	}

	public void change_detail_insert(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		change_detail_insert("admin.change_detail_insert",commandMap.getMap());
	}

	public void change_detail_state(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		change_detail_state("admin.change_detail_state",commandMap.getMap());
	}

	public void change_goods_att_plus(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		change_goods_att_plus("admin.change_goods_att_plus",commandMap.getMap());
	}

	public void change_goods_att_minus(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		change_goods_att_minus("admin.change_goods_att_minus",commandMap.getMap());
	}

	public void as_final_state(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		as_final_state("admin.as_final_state",commandMap.getMap());
	}

	public void change_final_orderState(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		change_final_orderState("admin.as_final_state",commandMap.getMap());
	}

	public void order_list_chagam(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		order_list_chagam("admin.order_list_chagam",commandMap.getMap());
	}

	public void point_chagam(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		point_chagam("admin.point_chagam",commandMap.getMap());
	}

	public List<Map<String, Object>> point_total(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>) point_total("admin.point_total", commandMap.getMap());
	}

	public void cashback_final_orderState(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		cashback_final_orderState("admin.cashback_final_orderState",commandMap.getMap());
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		System.out.println("맵,,.: "+map);
		return (List<Map<String, Object>>) selectPagingList("admin.selectMemberList", map);
	}
	
	
}
