package stu.admin.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import stu.common.common.CommandMap;

=======
>>>>>>> origin/05.29-K
@Service("adminMainService")
public class AdminMainServiceImpl implements AdminMainService {
	
	Logger log = Logger.getLogger(this.getClass()); // 로그
	
	@Resource(name="adminDao")
	private AdminDao adminDao;

	@Override
<<<<<<< HEAD
	public List<Map<String, Object>> dashBoard(CommandMap map) throws Exception { //adminMain대쉬보드
=======
	public List<Map<String, Object>> dashBoard(Map<String, Object> map) throws Exception { //adminMain대쉬보드
>>>>>>> origin/05.29-K
		// TODO Auto-generated method stub
		return adminDao.dashBoard(map);
	}
	
	@Override
<<<<<<< HEAD
	public List<Map<String, Object>> order_admin_a(CommandMap map) throws Exception { //주문/배송-신규주문
=======
	public List<Map<String, Object>> order_admin_a(Map<String, Object> map) throws Exception { //주문/배송-신규주문
>>>>>>> origin/05.29-K
		// TODO Auto-generated method stub
		return adminDao.order_admin_a(map);
	}

<<<<<<< HEAD

	@Override
	public void order_state(CommandMap map) throws Exception { // 주문상태 변경
		// TODO Auto-generated method stub
		adminDao.order_state(map);
	}

=======
>>>>>>> origin/05.29-K
}
