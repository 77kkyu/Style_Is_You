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
	private static final String filePath = "D:\\sts4-workspace\\stu\\src\\main\\webapp\\file";
	@RequestMapping(value="/fileupload.do", method=RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, 
            MultipartHttpServletRequest multiFile) throws Exception {
	JsonObject json = new JsonObject();
	PrintWriter printWriter = null;
	OutputStream out = null;
	MultipartFile file = multiFile.getFile("upload");
	if(file != null){
		if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())){
			if(file.getContentType().toLowerCase().startsWith("image/")){
				try{
					String fileName = file.getOriginalFilename();
					
					System.out.println("fileName="+fileName);
					byte[] bytes = file.getBytes();
					//String uploadPath = filePath;
					String uploadPath = req.getSession().getServletContext().getRealPath("/file"); //톰캣서버 경로
					System.out.println("uploadPath="+uploadPath);
					File uploadFile = new File(uploadPath);
					
					System.out.println("uploadFile"+uploadFile);
					if(!uploadFile.exists()){
						uploadFile.mkdirs();
					}
					
					String fileName1 = fileName.substring(fileName.lastIndexOf(".")); //확장자 
					fileName = CommonUtils.getRandomString() + fileName1;
					//fileName = UUID.randomUUID().toString();
					System.out.println("fileName="+fileName);
					uploadPath = uploadPath + "/" + fileName;
					System.out.println("uploadPath="+uploadPath);
					out = new FileOutputStream(new File(uploadPath));
                   out.write(bytes);
                   
                   printWriter = resp.getWriter();
                   System.out.println("printWriter="+printWriter);
                   
                   resp.setContentType("text/html");
                   String fileUrl = req.getContextPath()+"/file/"+fileName;
                   System.out.println("fileUrl="+fileUrl);
                    
                   // json 데이터로 등록
                   // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                   // 이런 형태로 리턴이 나가야함.
                   json.addProperty("uploaded", 1);
                   json.addProperty("fileName", fileName);
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
	
	
	
	
	@RequestMapping(value="/fileReviewUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public String fileReviewUpload(HttpServletRequest req, HttpServletResponse resp, 
            MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if(file != null){
			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())){
				if(file.getContentType().toLowerCase().startsWith("image/")){
					try{
						String fileName = file.getOriginalFilename();
						
						System.out.println("fileName="+fileName);
						byte[] bytes = file.getBytes();
						String uploadPath = req.getSession().getServletContext().getRealPath("/file");
						
						System.out.println("uploadPath="+uploadPath);
						File uploadFile = new File(uploadPath);
						
						System.out.println("uploadFile"+uploadFile);
						if(!uploadFile.exists()){
							uploadFile.mkdirs();
						}
						
						String fileName1 = fileName.substring(fileName.lastIndexOf("."));
						fileName = CommonUtils.getRandomString() + fileName1;
						//fileName = UUID.randomUUID().toString();
						System.out.println("fileName="+fileName);
						uploadPath = uploadPath + "/" + fileName;
						System.out.println("uploadPath="+uploadPath);
						out = new FileOutputStream(new File(uploadPath));
	                   out.write(bytes);
	                   
	                   printWriter = resp.getWriter();
	                   System.out.println("printWriter="+printWriter);
	                   
	                   resp.setContentType("text/html");
	                   String fileUrl = req.getContextPath()+"/file/"+fileName;
	                   System.out.println("fileUrl="+fileUrl);
	                    
	                   // json 데이터로 등록
	                   // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
	                   // 이런 형태로 리턴이 나가야함.
	                   json.addProperty("uploaded", 1);
	                   json.addProperty("fileName", fileName);
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
