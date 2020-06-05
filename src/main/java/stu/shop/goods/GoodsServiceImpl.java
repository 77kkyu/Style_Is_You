package stu.shop.goods;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import stu.common.util.FileUtils;


@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	
	Logger log = Logger.getLogger(this.getClass()); // 로그
	
	@Resource(name="goodsDao") 
	private GoodsDao goodsDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<Map<String, Object>> newGoodsList(Map<String, Object> map) throws Exception { // 새상품 
		
		return goodsDao.newGoodsList(map);
	}

	@Override
	public List<Map<String, Object>> bestGoodsList(Map<String, Object> map) throws Exception { // best 상품
		
		return goodsDao.bestGoodsList(map);
	}

	@Override
	public List<Map<String, Object>> cateGoodsList(Map<String, Object> map, String keyword) throws Exception { // 카테고리별 상품
		map.put("keyword", keyword);
		return goodsDao.cateGoodsList(map);
	}

	@Override
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map) throws Exception {
		
		goodsDao.goodsHitCnt(map);
		Map<String, Object> resultMap = goodsDao.selectGoodsDetail(map);

		return resultMap;
	}

	@Override
	public void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
				// 내용에서 이미지 긁어오기 시작
				String img_templist=""; // 이미지 링크를 ','를 기준으로 냐열해둠, 아직 사용 안함
				String img_list[] = {}; // ','로 구분된 문자열을 나눠서 배열에 담음
				String img_thumb=""; // img_list의 첫번째 경로를 저장함
				String comp_text=" src=\"/stu/file/"; // 반복문 안에 temp와 비교될 텍스느. equals(" src=\"")는 안되길래 따로 빼둠
				String content = (String)map.get("GOODS_CONTENT"); // 저장된 본문을 불러옴
				int imgCount = 0;
				for(int i = 0; i+16 < content.length(); i++) { // 텍스트 비교
					String temp=""; // 잘라진 텍스트가 임시로 들어갈 공간
					temp = content.substring(i,i+16); // content에서 잘라낸 텍스트를 temp에 저장
					if(temp.equals(comp_text)) { // temp와 temp_text가 같을 경우
						img_templist += content.substring(i+16, i+52)+","; // img_list에 잘라진 텍스트 추가 및 구분을 위한 쉼표 삽입
						imgCount++;
					}
				}
				if(img_templist!="") { // img_list가 비어있지 않을 경우			
					img_templist = img_templist.substring(0, img_templist.length()-1); // 경로 뒤에 남는 쉼표 제거
					img_thumb = img_templist.substring(0, 36); // 이미지가 있을 경우 첫번째 경로를 썸네일로 저장해줌
					map.put("GOODS_THUMBNAIL", img_thumb); // 썸네일 값 전달
				} else { // img_list가 비어이을 경우
					map.put("GOODS_THUMBNAIL",""); // 이미지 없음
				}
				// 내용에서 이미지 긁어오기 끝
				
				// 상품정보 등록 쿼리 실행
				goodsDao.insertGoods(map);
				System.out.println("****12132* " + map);
				
				// 상품 등록 시 IDX 값을 받아 이미지 테이블에 값들을 담아줌
				if(img_templist!="") { // img_list가 비어있지 않을 경우			
					img_list = img_templist.split(",");
					for(int i = 0 ; i<imgCount; i++) {
						map.put("FILES_STD", img_list[i]);
						System.out.println((i+1)+"번째업로드 ==========================================");
						goodsDao.insertFile(map); 
						System.out.println((i+1)+"번째업로드끝=========================================");
					}
				}
				goodsDao.goodsAttribute(map);
		
	}

	@Override
	public void updateGoods(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		
	}





}
