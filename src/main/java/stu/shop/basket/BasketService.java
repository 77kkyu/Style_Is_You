package stu.shop.basket;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import stu.common.common.CommandMap;


public interface BasketService {

	List<Map<String, Object>> basketList(Map<String, Object> commandMap) throws Exception;

	void basketModify(CommandMap commandMap, HttpServletRequest request) throws Exception;

	void basketDelete(CommandMap commandMap, HttpServletRequest request) throws Exception;

	void basketAllDelete(CommandMap commandMap, HttpServletRequest request) throws Exception;

	Map<String, Object> selectGoodsLike(CommandMap commandMap, HttpServletRequest request) throws Exception;

	void insertGoodsLike(CommandMap commandMap, HttpServletRequest request);

}
