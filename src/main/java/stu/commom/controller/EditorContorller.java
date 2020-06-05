package stu.commom.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import stu.common.util.CommonUtils;

@Controller
@RequestMapping("/ckeditor")
public class EditorContorller {
	private static final String filePath = "D:\\sts4File\\";
	@RequestMapping(value="/fileupload.do", method=RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, 
                 MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		String UPLOAD_ORIGIN_NAME = null;
		String originalFileExtension = null;
		String UPLOAD_SAVE_NAME = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		System.out.println("file :"+ file);
		if(file != null){
			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())){
				if(file.getContentType().toLowerCase().startsWith("image/")){
					try{
						String fileName = file.getName();
						
						UPLOAD_ORIGIN_NAME = file.getOriginalFilename();
						System.out.println("UPLOAD_ORIGIN_NAME = " + UPLOAD_ORIGIN_NAME );
						
						originalFileExtension = UPLOAD_ORIGIN_NAME.substring(UPLOAD_ORIGIN_NAME.lastIndexOf("."));
						UPLOAD_SAVE_NAME = CommonUtils.getRandomString() + originalFileExtension;
						
						file.transferTo(new File(filePath + UPLOAD_SAVE_NAME));
						
//						byte[] bytes = file.getBytes();
//						String uploadPath = req.getSession().getServletContext().getRealPath("/file");
//						System.out.println("uploadPath"+uploadPath);
//						File uploadFile = new File(uploadPath);
//						if(!uploadFile.exists()){
//							uploadFile.mkdirs();
//						}
//						fileName = UUID.randomUUID().toString();
//						uploadPath = uploadPath + "/" + fileName;
//						out = new FileOutputStream(new File(uploadPath));
//                        out.write(bytes);
//                        
                        printWriter = resp.getWriter();
//                        resp.setContentType("text/html");
//                        String fileUrl = req.getContextPath() + "/file/" + fileName;
                        
                        // json 데이터로 등록
                        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                        // 이런 형태로 리턴이 나가야함.
						
						String fileUrl = filePath + UPLOAD_SAVE_NAME;
						System.out.println("fileUrl = " + fileUrl);
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", UPLOAD_ORIGIN_NAME);
                        json.addProperty("url", fileUrl);
                        
                        printWriter.println(json);
                    }catch(IOException e){
                        e.printStackTrace();
                    }finally{
                        if(out != null){
                            out.close();
                        }
                        if(printWriter != null){
                            printWriter.close();
                        }		
					}
				}
			}
		}
		return null;
	}	
	
}

