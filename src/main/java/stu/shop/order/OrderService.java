package stu.shop.order;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import stu.common.common.CommandMap;

public interface OrderService {

	Map<String, Object> orderMemberInfo(CommandMap commandMap, HttpServletRequest request) throws Exception;

	List<Map<String, Object>> memberCoupon(CommandMap commandMap) throws Exception;

	void insertOrder(CommandMap commandMap, HttpServletRequest request) throws Exception;

	Map<String, Object> selectOrder(CommandMap commandMap, HttpServletRequest request) throws Exception;

	void orderModify(CommandMap commandMap, HttpServletRequest request) throws Exception;

	void updateMember(CommandMap commandMap, HttpServletRequest request) throws Exception;

	


}