package stu.admin.event;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.dao.AbstractDao;

@Repository("adminEventDao")
public class AdminEventDao extends AbstractDao{

	// 관리자 이벤트 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> eventList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("event.eventList", map);
	}
	
	// 관리자 이벤트 상세
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> eventDetail(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("event.eventDetail", map);
	}
	
	// 관리자 이벤트 신규 등록시 오늘날짜, nextval 키 값
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> eventNextVal() throws Exception {
		return (List<Map<String, Object>>) selectList("event.eventNOnDay");
	}
	
	// 이벤트 등록처리
	@SuppressWarnings("unchecked")
	public void eventInsert(Map<String, Object> map) throws Exception {
		insert("event.eventInsert", map);
	}
	
	// 이벤트 수정 처리
	@SuppressWarnings("unchecked")
	public void eventUpdate(Map<String, Object> map) throws Exception {
		update("event.eventUpdate", map);
	}
	
	// 
	@SuppressWarnings("unchecked")
	public void auto_update() throws Exception {
		update("event.auto_update");
	}
	
	// 메인 이벤트 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> common_eventList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("event.common_eventList", map);
	}
	
	// 메인 이벤트 상세
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> common_eventDetail(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("event.common_eventDetail", map);
	}
	
}
