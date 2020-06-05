package stu.member.my;

import java.util.List;
import java.util.Map;

import stu.common.common.CommandMap;

public interface MyService {
	
	List<Map<String, Object>> myDash(CommandMap commandMap) throws Exception; // Mypage대쉬보드
	
	
}
