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

		if( use_point > 0 ) { //주문결제시 사용포인트가 있다면
			myOrderDao.use_point_reset(commandMap); //사용포인트 취소
			myOrderDao.save_point_reset(commandMap); //적립포인트 취소
		} else {
			myOrderDao.save_point_reset(commandMap); //적립포인트 취소 error
		}
		
		List<Map<String, Object>> list_stock_search = myOrderDao.list_stock_search(commandMap);	 // 주문디테일에서 상품속성번호, 수량 가져옴
		System.out.println("주문디테일 상품속성,수량:"+list_stock_search);
		
		/*
		 * 가져온값에 length를 구해 for문을 돌리고 for (list_stock_search.)
		 * 상품속성번호에 상품 수량을 ++ 해줌
		 */
		
		
		
		
		
		
		return null;
		
	}

}
