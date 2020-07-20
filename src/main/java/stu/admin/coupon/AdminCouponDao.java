package stu.admin.coupon;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.dao.AbstractDao;

@Repository("adminCouponDao")
public class AdminCouponDao extends AbstractDao{

	// Coupon List View
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> couponList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("coupon.couponList", map);
	}
	
	// Coupon Detail View
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> couponDetail(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("coupon.couponDetail", map);
	}
	
	// Next COUPON_NO SELECT
	@SuppressWarnings("unchecked")
	public String couponNextVal() throws Exception {
		return (String) selectOne("coupon.couponNextVal");
	}
	
	//couponInsert
	@SuppressWarnings("unchecked")
	public void couponInsert(Map<String, Object> map) throws Exception {
		insert("coupon.couponInsert", map);
	}
	
	//couponUpdate
	@SuppressWarnings("unchecked")
	public void couponUpdate(Map<String, Object> map) throws Exception {
		update("coupon.couponUpdate", map);
	}
	//선택된 쿠폰의 현재 상태만 가져오기
	@SuppressWarnings("unchecked")
	public String coupon_state(Map<String, Object> map) throws Exception {
		return (String) selectOne("coupon.coupon_state", map); // end 종료, pre 예정, ing 진행중
	}
	//쿠폰받기 클릭시 동일한 쿠폰이 발급되었는지 확인
	@SuppressWarnings("unchecked")
	public int common_searchCoupon(Map<String, Object> map) throws Exception {
		return (int) selectOne("coupon.common_searchCoupon", map); // 0 미발급, 1 기발급
	}	
	//발급 가능한 대상인 경우 쿠폰 발급(insert)
	@SuppressWarnings("unchecked")
	public void common_insertCoupon(Map<String, Object> map) throws Exception {
		update("coupon.common_insertCoupon", map);
	}
	
}
