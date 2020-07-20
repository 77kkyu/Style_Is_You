package stu.member.my;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.common.CommandMap;
import stu.common.dao.AbstractDao;


@Repository("myDAO")
public class myDAO extends AbstractDao {
	
	// 구매 목록
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> orderList(Map<String,Object> map) { //  
		return (List<Map<String,Object>>) orderList("my.selectOrderList",map);
	}
	// 상품명, 상품속성번호
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> orderList2(Map<String,Object> map) { //  
		return (List<Map<String,Object>>) orderList("my.selectOrderList2",map);
	}
	// 회원 정보 수정
	public String pwdCheck(Map<String, Object> map, String id) throws Exception{
		return (String) selectOne("my.pwdCheck", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> memberModify(String id) throws Exception {
		return (Map<String,Object>) selectOne("my.memberModify",id);
	}
	
	public void memberModifyAction(Map<String, Object> map) throws Exception {
		update("my.memberModifyAction", map);
	}
	
	public void memberDelete(Map<String, Object> map) throws Exception {
		update("my.memberDelete", map);
	}
	

	public List<Map<String, Object>> myPointList(CommandMap commandMap) {
		return (List<Map<String,Object>>) selectList("my.myPointList",commandMap.getMap());
	}
	public List<Map<String, Object>> myCouponList(CommandMap commandMap) {
		return (List<Map<String,Object>>) selectList("my.myCouponList",commandMap.getMap());
	}
	public List<Map<String, Object>> myLikeList(CommandMap commandMap) {
		return (List<Map<String,Object>>) selectList("my.myLikeList",commandMap.getMap());
	}
	public void goodsLikeDelete(CommandMap commandMap) {
		delete("goods.deleteGoodsLike", commandMap.getMap());
	}

	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> myDash(CommandMap map) throws Exception { //adminMain대쉬보드 
		return (List<Map<String,Object>>) myDash("my.my_side",map);
	}
	
	public List<Map<String, Object>> myQnaList(CommandMap commandMap) {
		return (List<Map<String,Object>>) selectList("my.myGoodsQnaList",commandMap.getMap());
	}
	
	public List<Map<String, Object>> myReviewList(CommandMap commandMap) {
		return (List<Map<String,Object>>) selectList("my.myReviewList",commandMap.getMap());
	}


}
