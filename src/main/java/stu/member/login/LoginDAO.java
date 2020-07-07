package stu.member.login;

import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.dao.AbstractDao;

@Repository("loginDAO")
public class LoginDAO extends AbstractDao {
	
	// 이름 출력
		public Map<String, Object> selectName(Map<String, Object> map) throws Exception {
			return (Map<String, Object>)selectOne("login.selectName", map);
		}
		
	// 핸드폰으로 아이디 찾기
		public Map<String, Object> selectFindId(Map<String, Object> map) throws Exception {
			return (Map<String, Object>)selectOne("login.selectFindId", map);
		}
		
	// 비밀번호 초기화 전 아이디 얻기
		public String selectFindPw(Map<String, Object> map) throws Exception {
			return (String)selectOne("login.selectFindPw", map);
		}
	// 임시 비밀번호로 변경
		public void updatePw(Map<String, Object> map) throws Exception {
			update("login.updatePw", map);
		}
	// 이메일로 아이디 찾기
		public Map<String, Object> selectFindId2(Map<String, Object> map) throws Exception {
			return (Map<String, Object>)selectOne("login.selectFindId2", map);
		}
		
	// 이메일로 비밀번호 찾기
		public Map<String, Object> selectFindPw2(Map<String, Object> map) throws Exception {
			return (Map<String, Object>)selectOne("login.selectFindPw2", map);
		}
	
	// 마지막 로그인 갱신
		public void lastLogin(Object x) throws Exception {
			insert("login.lastLogin", x);
		}
	
		
	// 로그인 처리
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
