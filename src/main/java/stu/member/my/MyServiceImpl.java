package stu.member.my;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import stu.common.common.CommandMap;

@Service("myService")
public class MyServiceImpl implements MyService {
	
	Logger log = Logger.getLogger(this.getClass()); // 로그
	
	@Resource(name="myDao")
	private MyDao myDao;

	@Override
	public List<Map<String, Object>> myDash(CommandMap map) throws Exception {
		// TODO Auto-generated method stub
		return myDao.myDash(map);		
	}	



}
