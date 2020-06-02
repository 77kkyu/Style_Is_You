package stu.common.resolver;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import stu.common.common.CommandMap;



//전송된 데이터를 map에다 넣기위해 
//xml에 등록해야함 CustomMapArgumentResolver
public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver {

	//supportsParameter 컨트롤러의 파라미터가 Map(commandMap)클래스인지 검사
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}

	
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		//CommandMap을 가져와서 객체 선언을 했다
		CommandMap commandMap = new CommandMap();
		
		// Request로 Parameter값을 받아오고
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		// 받아온 Parameter에서 이름을 꺼내옴
		Enumeration<?> enumeration = request.getParameterNames(); 
		
		String key = null;
		String[] values = null;
		while(enumeration.hasMoreElements()){ // 반복문돌려서 key랑 values에 넣어줌
			key = (String) enumeration.nextElement(); // 이름과
			values = request.getParameterValues(key); // 이름에 해당하는 값
			if(values != null){ //commandMap에 차곡차고 넣고 values값이 null이면 [0]을 넣음
				commandMap.put(key, (values.length > 1) ? values:values[0] );
			}
		}
		return commandMap;
	}

}
