package stu.admin.main;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.dao.AbstractDao;

@Repository("adminDao")
public class AdminDao extends AbstractDao{
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> dashBoard(Map<String,Object> map) throws Exception { //adminMain대쉬보드 
		
		return (List<Map<String,Object>>) dashBoard("admin.dash_count",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> order_admin_a(Map<String,Object> map) throws Exception { //adminMain대쉬보드 
		
		return (List<Map<String,Object>>) order_admin_a("admin.order_admin_a",map);
	}

	
}
