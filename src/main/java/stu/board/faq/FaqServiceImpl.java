package stu.board.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("faqService")
public class FaqServiceImpl implements FaqService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="faqDAO")
	private FaqDAO faqDAO;
	
	@Override
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception {
		return faqDAO.selectFaqList(map);
	}

	@Override
	public void insertFaq(Map<String, Object> map, HttpServletRequest request) throws Exception {
		faqDAO.insertFaq(map);		
	}

	@Override
	public Map<String, Object> selectFaqDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = faqDAO.selectFaqDetail(map);
		resultMap.put("map", tempMap);
		return resultMap;
	}

	@Override
	public void updateFaq(Map<String, Object> map, HttpServletRequest request) throws Exception{
		faqDAO.updateFaq(map);

	}

	@Override
	public void deleteFaq(Map<String, Object> map) throws Exception {
		faqDAO.deleteFaq(map);
	}

}
