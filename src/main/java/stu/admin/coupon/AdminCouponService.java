package stu.admin.coupon;

import java.util.List;
import java.util.Map;

public interface AdminCouponService {

	// Coupon List View
	List<Map<String, Object>> couponList(Map<String, Object> map) throws Exception;
	
	// Coupon Detail View
	List<Map<String, Object>> couponDetail(Map<String, Object> map) throws Exception;
	
	// Next COUPON_NO SELECT
	String couponNextVal() throws Exception;
	
	//couponInsert
	void couponInsert(Map<String, Object> map) throws Exception;
	
	//couponUpdate
	void couponUpdate(Map<String, Object> map) throws Exception;
	
	//쿠폰상태 조회
	String coupon_state(Map<String, Object> map) throws Exception;
	
	//쿠폰받기 이벤트
	boolean couponSave(Map<String, Object> map) throws Exception;
	
}
