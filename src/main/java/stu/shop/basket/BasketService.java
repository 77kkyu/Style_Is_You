package stu.shop.basket;

import java.util.List;
import java.util.Map;

import stu.common.common.CommandMap;

public interface BasketService {

	List<Map<String, Object>> basketList(CommandMap Map) throws Exception;

	void basketModify(CommandMap commandMap);

}
