package stu.common.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Component("fileUtils")
public class FileUtils {
	
	private static final String filePath = "D:\\sts4File\\";
	
	public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map,
			HttpServletRequest request) throws Exception {
		
		// MultipartHttpServletRequest로 변형
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request; 
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); // 파일 이름 가져오기
		
		MultipartFile multipartFile = null;
		String UPLOAD_ORIGIN_NAME = null;
		String originalFileExtension = null;
		String UPLOAD_SAVE_NAME = null;
		
		// 클라이언트에서 전송된 파일 정보를 담아서 반환을 해줄 list이다
		// 여태까지 단 하나의 파일만 전송을 하였지만,
		// 다중파일전송을 하도록 수정할 계획이기 때문에 구성
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();//리스트 객체 생성
		Map<String,Object> listMap = null; //맵선언
		
		// ServiceImpl 영역에서 전달해준 map에서 신규 생성되는 게시글의 번호를
		// 받아오도록 하였다
		String GOODS_NO = (String)map.get("GOODS_NO"); //IDX 값 가져오기
		String requestName = null;
		String UPLOAD_NO = null;
		
//		File file = new File(filePath);
//		if(file.exists() == false) {//경로에 파일이 없으면 
//			file.mkdirs(); // 파일을 생성
//		}
		
		while(iterator.hasNext()) {//파일이 있나 확인
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());//파일가져오기
			
			if(multipartFile.isEmpty() == false) {// 파일이 존재하면
				UPLOAD_ORIGIN_NAME = multipartFile.getOriginalFilename(); //진짜 파일 이름
				
				// originalFileExtension = 진짜 파일이름에서 .을 포함한 뒤의 이름을 가져온다(즉 확장자 ex; .jpg, .png)
				originalFileExtension = UPLOAD_ORIGIN_NAME.substring(UPLOAD_ORIGIN_NAME.lastIndexOf("."));
				// 그리고 .앞에 랜덤으로 32자 문자를 넣어줌 즉 원본파일의 실제 이름을 바꿔버림
				UPLOAD_SAVE_NAME = CommonUtils.getRandomString() + originalFileExtension;
				
				multipartFile.transferTo(new File(filePath + UPLOAD_SAVE_NAME)); // 지정경로에 파일 생성!
				
				listMap = new HashMap<String,Object>(); //맵선언후 파일정보를 다 넣어줌
				listMap.put("IS_NEW", "Y");
				listMap.put("GOODS_NO", GOODS_NO); //게시글 
				listMap.put("UPLOAD_ORIGIN_NAME", UPLOAD_ORIGIN_NAME);//파일의 진짜이름
				listMap.put("UPLOAD_SAVE_NAME", UPLOAD_SAVE_NAME); // 파일의 변경된 이름
				listMap.put("UPLOAD_SIZE", multipartFile.getSize()); // 파일 크기
				
				list.add(listMap); //해쉬맵을 리스트에 저장
			}else {
				requestName = multipartFile.getName();
				UPLOAD_NO = "IDX_" + requestName.substring(requestName.indexOf("_")+1);
				if(map.containsKey(UPLOAD_NO) == true && map.get(UPLOAD_NO) != null) {
					listMap = new HashMap<String,Object>(); 
					listMap.put("IS_NEW", "N");
					listMap.put("FILE_IDX", map.get(UPLOAD_NO));
					
					list.add(listMap);
				}
			}
		}
			return list;	
	}
	

	
	/*
	 * Map<String,Object> upload1(Map<String,Object> map,MultipartHttpServletRequest
	 * request) throws Exception {
	 * 
	 * String uploadPath = "D:\\sts4File\\"; String fileOriginName = ""; String
	 * fileMultiName = ""; for(int i=0; i<GOODS_IMG.length; i++) { fileOriginName =
	 * GOODS_IMG[i].getOriginalFilename(); SimpleDateFormat formatter = new
	 * SimpleDateFormat("YYYYMMDD_HHMMSS_" + i); Calendar now =
	 * Calendar.getInstance();
	 * 
	 * String extension = fileOriginName.split("\\.")[1];
	 * 
	 * fileOriginName = formatter.format(now.getTime())+"."+extension;
	 * 
	 * File f = new File(uploadPath+"\\"+fileOriginName);
	 * GOODS_IMG[i].transferTo(f); if(i==0) { fileMultiName += fileOriginName; }else
	 * { fileMultiName += ","+fileOriginName; } }
	 * 
	 * 
	 * return map;
	 * 
	 * }
	 */
}
