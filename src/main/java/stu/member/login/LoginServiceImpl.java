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
	public Map<String, Object> selectName(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) loginDAO.selectName(map);
		
	}
	
	// 핸드폰으로 아이디 찾기
	@Override
	public Map<String, Object> selectFindId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) loginDAO.selectFindId(map);
		
	}
	
	// 비밀번호 초기화 전 아이디 얻기
	@Override
	public String selectFindPw(Map<String, Object> map) throws Exception {
		return loginDAO.selectFindPw(map);
	}
	
	// 임시비밀번호로 변경
	@Override
	public void updatePw(Map<String, Object> map) throws Exception {
		loginDAO.updatePw(map);
	}
	
	// 이메일로 아이디 찾기
	public Map<String, Object> selectFindId2(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) loginDAO.selectFindId2(map);
	}
	
	// 이메일로 비밀번호 찾기
	public Map<String, Object> selectFindPw2(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) loginDAO.selectFindPw2(map);
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
	
	// 마지막 로그인 갱신
	@Override
	public void lastLogin(Object x) throws Exception {
		loginDAO.lastLogin(x);
	}
	
	
	
	
	
	
	
	
}
