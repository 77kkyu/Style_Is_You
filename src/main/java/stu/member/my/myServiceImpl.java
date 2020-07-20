package stu.member.my;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import stu.common.common.CommandMap;


@Service("myService")
public class myServiceImpl implements myService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myDAO")
	private myDAO myDAO;
	
	// 구매 목록
	@Override
	public List<Map<String, Object>> orderList(Map<String, Object> map) throws Exception {
		return myDAO.orderList(map);
	}
	
	// 상품명, 상품속성번호 출력
	@Override
	public List<Map<String, Object>> orderList2(Map<String, Object> map) throws Exception {
		return myDAO.orderList2(map);
	}
	
	@Override
	public String pwdCheck(Map<String, Object> map, String id) throws Exception {
		return myDAO.pwdCheck(map, id);
	}

	@Override
	public Map<String, Object> memberModify(String id) throws Exception {
		return myDAO.memberModify(id);
	}
	@Override
	public void memberModifyAction(Map<String, Object> map) throws Exception {
		myDAO.memberModifyAction(map);
	}
	
	@Override
	public void memberDelete(Map<String, Object> map) throws Exception {
		myDAO.memberDelete(map);
	}

	@Override
	public List<Map<String, Object>> myPointList(CommandMap commandMap) throws Exception {
		return myDAO.myPointList(commandMap);
	}

	@Override
	public List<Map<String, Object>> myCouponList(CommandMap commandMap) throws Exception {
		return myDAO.myCouponList(commandMap);
	}

	@Override
	public List<Map<String, Object>> myLikeList(CommandMap commandMap) throws Exception {
		return myDAO.myLikeList(commandMap);
	}

	@Override
	public void goodsLikeDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		myDAO.goodsLikeDelete(commandMap);
		
	}
	
	@Override
	public List<Map<String, Object>> myDash(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		return myDAO.myDash(map);		
	}

	@Override
	public List<Map<String, Object>> myGoodsQnaList(CommandMap commandMap) throws Exception {
		return myDAO.myQnaList(commandMap);
	}

	@Override
	public List<Map<String, Object>> myReviewList(CommandMap commandMap) {
		return myDAO.myReviewList(commandMap);
	}
	
	
	
	
	
}
