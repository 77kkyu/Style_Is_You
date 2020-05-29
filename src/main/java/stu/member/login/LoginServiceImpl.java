package stu.member.login;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	// 로그인한 사람의 이름 값 출력
	@Override
	public void selectName(Map<String, Object> map) throws Exception {
		loginDAO.selectName(map);
		
	}
	
	// 아이디 찾기
	@Override
	public void selectFindId(Map<String, Object> map) throws Exception {
		loginDAO.selectFindId(map);
		
	}
	
	// 비밀번호 찾기
	@Override
	public void selectFindPw(Map<String, Object> map) throws Exception {
		loginDAO.selectFindPw(map);
		
	}
	
	// 로그인 시 입력한 아이디와 비밀번호
	@Override
	public Map<String, Object> loginAction(Map<String, Object> map) throws Exception {
		return loginDAO.loginAction(map);
	}
	
	// 로그아웃
	@Override
	public Map<String, Object> logout(Map<String, Object> map) throws Exception {
		return loginDAO.logout(map);
	}
	
	
	
	
	
	
}
