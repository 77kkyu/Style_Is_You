package stu.member.my;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.common.CommandMap;
import stu.common.dao.AbstractDao;

@Repository("myDao")
public class MyDao extends AbstractDao{ 
	// 로그값을 받기 위해 AbstractDao를 상속한다 AbstractDao에서 MyBatis와 로그, 커넥션을 가져와 처리한다
	// 굳이 따로 빼서 처리가 필요없다면 adminDao에서 커넥션을 받아와 바로 처리한다
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> myDash(CommandMap map) throws Exception { //adminMain대쉬보드 
		
		return (List<Map<String,Object>>) myDash("my.my_side",map);
	}
	
	
	
}