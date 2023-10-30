package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.dto.FileDTO;
import com.example.dto.ReviewDTO;
import com.example.dto.UserDTO;
import com.example.service.FileService;
import com.example.service.ReviewService;

@Controller
//상품  문의 컨트롤러
public class ReviewController {
	@Autowired
	ReviewService service;
	@Autowired
	FileService fservise;

	@Value("${upload.path}")
	private String uploadPath; //업로드 될 폴더 경로

	// 상품 리뷰 등록 폼으로
	@RequestMapping("/reviewForm")
	public String reviewAdd(String pCode,Model m) {
		m.addAttribute("pCode",pCode);
		return "review";
	}
	
	// 상품 리뷰 등록
	@RequestMapping("/reviewAdd")
	public String reviewAdd(String pCode,MultipartFile[] files, String reviewtext,String reviewTitle,
			ReviewDTO rdto,HttpSession session, Model m,HashMap<String, String> map) {
		System.out.println(reviewTitle);
		UserDTO udto=(UserDTO)session.getAttribute("login");
		if(udto!=null) {
		int user_no=udto.getUser_no();
		String user_id=udto.getUser_id();
        //리뷰 먼저 등록
		rdto.setUSER_ID(user_id);
        rdto.setREVIEW_CONTENT(reviewtext);
        rdto.setUSER_NO(user_no);
        rdto.setPRODUCT_CODE(pCode);
        rdto.setREVIEW_TITLE(reviewTitle);
        int n=service.reviewAdd(rdto); //리뷰 db에 저장
        System.out.println("리뷰 저장");
        //파일에 저장할 리뷰 넘버 꺼내오기-유저 아이디 사용 //리뷰 시퀀스랑
        map.put("user_id", user_id);
        map.put("pCode", pCode);
        
        int reviewNo=service.selReviewNo(map); //아이디만 넘기면 다른 리뷰들도 포함
		for (MultipartFile file : files) {
			String originalName = file.getOriginalFilename();//모든 경로를 포함한 파일이름
			String fileName = originalName.substring(originalName.lastIndexOf("//") + 1); //원본 파일
		        String folderPath = makeFolder();
		        String uuid = UUID.randomUUID().toString();
		        //저장할 파일 이름 중간에 "_"를 이용하여 구분
		        String saveName = uploadPath + File.separator + folderPath +File.separator + uuid + "_" + fileName;
		        Path savePath = Paths.get(saveName);
	            //Paths.get() 메서드는 특정 경로의 파일 정보를 가져온다.(경로 정의하기)
		        String saveFileName=saveName.substring(saveName.lastIndexOf("\\")+1); //바꾼 파일 이름
//		        String svaeFilePath=saveName.substring(0,saveName.lastIndexOf("\\")+1); // 파일 경로         
//		        System.out.println(svaeFilePath);
		        String svaeFilePath=saveName.substring(19,saveName.lastIndexOf("\\")+1); // 파일 경로         
	            try {
	                file.transferTo(savePath);
	              //  파일 db에 저장
	                FileDTO fdto=new FileDTO();
	                fdto.setSEQ_NO(reviewNo);
	                fdto.setFileName(fileName);
	                fdto.setSaveFileName(saveFileName);
	                fdto.setSaveFilePath(svaeFilePath);
	                fdto.setTB_TYPE("TB_REVIEW");
	                System.out.println("여기 파일 확인"+fdto);
	                int n1=fservise.addFile(fdto);
	                System.out.println(n1);
	                
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
		return "main";
		}
		else {
			return "main";
		}
	}
	//폴더 생성
	private String makeFolder() {
		// LocalDate를 문자열로 포멧
		String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
		String folderPath = str.replace("/",File.separator);
		// make folder ==================
		File uploadPathFoler = new File(uploadPath, folderPath);
		// File newFile= new File(dir,"파일명");
		// ->부모 디렉토리를 파라미터로 인스턴스 생성

		if (uploadPathFoler.exists() == false) {
			uploadPathFoler.mkdirs();
			// 만약 uploadPathFolder가 존재하지 않는다면 makeDirectory하라는 의미
			// mkdir(): 디렉토리에 상위 디렉토리가 존재하지 않을경우에는 생성이 불가능한 함수
			// mkdirs(): 디렉토리의 상위 디렉토리가 존재하지 않을 경우에는 상위 디렉토리까지 모두 생성하는 함수
		}
		return folderPath;
	}

	
	// 상품 문의 등록
	@RequestMapping("/inquireAdd")
	public @ResponseBody String inquireAdd(ReviewDTO dto, HttpSession session) {
		UserDTO Udto = (UserDTO) session.getAttribute("login");
		int userNo = Udto.getUser_no();
		dto.setUSER_NO(userNo);
		int n = service.inquireAdd(dto);
		System.out.println(n);
		return "redirect:inquireList";
	}

//	@RequestMapping("/inquireList")
//	public @ResponseBody String inquireList(HttpSession session,Model m) {
//		UserDTO Udto = (UserDTO) session.getAttribute("login");
//		int userNo=Udto.getUser_no();
//		dto.setUSER_NO(userNo);
//		int n=service.inquireAdd(dto);
//		System.out.println(n);
//		return "redirect:cart";
//	}

}
