package stu.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class AbstractDao {
	
	protected Log log = LogFactory.getLog(AbstractDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	protected void printQueryId(String queryId) {
		
		if(log.isDebugEnabled()) {
			log.debug("\t QueryId \t: " + queryId);
		}
		
	}
	
	public List<Map<String,Object>> goodsList(String queryId, Object params) { // 상품리스트 
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
	
	public List<Map<String,Object>> basketList(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
	

}
