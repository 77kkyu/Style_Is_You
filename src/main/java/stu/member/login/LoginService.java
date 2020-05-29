package stu.member.login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface LoginService {
	
	void selectName(Map<String, Object> map) throws Exception;
	
	void selectFindId(Map<String, Object> map) throws Exception;
	
	void selectFindPw(Map<String, Object> map) throws Exception;
	
	Map<String, Object> logout(Map<String, Object> map) throws Exception;
	
	Map<String, Object> loginAction(Map<String, Object> map) throws Exception;
}
