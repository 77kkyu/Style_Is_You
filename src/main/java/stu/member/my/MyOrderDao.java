package stu.member.my;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.common.CommandMap;
import stu.common.dao.AbstractDao;

@Repository("myOrderDao")
public class MyOrderDao extends AbstractDao {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myOrderList(CommandMap commandMap) throws Exception { // myOderList
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>) myOrderList("my.my_order_list", commandMap);
	}

}
