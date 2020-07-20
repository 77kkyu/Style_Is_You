package stu.admin.event;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminEventService {

	// 관리자 이벤트 리스트
	List<Map<String, Object>> eventList(Map<String, Object> map) throws Exception;
	
	// 관리자 이벤트 상세
	List<Map<String, Object>> eventDetail(Map<String, Object> map) throws Exception;
	
	// 관리자 이벤트 신규 등록시 오늘날짜, nextval 키 값
	List<Map<String, Object>> eventNextVal() throws Exception;
	
	// 이벤트 등록/수정처리
	void adminEventInU(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	// 메인 이벤트 리스트
	List<Map<String, Object>> common_eventList(Map<String, Object> map) throws Exception;
	
	// 메인 이벤트 상세
	List<Map<String, Object>> common_eventDetail(Map<String, Object> map) throws Exception;
	
}
