package stu.board.qna;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface QnaService {

	List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception;

	void insertQna(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception;

	void updateQna(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteQna(Map<String, Object> map) throws Exception;

	Map<String, Object> selectQnaPassword(Map<String, Object> map) throws Exception;

}
