package stu.common.common;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

//request에 담겨있는 파라미터를 Map에 담아주는 역할을 하는 클래스
public class CommandMap { 
	//javaBean을 안만들어도 됨 
	//CommandMap 단점은 벨리데이터로 유효성체크를 못함
	
	Map<String,Object> map = new HashMap<String,Object>();
	
	public Object get(String key) {
		return map.get(key);
	}
	
	public void put(String key, Object value) {
		map.put(key, value);
	}
	
	public Object remove(String key) {
		return map.remove(key);
	}
	
	public boolean containsKey(String key) {
		return map.containsKey(key);
	}
	
	public boolean containsValue(Object value) {
		return map.containsValue(value);
	}
	
	public void clear() {
		map.clear();
	}
	
	public Set<Entry<String, Object>> entrySet() {
		return map.entrySet();
	}
	
	public boolean isEmpty() {
		return map.isEmpty();
	}
	
	public void putAll(Map<? extends String, ?extends Object> m) {
		map.putAll(m);
	}
	
	public Map<String,Object> getMap() {
		return map;
	}

	
	
}
