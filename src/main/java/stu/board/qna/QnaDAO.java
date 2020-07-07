package stu.board.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.dao.AbstractDao;

@Repository("qnaDAO")
public class QnaDAO extends AbstractDao{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("qna.selectQnaList", map);
	}

	public void insertQna(Map<String, Object> map) throws Exception{
		insert("qna.insertQna", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("qna.selectQnaDetail", map);
	}

	public void updateQna(Map<String, Object> map) throws Exception{
		update("qna.updateQna", map);
	}

	public void deleteQna(Map<String, Object> map) throws Exception{
		update("qna.deleteQna", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQnaPassword(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("qna.selectQnaPassword", map);
	}

}
