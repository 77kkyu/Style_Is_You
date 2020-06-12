package stu.board.faq;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.dao.AbstractDao;

@Repository("faqDAO")
public class FaqDAO extends AbstractDao{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("faq.selectFaqList", map);
	}

	public void insertFaq(Map<String, Object> map) throws Exception{
		insert("faq.insertFaq", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFaqDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("faq.selectFaqDetail", map);
	}

	public void updateFaq(Map<String, Object> map) throws Exception{
		update("faq.updateFaq", map);
	}

	public void deleteFaq(Map<String, Object> map) throws Exception{
		update("faq.deleteFaq", map);
	}

}
