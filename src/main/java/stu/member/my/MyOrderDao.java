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
	@SuppressWarnings("unchecked")
	public void order_ok(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		order_ok("my.my_order_ok", map.getMap());
	}
	@SuppressWarnings("unchecked")
	public void list_cancle(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		list_cancle("my.my_list_cancle", map.getMap());
	}
	@SuppressWarnings("unchecked")	
	public void detail_cancle(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		detail_cancle("my.my_detail_cancle", map.getMap());
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list_point_search(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) list_point_search("my.list_point_search", map.getMap());
	}
	@SuppressWarnings("unchecked")
	public void use_point_reset(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		use_point_reset("my.use_point_reset", map.getMap());
	}
	@SuppressWarnings("unchecked")
	public void save_point_reset(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		save_point_reset("my.save_point_reset", map.getMap());
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> list_stock_search(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>) list_stock_search("my.list_stock_search", map.getMap());
	}
	public void list_stock_reset(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		list_stock_reset("my.list_stock_reset", map.getMap());
	}
	public List<Map<String, Object>> changeForm_a(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>) changeForm_a("my.changeForm_a", map.getMap());
	}
	public List<Map<String, Object>> changeForm_b(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>) changeForm_b("my.changeForm_b", map.getMap());
	}
	public String pwd_chk(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		return (String) pwd_chk("my.pwd_chk",  map.getMap());
	}
	public void order_change(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		order_change("my.order_change",  map.getMap());
	}
	public List<Map<String, Object>> myAsList(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>) myAsList("my.myAsList", map.getMap());
	}

}
