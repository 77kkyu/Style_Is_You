package stu.member.login;

import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {
	
	// 로그인 한 아이디 출력
		public void selectName(Map<String, Object> map) throws Exception {
			selectOne("login.selectName", map);
		}
		
	// 아이디 찾기
		public void selectFindId(Map<String, Object> map) throws Exception {
			selectOne("login.selectFindId", map);
		}
		
	// 비밀번호 찾기
		public void selectFindPw(Map<String, Object> map) throws Exception {
			selectOne("login.selectFindPw", map);
		}
		
	// 로그인
		@SuppressWarnings("unchecked")
		public Map<String, Object> loginAction(Map<String, Object> map) throws Exception {
			return (Map<String, Object>)selectOne("login.loginAction", map);
		}
		
	// 로그아웃
		@SuppressWarnings("unchecked")
		public Map<String, Object> logout(Map<String, Object> map) throws Exception {
			return (Map<String, Object>)selectOne("login.logout", map);
		}
		
		
	
}
