package stu.shop.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.common.CommandMap;
import stu.common.dao.AbstractDao;

@Repository("orderDao")
public class OrderDao extends AbstractDao{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> orderMemberInfo(CommandMap commandMap) throws Exception{
		return (Map<String, Object>) selectOne("order.orderMemberInfo", commandMap.getMap());
	}

	public List<Map<String, Object>> memberCoupon(CommandMap commandMap) {
		return (List<Map<String,Object>>) selectList("order.memberCoupon", commandMap.getMap());
	}

	public void insertOrder(CommandMap commandMap) throws Exception{
		insert("order.insertOrder", commandMap.getMap());
		
		String[] GOODS_NO = (String[])commandMap.getMap().get("goods_no");
		String[] GOODS_ATT_NO = (String[])commandMap.getMap().get("goods_att_no");
		String[] ORDER_DETAIL_PRICE = (String[])commandMap.getMap().get("ORDER_DETAIL_PRICE");
		String[] ORDER_DETAIL_COLOR = (String[])commandMap.getMap().get("goods_att_color");
		String[] ORDER_DETAIL_SIZE = (String[])commandMap.getMap().get("goods_att_size");
		String[] ORDER_DETAIL_AMOUNT = (String[])commandMap.getMap().get("basket_goods_amount");
		String[] COUPON_DISCOUNT = (String[])commandMap.getMap().get("COUPON_DISCOUNT");
		String[] ORDER_DISCOUNT_APPLY = (String[])commandMap.getMap().get("ORDER_DISCOUNT_APPLY");
		String COUPON_NO = (String) commandMap.getMap().get("COUPON_NO_1");
		System.out.println(GOODS_NO[0]);
		
		int len = ORDER_DISCOUNT_APPLY.length;
		  for(int i=0; i<len; i++ ) { 
			  Map<String,Object> dp = new HashMap<String, Object>();
			  dp.put("GOODS_NO", GOODS_NO[i]);
			  dp.put("GOODS_ATT_NO", GOODS_ATT_NO[i]);
			  dp.put("ORDER_DETAIL_PRICE", ORDER_DETAIL_PRICE[i]);
			  dp.put("ORDER_DETAIL_COLOR", ORDER_DETAIL_COLOR[i]);
			  dp.put("ORDER_DETAIL_SIZE", ORDER_DETAIL_SIZE[i]);
			  dp.put("ORDER_DETAIL_AMOUNT", ORDER_DETAIL_AMOUNT[i]);
			  dp.put("COUPON_DISCOUNT", COUPON_DISCOUNT[i]);
			  dp.put("ORDER_DISCOUNT_APPLY", ORDER_DISCOUNT_APPLY[i]);
			  dp.put("COUPON_NO", COUPON_NO);
			  insert("order.insertOrderDetail", dp); 
		  }
		 
		insert("order.savePoint", commandMap.getMap());
		insert("order.usePoint", commandMap.getMap());
		update("order.useCoupon", commandMap.getMap());
	}
	
	
	
	
}
