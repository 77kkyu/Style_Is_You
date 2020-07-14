package stu.admin.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import stu.admin.coupon.AdminCouponDao;

@Service("adminEventService")
public class AdminEventServiceImpl implements AdminEventService{
	
	// AdminEventDao => Resource
	@Resource(name="adminEventDao")
	private AdminEventDao adminEventDao;

	// 관리자 이벤트 리스트
	@Override
	public List<Map<String, Object>> eventList(Map<String, Object> map)
	throws Exception {
		return adminEventDao.eventList(map);
	}
	
	// 관리자 이벤트 상세
	@Override
	public List<Map<String, Object>> eventDetail(Map<String, Object> map)
	throws Exception {
		return adminEventDao.eventDetail(map);
	}
	
	// 관리자 이벤트 신규 등록시 오늘날짜, nextval 키 값
	@Override
	public List<Map<String, Object>> eventNextVal() throws Exception {
		return adminEventDao.eventNextVal();
	}
	
	// 이벤트 등록/수정처리
	public void adminEventInU(Map<String, Object> map, HttpServletRequest request) throws Exception {
	
		// GoodsServiceImpl에서 차용해옴
		String img_templist = ""; // 이미지 링크를 ','를 기준으로 냐열해둠, 아직 사용 안함
		String img_thumb = ""; // img_list의 첫번째 경로를 저장함
		String comp_text = " src=\"/stu/file/"; // 반복문 안에 temp와 비교될 텍스느. equals(" src=\"")는 안되길래 따로 빼둠
		String content = (String)map.get("EVENT_CONTENT"); // 저장된 본문을 불러옴
		String type = (String)map.get("TYPE");
		int imgCount = 0;  // src="D:\sts4File\      " src=\"/nnS/file/";
		
		for(int i = 0; i+16 < content.length(); i++) { // 텍스트 비교
			String temp=""; // 잘라진 텍스트가 임시로 들어갈 공간
			temp = content.substring(i,i+16); // content에서 잘라낸 텍스트를 temp에 저장
			if(temp.equals(comp_text)) { // temp와 temp_text가 같을 경우
				img_templist += content.substring(i+16, i+52)+","; // img_list에 잘라진 텍스트 추가 및 구분을 위한 쉼표 삽입
				imgCount++;
			}
		}
		
		if(img_templist!="") { // img_list가 비어있지 않을 경우
			img_templist = img_templist.substring(0, img_templist.length()-1); // 경로 뒤에 남는 쉼표 제거
			img_thumb = img_templist.substring(0, 36); // 이미지가 있을 경우 첫번째 경로를 썸네일로 저장해줌
			map.put("EVENT_THUMBNAIL", img_thumb); // 썸네일 값 전달
		} else { // img_list가 비어이을 경우
			map.put("EVENT_THUMBNAIL",""); // 이미지 없음
		}
		// 내용에서 이미지 긁어오기 끝
		
		if ("insert".equals(type)) {
			adminEventDao.eventInsert(map);
		} else {
			adminEventDao.eventUpdate(map);
		}
	}

	// 메인 이벤트 리스트
	@Override
	public List<Map<String, Object>> common_eventList(Map<String, Object> map) throws Exception {
		//종료된 쿠폰이 등록된 경우 자동으로 비공개 처리하는 기능..
		adminEventDao.auto_update();
		return adminEventDao.common_eventList(map);
	}
	
	// 메인 이벤트 상세
	public List<Map<String, Object>> common_eventDetail(Map<String, Object> map) throws Exception {
		return adminEventDao.common_eventDetail(map);
	}
	
	
}
