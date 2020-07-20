package stu.admin.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import stu.common.common.CommandMap;

@Service("adminMainService")
public class AdminMainServiceImpl implements AdminMainService {
	
	Logger log = Logger.getLogger(this.getClass()); // 로그
	
	@Resource(name="adminDao")
	private AdminDao adminDao;

	@Override
	public List<Map<String, Object>> dashBoard(CommandMap map) throws Exception { //adminMain대쉬보드
		// TODO Auto-generated method stub
		return adminDao.dashBoard(map);
	}
	
	@Override
	public List<Map<String, Object>> order_admin_a(CommandMap map) throws Exception { //주문/배송-신규주문
		// TODO Auto-generated method stub
		return adminDao.order_admin_a(map);
	}

	@Override
	public void order_state(CommandMap map) throws Exception { // 주문상태 변경
		// TODO Auto-generated method stub
		adminDao.order_state(map);
	}

	@Override
	public void order_state_ex(CommandMap map) throws Exception {  // 주문상태에 배송도 변경
		// TODO Auto-generated method stub
		adminDao.order_state_ex(map);
	}

	@Override
	public List<Map<String, Object>> order_detail(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return adminDao.order_detail(commandMap);
	}
	
	@Override
	public List<Map<String, Object>> order_detail_sub(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return adminDao.order_detail_sub(commandMap);
	}

	@Override
	public List<Map<String, Object>> as_admin_list(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return adminDao.as_admin_list(commandMap);
	}

	@Override
	public void as_cancle_a(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		adminDao.as_cancle_a(commandMap);
	}

	@Override
	public void as_cancle_b(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		adminDao.order_list_cancle(commandMap);
		adminDao.as_cancle_a(commandMap);
	}

	@Override
	public void as_ok_a(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		adminDao.as_ok_state(commandMap);
		adminDao.as_ok_orderState(commandMap);
	}

	@Override
	public List<Map<String, Object>> change_form_a(CommandMap commandMap) throws Exception { //AS_list에서 정보 가져옴  전부* 
		// TODO Auto-generated method stub
		return adminDao.change_form_a(commandMap);
	}

	@Override
	public List<Map<String, Object>> change_form_b(CommandMap commandMap) throws Exception { //교환요청한 상품속성 가져옴
		// TODO Auto-generated method stub
		return adminDao.change_form_b(commandMap);
	}

	@Override
	public void change_detail_insert(CommandMap commandMap) throws Exception { // order_detail에 insert 시킴 10(출고)
		// TODO Auto-generated method stub
		adminDao.change_detail_insert(commandMap);
	}

	@Override
	public void change_detail_state(CommandMap commandMap) throws Exception { //order_detail에서 detail_state 20(반품)
		// TODO Auto-generated method stub
		adminDao.change_detail_state(commandMap);
	}

	@Override
	public void change_goods_att_plus(CommandMap commandMap) throws Exception { //goods_attribute에서 (반품)상품속성번호에 수량 증가
		// TODO Auto-generated method stub
		adminDao.change_goods_att_plus(commandMap);
	}

	@Override
	public void change_goods_att_minus(CommandMap commandMap) throws Exception { //goods_attribute에서 (출고)상품속성번호에 수량 감소
		// TODO Auto-generated method stub
		adminDao.change_goods_att_minus(commandMap);
	}

	@Override
	public void as_ok_b(CommandMap commandMap) throws Exception { // AS_LIST에서 state = 3, edate=update
		// TODO Auto-generated method stub
		adminDao.as_final_state(commandMap);
		adminDao.change_final_orderState(commandMap);
	}

	@Override
	public void order_list_chagam(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		adminDao.order_list_chagam(commandMap);
	}

	@Override
	public void point_chagam(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		adminDao.point_chagam(commandMap);
	}

	@Override
	public List<Map<String, Object>> point_total(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return adminDao.point_total(commandMap);
	}

	@Override
	public void as_ok_c(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		adminDao.as_final_state(commandMap);
		adminDao.cashback_final_orderState(commandMap);
	}

	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		return adminDao.selectMemberList(map);
	}
	
}
