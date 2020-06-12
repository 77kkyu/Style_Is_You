package stu.board.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeDAO")
	private NoticeDAO noticeDAO;
	
	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		return noticeDAO.selectNoticeList(map);
	}

	@Override
	public void insertNotice(Map<String, Object> map, HttpServletRequest request) throws Exception {
		noticeDAO.insertNotice(map);
	}

	@Override
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = noticeDAO.selectNoticeDetail(map);
		resultMap.put("map", tempMap);		
		return resultMap;
	}

	@Override
	public void updateNotice(Map<String, Object> map, HttpServletRequest request) throws Exception{
		noticeDAO.updateNotice(map);
			}

	@Override
	public void deleteNotice(Map<String, Object> map) throws Exception {
		noticeDAO.deleteNotice(map);
	}

}
