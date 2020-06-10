package stu.member.my;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import stu.common.common.CommandMap;

@Service("myOrderService")
public class MyOrderServiceImpl implements MyOrderService {
	
Logger log = Logger.getLogger(this.getClass()); // 로그
	
	@Resource(name="myOrderDao")
	private MyOrderDao myOrderDao;

	@Override
	public List<Map<String, Object>> myOrderList(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return myOrderDao.myOrderList(commandMap);
	}

	@Override
	public void order_ok(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		myOrderDao.order_ok(commandMap);
		
	}

	@Override
	public List<Map<String, Object>> order_state_cancle(CommandMap commandMap) throws Exception {
		
		myOrderDao.list_cancle(commandMap);  //주문상태 취소로 변경
		myOrderDao.detail_cancle(commandMap); //주문디테일상태 환불로 변경
		
		int use_point = myOrderDao.list_point_search(commandMap); //주문테이블에서 사용포인트 가져옴
		System.out.println("포인트값"+use_point);
		
		
		
		
		/*
		 * if( use_point > 0 ) { myOrderDao.use_point_reset(commandMap);
		 * myOrderDao.save_point_reset(commandMap); } else {
		 * myOrderDao.save_point_reset(commandMap); }
		 */
		
		
		
		
		
		
		return null;
		
	}

}
