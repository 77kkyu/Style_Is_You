package stu.member.join;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


@Service("joinService")
public class JoinServiceImpl implements JoinService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;
	
	// 회원가입
	@Override
	public void insertMember(Map<String, Object> map) throws Exception {
		joinDAO.insertMember(map);
	}
	
	// 아이디 중복 체크
		@Override
		public int selectIdCheck(String MEMBER_ID) throws Exception {
			return joinDAO.selectIdCheck(MEMBER_ID);
		}


	
	
}
