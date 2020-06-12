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
	@SuppressWarnings("unchecked")
	public Map<String,Object> memberModify(Map<String, Object> map) throws Exception {
		return (Map<String,Object>) selectOne("my.memberModify",map);
	}
	
	public void memberModifyAction(Map<String, Object> map) throws Exception {
		update("my.memberModifyAction", map);
	}
	
	public void memberDelete(Map<String, Object> map) throws Exception {
		update("my.memberDelete", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> myDash(CommandMap map) throws Exception { //adminMain대쉬보드 
		return (List<Map<String,Object>>) myDash("my.my_side",map);
	}

}
