package stu.member.join;

import java.util.Map;


public interface JoinService {
	// 회원가입
	void insertMember(Map<String, Object> map) throws Exception;
	

}
