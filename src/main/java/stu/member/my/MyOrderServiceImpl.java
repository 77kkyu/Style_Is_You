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
	public void order_state_cancle(CommandMap commandMap) throws Exception {
		
		myOrderDao.list_cancle(commandMap);  //주문상태 취소로 변경
		myOrderDao.detail_cancle(commandMap); //주문디테일상태 환불로 변경
		
		List<Map<String, Object>> point = myOrderDao.list_point_search(commandMap); //주문테이블에서 사용포인트 가져옴
		//System.out.println("포인트값"+point); 포인트값[{ORDER_USE_POINT=0, ORDER_SAVE_POINT=3000, MEMBER_NO=2, POINT_TOTAL=25000}]

		int order_no = Integer.parseInt(point.get(0).get("ORDER_NO").toString());
		int member_no = Integer.parseInt(point.get(0).get("MEMBER_NO").toString());
		int use_point = Integer.parseInt(point.get(0).get("ORDER_USE_POINT").toString());
		int save_point = Integer.parseInt(point.get(0).get("ORDER_SAVE_POINT").toString());
		int point_total = Integer.parseInt(point.get(0).get("POINT_TOTAL").toString());
		int use_hap = 0; int save_hap = 0;
		System.out.println(use_point+"/"+save_point+"/"+member_no);

		use_hap = point_total + use_point; // 사용한 포인트는 total_point에 합산
		save_hap = point_total - save_point; // 적립한 포인트는 total_point에서 차감
		
		commandMap.put("order_no", order_no);
		commandMap.put("member_no", member_no);		
		commandMap.put("order_use_point", use_point);
		commandMap.put("order_save_point", use_point);
		commandMap.put("use_hap", use_hap);
		commandMap.put("save_hap", save_hap);
		
		if( use_point > 0 ) { //주문결제시 사용포인트가 있다면
			myOrderDao.use_point_reset(commandMap);//사용포인트 취소 
			myOrderDao.save_point_reset(commandMap); //적립포인트 취소
		} else {
			myOrderDao.save_point_reset(commandMap); //적립포인트 취소
		}
		 
		
		List<Map<String, Object>> list_stock_search = myOrderDao.list_stock_search(commandMap);	 // 주문디테일에서 상품속성번호, 수량 가져옴
		//System.out.println("주문디테일 상품속성,수량:"+list_stock_search);
				
		int goods_att_no = 0;
		int order_detail_amount = 0;
		
		//주문한 수 만큼 상품개수를 다시 채움
		for (int i=0; i < list_stock_search.size(); i++) {
		goods_att_no = Integer.parseInt(list_stock_search.get(i).get("GOODS_ATT_NO").toString());
		order_detail_amount = Integer.parseInt(list_stock_search.get(i).get("ORDER_DETAIL_AMOUNT").toString());
		commandMap.put("goods_att_no", goods_att_no);		
		commandMap.put("order_detail_amount", order_detail_amount);
		System.out.println("size"+list_stock_search.size()+"******************** 값들 :"+goods_att_no+" / "+order_detail_amount);		
		myOrderDao.list_stock_reset(commandMap);
		}
		/* 가져온값에 size()를 구해 for문을 돌리고 상품속성번호에 상품 수량을 ++ 해줌	 */
		
	}
	
	@Override
	public List<Map<String, Object>> changeForm_a(CommandMap commandMap) throws Exception { //AS폼 데이타A 
		// TODO Auto-generated method stub
		return myOrderDao.changeForm_a(commandMap);
	}
	@Override
	public List<Map<String, Object>> changeForm_b(CommandMap commandMap) throws Exception { //AS폼 데이타B
		// TODO Auto-generated method stub
		return myOrderDao.changeForm_b(commandMap);
	}

	@Override
	public String pwd_chk(CommandMap commandMap) throws Exception { //패스워드 체크
		// TODO Auto-generated method stub
		return myOrderDao.pwd_chk(commandMap);
	}

	@Override
	public void order_change(CommandMap commandMap) throws Exception { //AS요청  처리
		// TODO Auto-generated method stub
		myOrderDao.order_change(commandMap);
	}

	@Override
	public List<Map<String, Object>> myAsList(CommandMap commandMap) throws Exception { //마이페이지 AS요청 LIST 
		// TODO Auto-generated method stub
		return myOrderDao.myAsList(commandMap);
	}

}
