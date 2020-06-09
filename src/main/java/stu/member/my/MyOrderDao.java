package stu.member.my;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.common.CommandMap;
import stu.common.dao.AbstractDao;

@Repository("myOrderDao")
public class MyOrderDao extends AbstractDao {

	//마이페이지-주문리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myOrderList(CommandMap map) throws Exception { // myOderList
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>) myOrderList("my.my_order_list", map.getMap());
	}

	public void order_ok(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		order_ok("my.my_order_ok", map.getMap());
	}

}
