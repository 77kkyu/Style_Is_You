package stu.admin.coupon;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import stu.admin.event.AdminEventDao;

@Service("adminCouponService")
public class AdminCouponServiceImpl implements AdminCouponService{
	
	// AdminCouponDAO => Resource
	@Resource(name="adminCouponDao")
	private AdminCouponDao adminCouponDao;
	
	// Coupon List View
	@Override
	public List<Map<String, Object>> couponList(Map<String, Object> map)
	throws Exception {
		return adminCouponDao.couponList(map);
	}
	
	// Coupon Detail View
	@Override
	public List<Map<String, Object>> couponDetail(Map<String, Object> map)
	throws Exception {
		return adminCouponDao.couponDetail(map);
	}
	
	// Next COUPON_NO SELECT
	@Override
	public String couponNextVal() throws Exception {
		return adminCouponDao.couponNextVal();
	}
	
	//couponInsert
	@Override
	public void couponInsert(Map<String, Object> map) throws Exception {
		adminCouponDao.couponInsert(map);
	}
	
	//couponUpdate
	@Override
	public void couponUpdate(Map<String, Object> map) throws Exception {
		adminCouponDao.couponUpdate(map);
	}
	//쿠폰상태 조회
	@Override
	public String coupon_state(Map<String, Object> map) throws Exception {
		return adminCouponDao.coupon_state(map);
	}
	//쿠폰받기 이벤트
	@Override
	public boolean couponSave(Map<String, Object> map) throws Exception {
		
		boolean result;
		
		int cnt = adminCouponDao.common_searchCoupon(map); //동일 쿠폰 발급이력 확인
		
		if (cnt == 0) {
			adminCouponDao.common_insertCoupon(map); //없으면 추가
			result = true;
		} else {
			result = false; //있으면 false 전달
		}
		
		return result;
	}
	
}
