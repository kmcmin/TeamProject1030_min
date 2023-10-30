package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.dto.CommentsDTO;
import com.example.dto.CommunityDTO;
import com.example.dto.FileDTO;
import com.example.dto.ReviewDTO;
import com.example.dto.UserDTO;
import com.example.service.CommentsService;
import com.example.service.CommunityService;
import com.example.service.FileService;
import com.google.gson.JsonObject;

@Controller
public class CommunityController {
	@Autowired
	CommunityService service;
	@Autowired
	FileService fservice;
	@Autowired
	CommentsService cservice;

	// 커뮤니티 글 등록 폼
	@RequestMapping("/communityForm")
	public String communityForm() {
		return "uploadSummernoteImageFile";
	}

	// 커뮤니티글 상세 보기
	@RequestMapping("/communityRetrieve")
	public String communityRetrieve(int COMMU_NO, Model m, HashMap<String, Object> map,HttpSession session) {
		UserDTO udto = (UserDTO) session.getAttribute("login");
		if(udto!=null) {
		String userId=udto.getUser_id();
		m.addAttribute("userId", userId);
		}
		CommunityDTO onecommu = service.oneCommu(COMMU_NO);
		System.out.println(onecommu);
		m.addAttribute("onecommu", onecommu);

		// 모댓글 보기
		List<CommentsDTO> list = cservice.commentsList(COMMU_NO);
		m.addAttribute("comments", list);
		System.out.println("리스트1");
		System.out.println(list.size());
		if (list.size() != 0) {
			// 대댓글 보기
			List<Integer> reList=new ArrayList<Integer>();
			for (CommentsDTO comment : list) {
				int COMMENTS_NO = comment.getCOMMENTS_NO();
				System.out.println("모댓글 번호" + COMMENTS_NO);
				reList.add(COMMENTS_NO);
				map.put("COMMU_NO", COMMU_NO); // 커뮤니티 번호
//				map.put("COMMENTS_NO", COMMENTS_NO); // 모댓글 번호
				map.put("COMMENTS_NO", reList); // 모댓글 번호
			}

			List<List<CommentsDTO>> list2 = cservice.replyList(map);
			System.out.println("컨트롤러야! 대댓글 리스트"+list2);
			System.out.println(list2.size());
//			for (List<CommentsDTO> list3 : list2) {
//				System.out.println("리스트3"+list3.size());
//			}
			if (list2 != null) {
				m.addAttribute("replys", list2);
			}
		}

		return "CustomerService/communityRetrieve";
	}

	// 커뮤니티+글 목록
	@RequestMapping("/locCommu")
	public String locCommu(Model m) {
		List<CommunityDTO> commus = service.commuList(); // 커뮤니티 리스트
		m.addAttribute("commus", commus);
		return "CustomerService/localCommunities";
	}

	// 커뮤니티 글 등록
	@RequestMapping("/commuAdd")
	public String commuAdd(Model m, String commutitle, String commucontent, HttpSession session) {
		UserDTO udto = (UserDTO) session.getAttribute("login");
		if (udto != null) {
			CommunityDTO cdto = new CommunityDTO();
			cdto.setUser_no(udto.getUser_no());
			cdto.setUSER_ID(udto.getUser_id());
			cdto.setCOMMU_SUMMER(commucontent);
			cdto.setCOMMU_TITLE(commutitle);
			System.out.println(cdto);
			int n = service.commuAdd(cdto); // 커뮤니티 글추가
		}
		return "redirect:locCommu";
	}

	@PostMapping(value = "/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws IOException {
		System.out.println("파일" + multipartFile);
		JsonObject jsonObject = new JsonObject();

		String fileRoot = "C:\\summernote_image\\"; // 저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename(); // 원본 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자

		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
		File targetFile = new File(fileRoot + savedFileName); // 파일경로+ 파일 이름
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			jsonObject.addProperty("url", "/app/summernoteImage/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		System.out.println(jsonObject);
		return jsonObject + "";
	}
}
