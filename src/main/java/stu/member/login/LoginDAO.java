package stu.member.login;

import java.util.Map;

import org.springframework.stereotype.Repository;

import stu.common.dao.AbstractDao;

@Repository("loginDAO")
public class LoginDAO extends AbstractDao {
	
	// 濡쒓렇�씤 �븳 �븘�씠�뵒 異쒕젰
		public void selectName(Map<String, Object> map) throws Exception {
			selectOne("login.selectName", map);
		}
		
	// �븘�씠�뵒 李얘린
		public void selectFindId(Map<String, Object> map) throws Exception {
			selectOne("login.selectFindId", map);
		}
		
	// 鍮꾨�踰덊샇 李얘린
		public void selectFindPw(Map<String, Object> map) throws Exception {
			selectOne("login.selectFindPw", map);
		}
		
	// 濡쒓렇�씤
		@SuppressWarnings("unchecked")
		public Map<String, Object> loginAction(Map<String, Object> map) throws Exception {
			return (Map<String, Object>)selectOne("login.loginAction", map);
		}
		
	// 濡쒓렇�븘�썐
		@SuppressWarnings("unchecked")
		public Map<String, Object> logout(Map<String, Object> map) throws Exception {
			return (Map<String, Object>)selectOne("login.logout", map);
		}
		
		
	
}
