package stu.board.notice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface NoticeService {

	List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception;

	void insertNotice(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception;

	void updateNotice(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteNotice(Map<String, Object> map) throws Exception;

}
