package stu.board.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaDAO")
	private QnaDAO qnaDAO;
	
	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		return qnaDAO.selectQnaList(map);
	}

	@Override
	public void insertQna(Map<String, Object> map, HttpServletRequest request) throws Exception {
		qnaDAO.insertQna(map);
	}

	@Override
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = qnaDAO.selectQnaDetail(map);
		tempMap.put("RNUM", map.get("RNUM"));
		resultMap.put("map", tempMap);		
		return resultMap;
	}

	@Override
	public void updateQna(Map<String, Object> map, HttpServletRequest request) throws Exception{
		qnaDAO.updateQna(map);
			}

	@Override
	public void deleteQna(Map<String, Object> map) throws Exception {
		qnaDAO.deleteQna(map);
	}
	
	@Override
	public Map<String, Object> selectQnaPassword(Map<String, Object> map) throws Exception {
		return qnaDAO.selectQnaPassword(map);
	}
	
}
