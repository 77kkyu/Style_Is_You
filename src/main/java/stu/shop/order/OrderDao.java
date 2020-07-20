package stu.shop.order;

import java.util.Arrays;
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
		insert("order.insertOrder", commandMap.getMap()); //ORDER테이블에 INSERT
		//주문한 상품의 종류가 한개일때
		if(commandMap.get("goods_no").getClass().getName().equals("java.lang.String")){ 
		  Map<String,Object> dp = new HashMap<String, Object>(); 
		  dp.put("GOODS_NO",commandMap.get("goods_no")); 
		  dp.put("GOODS_ATT_NO",commandMap.get("goods_att_no")); 
		  dp.put("ORDER_DETAIL_PRICE",commandMap.get("ORDER_DETAIL_PRICE")); 
		  dp.put("ORDER_DETAIL_COLOR", commandMap.get("goods_att_color")); 
		  dp.put("ORDER_DETAIL_SIZE", commandMap.get("goods_att_size")); 
		  dp.put("ORDER_DETAIL_AMOUNT",commandMap.get("basket_goods_amount")); 
		  dp.put("COUPON_DISCOUNT",commandMap.get("COUPON_DISCOUNT")); 
		  dp.put("ORDER_DISCOUNT_APPLY",commandMap.get("ORDER_DISCOUNT_APPLY")); 
		  dp.put("COUPON_NO",commandMap.get("COUPON_NO_1")); 
		  dp.put("MEMBER_NO", commandMap.get("MEMBER_NO"));
		  insert("order.insertOrderDetail", dp);
		  update("goods.updateGoodsAmount", dp);
		  update("goods.updateGoodsDisplay", dp);
		  
		  Map<String,Object> bod = new HashMap<String, Object>();
		  bod.put("BASKET_NO", commandMap.get("basket_no")); 
		  bod.put("GOODS_ATT_NO", commandMap.get("goods_att_no")); 
		  bod.put("MEMBER_NO", commandMap.get("MEMBER_NO"));
		  delete("basket.basketOrderDelete", bod);
		}else {	 //주문한 상품의 종류가 두개 이상일때
			String[] GOODS_NO = (String[])commandMap.getMap().get("goods_no");
			String[] GOODS_ATT_NO = (String[])commandMap.getMap().get("goods_att_no");
			String[] ORDER_DETAIL_PRICE = (String[])commandMap.getMap().get("ORDER_DETAIL_PRICE");
			String[] ORDER_DETAIL_COLOR = (String[])commandMap.getMap().get("goods_att_color");
			String[] ORDER_DETAIL_SIZE = (String[])commandMap.getMap().get("goods_att_size");
			String[] ORDER_DETAIL_AMOUNT = (String[])commandMap.getMap().get("basket_goods_amount");
			String[] COUPON_DISCOUNT = (String[])commandMap.getMap().get("COUPON_DISCOUNT");
			String[] ORDER_DISCOUNT_APPLY = (String[])commandMap.getMap().get("ORDER_DISCOUNT_APPLY");
			String[] BASKET_NO = (String[])commandMap.getMap().get("basket_no");
			String COUPON_NO = (String) commandMap.getMap().get("COUPON_NO_1");
		
			String a=Arrays.toString(BASKET_NO).replace("[", "");
			a=a.replace("]", "");
			String b=Arrays.toString(GOODS_ATT_NO).replace("[", "");
			b=b.replace("]", "");
		
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
			  dp.put("MEMBER_NO", commandMap.get("MEMBER_NO"));
			  insert("order.insertOrderDetail", dp); 
			  update("goods.updateGoodsAmount", dp);
			  update("goods.updateGoodsDisplay", dp);
			}
			Map<String,Object> bod = new HashMap<String, Object>();
			bod.put("MEMBER_NO", commandMap.get("MEMBER_NO"));
		 	bod.put("BASKET_NO", a);
			bod.put("GOODS_ATT_NO", b);
			delete("basket.basketOrderDelete", bod);
		}
		//사용한 포인트가 있다면 사용포인트 INSERT
		if(!commandMap.get("ORDER_USE_POINT").equals("0")) {
	         insert("point.usePoint", commandMap.getMap()); 
	      }
	    insert("point.savePoint", commandMap.getMap());	//포인트 적립 INSERT
		//사용한 쿠폰이 있다면
		if(!commandMap.get("COUPON_STATUS_NO_1").equals("")) {
			update("coupon.useCoupon", commandMap.getMap());
		}
	}
	
	 @SuppressWarnings("unchecked") 
	 public Map<String, Object> selectOrder(CommandMap commandMap) { 
		 return (Map<String, Object>) selectOne("order.selectOrder", commandMap.getMap()); 
	 }

	public void orderModify(CommandMap commandMap) {
		update("order.orderModify", commandMap.getMap());
	}

	public void updateMember(CommandMap commandMap) {
		update("join.updateMemberTotal", commandMap.getMap());
		
		Map<String,Object> map = (Map<String, Object>) selectOne("join.selectMemberTotal", commandMap.getMap());
		
		int MEMBER_TOTAL = Integer.parseInt(map.get("MEMBER_TOTAL").toString());
		String MEMBER_GRADE = "";
		
		if(MEMBER_TOTAL<200000) {
			MEMBER_GRADE = "NORMAL";
		}else if(MEMBER_TOTAL>=200000 && MEMBER_TOTAL<500000) {
			MEMBER_GRADE = "GOLD";
		}else {
			MEMBER_GRADE = "VIP";
		}
		Map<String,Object> mg = new HashMap<String, Object>(); 
		mg.put("MEMBER_GRADE", MEMBER_GRADE);
		mg.put("MEMBER_NO", commandMap.get("MEMBER_NO"));
		update("join.updateMemberGrade", mg);
	}
	  
	 
	
	
	
}
