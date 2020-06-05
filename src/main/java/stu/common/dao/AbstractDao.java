package stu.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

public class AbstractDao {
	
	protected Log log = LogFactory.getLog(AbstractDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	protected void printQueryId(String queryId) {
		
		if(log.isDebugEnabled()) {
			log.debug("\t QueryId \t: " + queryId);
		}
		
	}
	 
	@SuppressWarnings("unchecked")
	public Object selectPagingList(String queryId, Object params) {
		printQueryId(queryId);
		Map<String, Object> map = (Map<String, Object>)params;
		
		String strPageIndex = (String)map.get("PAGE_INDEX");
		String strPageRow = (String)map.get("PAGE_ROW");
		int nPageIndex=0;
		int nPageRow=15;
		
		if(StringUtils.isEmpty(strPageIndex) == false){
	        nPageIndex = Integer.parseInt(strPageIndex)-1;
	    }
	    if(StringUtils.isEmpty(strPageRow) == false){
	        nPageRow = Integer.parseInt(strPageRow);
	    }
	    map.put("START", (nPageIndex * nPageRow) + 1);
	    map.put("END", (nPageIndex * nPageRow) + nPageRow);
	    map.put("KEYWORD", (String)map.get("KEYWORD"));
	     
	    return sqlSession.selectList(queryId, map);
	}
	
	public List<Map<String,Object>> bestGoodsList(String queryId, Object params) { // 踰좎뒪�듃(議고쉶�닔) �긽�뭹
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
	
	public List<Map<String,Object>> newGoodsList(String queryId, Object params) { // 理쒓렐 �긽�뭹 
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}

	//장바구니 리스트
	public List<Map<String,Object>> selectList(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
	//수정
	public Object update(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.update(queryId,params);
	}
	//삭제
	public Object delete(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.delete(queryId,params);
	}
	/*
	 * public Object selectOne(String queryId, Object params) {
	 * printQueryId(queryId); return sqlSession.selectOne(queryId,params); }
	 */
	
	
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
		
		//adminDao
		public List<Map<String,Object>> dashBoard(String queryId, Object params) { // adminMain대쉬보드 
			printQueryId(queryId);
			return sqlSession.selectList(queryId,params);
		}	
		
		public List<Map<String,Object>> order_admin_a(String queryId, Object params) { // 주문/배송-신규주문 
			printQueryId(queryId);
			return sqlSession.selectList(queryId,params);
		}
		
		

		@SuppressWarnings("rawtypes")
		public List selectList(String queryId) {
			printQueryId(queryId);
			return sqlSession.selectList(queryId);
		}
		
		
		@SuppressWarnings("unchecked")
		public Object selectPagingList1(String queryId, Object params){
			printQueryId(queryId);
			Map<String,Object> map = (Map<String,Object>)params;
			
			String strPageIndex = (String)map.get("PAGE_INDEX");
			String strPageRow = (String)map.get("PAGE_ROW");
			int nPageIndex = 0;
			int nPageRow = 20;
			
			if(StringUtils.isEmpty(strPageIndex) == false){
				nPageIndex = Integer.parseInt(strPageIndex)-1;
			}
			if(StringUtils.isEmpty(strPageRow) == false){
				nPageRow = Integer.parseInt(strPageRow);
			}
			map.put("START", (nPageIndex * nPageRow) + 1);
			map.put("END", (nPageIndex * nPageRow) + nPageRow);
			
			return sqlSession.selectList(queryId, map);
		}
}
