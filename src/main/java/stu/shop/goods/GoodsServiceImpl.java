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
	public List<Map<String, Object>> cateGoodsList(Map<String, Object> map) throws Exception { // 카테고리별 상품
		
		return goodsDao.cateGoodsList(map);
	}

	@Override
	public Map<String, Object> goodsDetail(Map<String, Object> map) throws Exception {
		
		goodsDao.goodsHitCnt(map);
		Map<String, Object> resultMap = goodsDao.goodsDetail(map);

		return resultMap;
	}

	@Override
	public void goodsInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		goodsDao.goodsInsert(map);
		
		goodsDao.goodsAttribute(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
			goodsDao.insertFile(list.get(i));
		}
		
		//HttpServletRequest를 MultipartHttpServletRequest로 변형
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
				
		//파일 이름 가져오기
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); 
				
		MultipartFile multipartFile = null;
				
		while(iterator.hasNext()) {//파일이 존재하는지 확인
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());//파일가져옴
					
			if(multipartFile.isEmpty() == false) {//파일이 존재하면
						
				log.debug("------------- file start -------------"); //로그찍기
				log.debug("name : "+multipartFile.getName()); 
				log.debug("filename : "+multipartFile.getOriginalFilename()); 
				log.debug("size : "+multipartFile.getSize()); 
				log.debug("-------------- file end --------------\n");
					
					}
					
				}
		
	}





}
