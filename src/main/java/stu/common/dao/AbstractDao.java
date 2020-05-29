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
	
	public List<Map<String,Object>> bestGoodsList(String queryId, Object params) { // 踰좎뒪�듃(議고쉶�닔) �긽�뭹
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
	
	public List<Map<String,Object>> newGoodsList(String queryId, Object params) { // 理쒓렐 �긽�뭹 
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}

	public List<Map<String,Object>> basketList(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
	
	// 특정 레코드 한줄 출력
		public Object selectOne(String queryId) {
			printQueryId(queryId);
			return sqlSession.selectOne(queryId);
		}
		
		// 특정 레코드 한줄 출력
		public Object selectOne(String queryId, Object params) {
			printQueryId(queryId);
			return sqlSession.selectOne(queryId, params);
		}
		
		// 레코드 추가
		public Object insert(String queryId, Object params) {
			printQueryId(queryId);
			return sqlSession.insert(queryId, params);
		}

}
