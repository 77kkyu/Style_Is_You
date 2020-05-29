package stu.member.join;

import java.util.Map;


import org.springframework.stereotype.Repository;

import stu.common.dao.AbstractDao;

@Repository("joinDAO")
public class JoinDAO extends AbstractDao {
	
	// �쉶�썝媛��엯
	public void insertMember(Map<String, Object> map) throws Exception {
		insert("join.insertMember", map);
	}

	
	
	
}
