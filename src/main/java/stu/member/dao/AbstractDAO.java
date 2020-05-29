package stu.member.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class AbstractDAO {
	
	protected Log log = LogFactory.getLog(AbstractDAO.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 콘솔 출력
	protected void printQueryId(String queryId) {
		if(log.isDebugEnabled()) {
			log.debug("\t QueryId \t : " + queryId);
		}
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
