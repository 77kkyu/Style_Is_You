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
	//수정2
	public Object update(String queryId) {
		printQueryId(queryId);
		return sqlSession.update(queryId);
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
	      
	      public List<Map<String,Object>> order_state(String queryId, Object params) { // 주문상태 변경 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params);
	      }
	      
	      public List<Map<String,Object>> order_state_ex(String queryId, Object params) { // 주문상태.배송 변경 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params);
	      }
	      
	      public List<Map<String,Object>> order_detail(String queryId, Object params) { // 주문/배송 상세보기 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params);
	      }
	      
	      public List<Map<String,Object>> order_detail_sub(String queryId, Object params) { // 주문/배송 상세보기 상품 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params);
	      }
	      public List<Map<String,Object>> as_admin_list(String queryId, Object params) { // 교환.환불.AS - 정보가져옴 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params);
	      }
	      public void as_cancle_a(String queryId, Object params) { // as요청취소 - as_list state=3 edate갱싱 
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      public void order_list_cancle(String queryId, Object params) { // as요청취소 - order_list 원상복구 
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      public void as_ok_state(String queryId, Object params) { // 신규 as요청확인(AS_LIST state 확인중으로 변경) 
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      public void as_ok_orderState(String queryId, Object params) { // 신규 as요청확인(Order_LIST STATE변경) 
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      public List<Map<String,Object>> change_form_a(String queryId, Object params) { // AS_list에서 정보 가져옴  전부다 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params); // 한줄데이터는 object로 가져올것
	      }
	      public List<Map<String,Object>> change_form_b(String queryId, Object params) { // AS_list에서 정보 가져옴  전부다 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params); // 한줄데이터는 object로 가져올것
	      }
	      public List<Map<String,Object>> selectMemberList(String queryId, Object params) { // 회원목록/관리에서 회원리스트 가져옴
	    	  printQueryId(queryId);
	    	  return sqlSession.selectList(queryId,params);
	      }
	      public void change_detail_insert(String queryId, Object params) { // 
	         printQueryId(queryId);
	         sqlSession.insert(queryId,params);
	      }
	      public void change_detail_state(String queryId, Object params) { //  
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      public void change_goods_att_plus(String queryId, Object params) { //  
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      public void change_goods_att_minus(String queryId, Object params) { //  
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      public void as_final_state(String queryId, Object params) { //  
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      public void change_final_orderState(String queryId, Object params) { //  
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      public void order_list_chagam(String queryId, Object params) { //  
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      public void point_chagam(String queryId, Object params) { // 
	         printQueryId(queryId);
	         sqlSession.insert(queryId,params);
	      }
	      public List<Map<String,Object>> point_total(String queryId, Object params) { // AS_list에서 정보 가져옴  전부다 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params); // 한줄데이터는 object로 가져올것
	      }
	      public void cashback_final_orderState(String queryId, Object params) { //  
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      
	      
	      
	      
	    //myDao
	      public List<Map<String,Object>> myDash(String queryId, Object params) { // mypage대쉬보드 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params);
	      }
	      
	      public List<Map<String,Object>> myOrderList(String queryId, Object params) { // myOrderList 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params);
	      }
	      
	      public List<Map<String,Object>> order_ok(String queryId, Object params) { // 마이페이지 수취확인 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params);
	      }

	      public void list_cancle(String queryId, Object params) { // 주문취소 -주문상태 변경 
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      public void detail_cancle(String queryId, Object params) { // 주문취소 -주문디테일 변경 
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      public List<Map<String,Object>> list_point_search(String queryId, Object params) { // 주문취소 -사용포인트값 가져오기 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params);
	      }
	      public void use_point_reset(String queryId, Object params) { // 주문취소 - 사용포인트 복구
	         printQueryId(queryId);
	         sqlSession.insert(queryId,params);
	      }
	      public void save_point_reset(String queryId, Object params) { // 주문취소 -적립포인트 취소 
	         printQueryId(queryId);
	         sqlSession.insert(queryId,params);
	      }
	      public List<Map<String,Object>> list_stock_search(String queryId, Object params) { // 주문취소 - 오더리스트에서 상품속성,수량 가져옴 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params);
	      }
	      public void list_stock_reset(String queryId, Object params) { // 주문취소 - 상품속성에서 재고 수정 
	         printQueryId(queryId);
	         sqlSession.update(queryId,params);
	      }
	      public List<Map<String,Object>> changeForm_a(String queryId, Object params) { // 교환.환불.AS - 정보가져옴 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params);
	      }
	      public List<Map<String,Object>> changeForm_b(String queryId, Object params) { // 교환.환불.AS - 디테일정보가져옴 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params);
	      }
	      public String pwd_chk(String queryId, Object params) { // 패스워드 꺼내옴
	         printQueryId(queryId);
	         return sqlSession.selectOne(queryId,params);
	      }
	      public void order_change(String queryId, Object params) { // 패스워드 꺼내옴
	         printQueryId(queryId);
	        sqlSession.insert(queryId,params);
	      }
	      public List<Map<String,Object>> myAsList(String queryId, Object params) { // 마이페이지 - AS요청 리스트 
	         printQueryId(queryId);
	         return sqlSession.selectList(queryId,params);
	      }

	      
	      
	      
	      
	      
		// 마이 페이지 (메인)
		public List<Map<String,Object>> orderList(String queryId, Object params) { //  
			printQueryId(queryId);
			return sqlSession.selectList(queryId,params);
		}
		
		// 상품명, 상품속성번호
		public List<Map<String,Object>> orderList2(String queryId, Object params) { //  
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
