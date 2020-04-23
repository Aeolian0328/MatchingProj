package upload.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URL;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import upload.service.UploadDto;
import upload.service.UploadService;

@Controller
public class UploadController {

	String filename;
	String path1;
	String path2;
    byte barr[] = new byte[100];
	 
	@Autowired
	UploadService service;
	

	// 업로드 양식 불러오기(index)
	@RequestMapping(value = "upload.do", method = RequestMethod.GET)
	public String form(HttpSession session) {
		return "uploader/enroll";
	}
	
	//과목명 중복 확인
	  @RequestMapping(value = "checkSubject.do" , method = RequestMethod.POST)
	  public @ResponseBody String check(@ModelAttribute("ck") UploadDto ck , Model model) throws Exception
	  
	  { 
		  int result = service.subjectCheck(ck.getSubjectName()); 
		  return String.valueOf(result); 
		  
		  }
	
	// DB에 값 보내기 + 날짜 형식 변경(yyyy-MM-dd hh:mm:ss)
	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public String insert(@ModelAttribute("insert") UploadDto dto) {

			
			sendData();

			String str = dto.getStartTime();
			String[] array = str.split(" ");
			
			String[] y_m = array[0].split("/");
			String yyyymmdd = y_m[2]+"-"+y_m[0]+"-"+y_m[1];
		
			String[] time = array[1].split(":");
			
		if(array[2].equals("PM")) {
				time[0] =Integer.toString((Integer.parseInt(time[0]) + 12));
				
			}
			String tttt = time[0]+":"+time[1];
			
			
			dto.setStartTime(yyyymmdd+" "+tttt+":00");
			
			/////////////////////////////////////////
			

			String str1 = dto.getEndTime();
			String[] array1 = str1.split(" ");
			
			String[] y_m1 = array1[0].split("/");
			String yyyymmdd1 = y_m1[2]+"-"+y_m1[0]+"-"+y_m1[1];

	
			String[] time1 = array1[1].split(":");
			
		
			//if(Integer.parseInt(time1[0])<12)
				if(array1[2].equals("PM")){
				time1[0] =Integer.toString((Integer.parseInt(time1[0]) + 12));
				
			}
			String tttt1 = time1[0]+":"+time1[1];
			
			
			dto.setEndTime(yyyymmdd1+" "+tttt1+":00");
				
		
			
			dto.setSubjectImage(filename);
			service.insertUpload(dto);
			//service.insertUpload2(dto);
	
		return "uploader/enroll"; 
	}

	// 이미지 첨부
	@RequestMapping(value="image.do",method=RequestMethod.POST)  
	public ModelAndView upload(@RequestParam CommonsMultipartFile file,HttpSession session){  
		//String path=session.getServletContext().getRealPath("/");  
	        filename=file.getOriginalFilename();  
	        path1 = "C:\\Users\\Administrator\\Documents\\MatchingProj\\WebContent\\img\\sub_img";
	        barr=file.getBytes();
	        
	       
	    return new ModelAndView("uploader/upload-success","filename",path1+"/"+filename);  //view name / model name / model data
	}
	
	// 이미지 첨부 (확인을 눌렀을 경우 DB로 전송)
	public void sendData() {
        
		try{ 
        	
        BufferedOutputStream bout=new BufferedOutputStream(  
        		//내일 확인 꼭 
                 new FileOutputStream(path1+"/"+filename));  
        bout.write(barr);  
        bout.flush();  
        bout.close();  
        
//        storeData();
          
        } catch(Exception e){System.out.println(e);}  	
	}
	
	
	
//	public void storeData() {
//		
//		  path2 = "file:///C:/Users/Administrator/Documents/MatchingProj/WebContent/img/sub_img";
//		  
//		 try {
//		  	  String imagePath = path2+"/"+filename;
//		        BufferedImage image = null;
//		        
//		 	 //이미지를 읽어와서 BufferedImage에 넣는다.
//		     
//		      image = ImageIO.read(new URL(imagePath));
//		      
//		      
//		      
//		      int width = image.getWidth();
//		      int height = image.getHeight();
//		       
//		      //파일명 자르기
//		      String fileNm = imagePath.substring(imagePath.lastIndexOf("/") + 1);
//		      System.out.println(fileNm);
//		      // 저장할 이미지의 크기와 타입을 잡아줌.
//		      BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
//		      bufferedImage.createGraphics().drawImage(image,300,400,this);	            
//		   
//		      
//		      // 해당경로에 이미지를 저장함.
//		      ImageIO.write(bufferedImage, "jpg", new File(path2 + filename));
//		  } catch(Exception e) {
//		      e.printStackTrace();
//		  }
//		
//	}
//
//	@Override
//	public boolean imageUpdate(Image img, int infoflags, int x, int y, int width, int height) {
//		// TODO Auto-generated method stub
//		return false;
//	}
	
   
  
	
	
	
	
}
