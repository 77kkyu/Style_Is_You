package stu.shop.goods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import stu.common.common.CommandMap;
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
	public List<Map<String, Object>> mainSearch(Map<String, Object> map, String keyword) throws Exception { // 메인 검색
		map.put("keyword", keyword);
		return goodsDao.mainSearch(map);
	}

	@Override
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map, HttpServletRequest request) throws Exception {
		System.out.println("map1111111="+map.get("IDX"));
		if(map.get("IDX").getClass().getName().equals("java.lang.String")){ 
			Map<String,Object> map1 = new HashMap<String,Object>();
			map1.put("IDX", map.get("IDX"));
			goodsDao.goodsHitCnt(map1);
		}else {
			String[] Goods_No = (String[])map.get("IDX");
			map.put("IDX", Goods_No[0]);
			goodsDao.goodsHitCnt(map);
		}
		
		//goodsDao.goodsHitCnt(map);
		System.out.println("map="+map);
		Map<String, Object> resultMap = goodsDao.selectGoodsDetail(map);

		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectGoodsAtt(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = goodsDao.selectGoodsAtt(map);
		
		return resultMap;
	}

	@Override
	public void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
				// 내용에서 이미지 긁어오기 시작
				String img_templist=""; // 이미지 링크를 ','를 기준으로 냐열해둠, 아직 사용 안함
				String img_list[] = {}; // ','로 구분된 문자열을 나눠서 배열에 담음
				String img_thumb=""; // img_list의 첫번째 경로를 저장함
				String comp_text=" src=\"/stu/file/"; // 반복문 안에 temp와 비교될 텍스느. equals(" src=\"")는 안되길래 따로 빼둠
				System.out.println("comp_text="+comp_text);
				String content = (String)map.get("GOODS_CONTENT"); // 저장된 본문을 불러옴
				int imgCount = 0;  // src="D:\sts4File\      " src=\"/nnS/file/";
				for(int i = 0; i+16 < content.length(); i++) { // 텍스트 비교
					String temp=""; // 잘라진 텍스트가 임시로 들어갈 공간
					
					temp = content.substring(i,i+16); // content에서 잘라낸 텍스트를 temp에 저장
					if(temp.equals(comp_text)) { // temp와 temp_text가 같을 경우
						img_templist += content.substring(i+16, i+52)+","; // img_list에 잘라진 텍스트 추가 및 구분을 위한 쉼표 삽입
						System.out.println("img_templist = " + img_templist);
						imgCount++;
					}
					System.out.println("temp =" + temp);
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
						map.put("UPLOAD_SAVE_NAME", img_list[i]);
						System.out.println((i+1)+"번째업로드 ==========================================");
						goodsDao.insertFile(map); 
						System.out.println((i+1)+"번째업로드끝=========================================");
					}
				}
				
				map.get("GOODS_ATT_SIZE");
				map.get("GOODS_ATT_COLOR");
				System.out.println("선택한 컬러="+map.get("GOODS_ATT_COLOR"));
				System.out.println("선택한 사이즈="+map.get("GOODS_ATT_SIZE"));
				
				String Size = map.get("GOODS_ATT_SIZE").toString();
				String Color = map.get("GOODS_ATT_COLOR").toString();
				String ColorList[] = Color.split(",");
				String SizeList[] = Size.split(",");
				System.out.println(ColorList.length);
				
				for(int i=0; i <=ColorList.length-1; i++) {
					for(int j=0; j<=SizeList.length-1; j++) {
						System.out.println("배열입니당="+ColorList[i]+","+SizeList[j]);
						map.put("GOODS_ATT_SIZE", SizeList[j]);
						map.put("GOODS_ATT_COLOR", ColorList[i]);
						goodsDao.goodsAttribute(map);
						
					}
				}
				
				System.out.println("옵션값="+map);
				
				
				
		
	}

	@Override
	public void updateGoods(Map<String, Object> map, HttpServletRequest request) throws Exception {
		goodsDao.updateGoods(map);
		goodsDao.attributeDelete(map);
		goodsDao.deleteFile(map);
		// 내용에서 이미지 긁어오기 시작
		String img_templist=""; // 이미지 링크를 ','를 기준으로 냐열해둠, 아직 사용 안함
		String img_list[] = {}; // ','로 구분된 문자열을 나눠서 배열에 담음
		String img_thumb=""; // img_list의 첫번째 경로를 저장함
		String comp_text=" src=\"/stu/file/"; // 반복문 안에 temp와 비교될 텍스느. equals(" src=\"")는 안되길래 따로 빼둠
		System.out.println("comp_text="+comp_text);
		String content = (String)map.get("GOODS_CONTENT"); // 저장된 본문을 불러옴
		int imgCount = 0;  // src="D:\sts4File\      " src=\"/nnS/file/";
		for(int i = 0; i+16 < content.length(); i++) { // 텍스트 비교
			String temp=""; // 잘라진 텍스트가 임시로 들어갈 공간
			
			temp = content.substring(i,i+16); // content에서 잘라낸 텍스트를 temp에 저장
			if(temp.equals(comp_text)) { // temp와 temp_text가 같을 경우
				img_templist += content.substring(i+16, i+52)+","; // img_list에 잘라진 텍스트 추가 및 구분을 위한 쉼표 삽입
				System.out.println("img_templist = " + img_templist);
				imgCount++;
			}
			System.out.println("temp =" + temp);
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
		goodsDao.updateGoodsThumbnail(map);
		System.out.println("****12132* " + map);
		
		// 상품 등록 시 IDX 값을 받아 이미지 테이블에 값들을 담아줌
		if(img_templist!="") { // img_list가 비어있지 않을 경우			
			img_list = img_templist.split(",");
			for(int i = 0 ; i<imgCount; i++) {
				map.put("UPLOAD_SAVE_NAME", img_list[i]);
				System.out.println((i+1)+"번째업로드 ==========================================");
				goodsDao.insertFile(map); 
				System.out.println((i+1)+"번째업로드끝=========================================");
			}
		}
		
		map.get("GOODS_ATT_SIZE");
		map.get("GOODS_ATT_COLOR");
		System.out.println("선택한 컬러="+map.get("GOODS_ATT_COLOR"));
		System.out.println("선택한 사이즈="+map.get("GOODS_ATT_SIZE"));
		
		String Size = map.get("GOODS_ATT_SIZE").toString();
		String Color = map.get("GOODS_ATT_COLOR").toString();
		String ColorList[] = Color.split(",");
		String SizeList[] = Size.split(",");
		System.out.println(ColorList.length);
		
		for(int i=0; i <=ColorList.length-1; i++) {
			for(int j=0; j<=SizeList.length-1; j++) {
				System.out.println("배열입니당="+ColorList[i]+","+SizeList[j]);
				map.put("GOODS_ATT_SIZE", SizeList[j]);
				map.put("GOODS_ATT_COLOR", ColorList[i]);
				goodsDao.goodsAttribute(map);
				
			}
		}
		
	}
	
	@Override
	public void insertGoodsLike(Map<String, Object> map) throws Exception{
		goodsDao.insertGoodsLike(map);
	}

	@Override
	public void deleteGoodsLike(Map<String, Object> map) throws Exception{
		goodsDao.deleteGoodsLike(map);
	}


//	@Override
//	public int insertBasket(List<CommandMap> list, HttpServletRequest request) throws Exception {
//		int resultYn = 0;
////		Map<String,Object> map = new HashMap<String,Object>();
////		if(null != list && list.size() >0) {
////			for(CommandMap data : list) {
////				for(Map.Entry<String, Object> entry : data.entrySet()) {
////					String key = entry.getKey();
////					Object value = entry.getValue();
////					map.put(key, value);
////					resultYn = goodsDao.insertBasket(map);
////					return 0;
////				}
////			}
////		}
//		//resultYn = goodsDao.insertBasket(list.get(1)); 
//		//String[] Size = (String[]) list.get(0).get("list");
//		//System.out.println("사이즈입니당="+Size);
//		System.out.println("서비스 호출전 전체"+list.get(0).get("ORDER_SIZE"));
//		//System.out.println("서비스 호출전 0번 인덱스 list="+list.get(0).get("ORDER_SIZE"));
//		//System.out.println("서비스 호출전 1번 인덱스 list="+list.get(1).get("ORDER_SIZE"));
//		
//		
//		
//		
//		for(CommandMap data : list) {
//			
//			String[] Size = (String[])  data.getMap().get("ORDER_SIZE");
//			System.out.println("data.getMap()="+Size);
//			
//			System.out.println("list00000="+ list.size());
//			resultYn = goodsDao.insertBasket(data.getMap());
//			
//			
//			if(resultYn < 1) {
//				System.out.println("error : " + data.getMap());
//				return 0;
//			}
//		}
//		
//		
////		for(int i=0; i < list.size(); i++) {
////			Map data = list.get(i).getMap();
////			list.remove(i);
////			System.out.println("list00000="+ list.size());
////			resultYn = goodsDao.insertBasket(data);
////			data.remove("resultList");  
////			System.out.println("data.getMap()="+data);
////			if(resultYn < 1) {
////				System.out.println("error : " + data);
////				return 0;
////			}
////		}
//		
//		return 1;
//	}
//	
	
	
	
	
	@Override
	public void insertBasket(Map<String, Object> map, HttpServletRequest request) throws Exception {
		map.remove("resultList");
		System.out.println("서비스맵"+map);
		goodsDao.insertBasket(map);
			
	}
	

	@Override
	public Map<String, Object> selectGoodsAttNum(Map<String, Object> map) throws Exception {
		
		return goodsDao.selectGoodsAttNum(map);
	}

	@Override
	public List<Map<String, Object>> selectBasketNo(Map<String, Object> map) throws Exception {
		
		return goodsDao.selectBasketNo(map);
	}

	@Override
	public List<Map<String, Object>> selectGoodsQna(Map<String, Object> map) throws Exception { // 상품Qna 리스트
		
		return goodsDao.selectGoodsQna(map);
	}

	@Override
	public void insertGoodsQna(Map<String, Object> map, HttpServletRequest request) throws Exception {// 상품 QNA 등록
		goodsDao.insertGoodsQna(map);
		
	}

	@Override
	public List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception {// 리뷰리스트
		return goodsDao.selectReviewList(map);
	}

	@Override
	public void insertGoodsReview(Map<String, Object> map, HttpServletRequest request) throws Exception {// 리뷰 등록
		
		// 내용에서 이미지 긁어오기 시작
		String img_templist=""; // 이미지 링크를 ','를 기준으로 냐열해둠, 아직 사용 안함
		String img_list[] = {}; // ','로 구분된 문자열을 나눠서 배열에 담음
		String img_thumb=""; // img_list의 첫번째 경로를 저장함
		String comp_text=" src=\"/stu/file/"; // 반복문 안에 temp와 비교될 텍스느. equals(" src=\"")는 안되길래 따로 빼둠
		System.out.println("comp_text="+comp_text);
		String content = (String)map.get("REVIEW_CONTENT"); // 저장된 본문을 불러옴
		int imgCount = 0;  // src="D:\sts4File\      " src=\"/nnS/file/";
		for(int i = 0; i+16 < content.length(); i++) { // 텍스트 비교
			String temp=""; // 잘라진 텍스트가 임시로 들어갈 공간
			
			temp = content.substring(i,i+16); // content에서 잘라낸 텍스트를 temp에 저장
			if(temp.equals(comp_text)) { // temp와 temp_text가 같을 경우
				img_templist += content.substring(i+16, i+52)+","; // img_list에 잘라진 텍스트 추가 및 구분을 위한 쉼표 삽입
				System.out.println("img_templist = " + img_templist);
				imgCount++;
			}
			System.out.println("temp =" + temp);
		}
		if(img_templist!="") { // img_list가 비어있지 않을 경우			
			img_templist = img_templist.substring(0, img_templist.length()-1); // 경로 뒤에 남는 쉼표 제거
			img_thumb = img_templist.substring(0, 36); // 이미지가 있을 경우 첫번째 경로를 썸네일로 저장해줌
			map.put("REVIEW_IMG", img_thumb); // 썸네일 값 전달
		} else { // img_list가 비어이을 경우
			map.put("REVIEW_IMG",""); // 이미지 없음
		}
		// 내용에서 이미지 긁어오기 끝
		
		// 상품정보 등록 쿼리 실행
		goodsDao.insertGoodsReview(map);
		System.out.println("****12132* " + map);
		
		// 상품 등록 시 IDX 값을 받아 이미지 테이블에 값들을 담아줌
		if(img_templist!="") { // img_list가 비어있지 않을 경우			
			img_list = img_templist.split(",");
			for(int i = 0 ; i<imgCount; i++) {
				map.put("UPLOAD_SAVE_NAME", img_list[i]);
				System.out.println((i+1)+"번째업로드 ==========================================");
				goodsDao.insertReviewFile(map); 
				System.out.println((i+1)+"번째업로드끝=========================================");
			}
		}
		
	}



}
