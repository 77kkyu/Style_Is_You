package stu.member.join;

import java.util.Map;


import org.springframework.stereotype.Repository;

import stu.member.dao.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO {
	
	// 회원가입
	public void insertMember(Map<String, Object> map) throws Exception {
		insert("join.insertMember", map);
	}

	
	
	
}
