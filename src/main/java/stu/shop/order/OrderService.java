package stu.shop.order;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import stu.common.common.CommandMap;

public interface OrderService {

	Map<String, Object> orderMemberInfo(CommandMap commandMap, HttpServletRequest request) throws Exception;

}