package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.CommentsDTO;
import com.example.dto.UserDTO;
import com.example.service.CommentsService;

@Controller
public class CommentsController {

	@Autowired
	CommentsService service;

	// 모댓글 등록
	@RequestMapping("/commentsadd") // 댓글,아이디,커뮤니티 넘버
	public String commentsadd(int commuNo, String commentsCon, HttpSession session) {
		UserDTO udto = (UserDTO) session.getAttribute("login");
		CommentsDTO codto = new CommentsDTO();
		codto.setUSER_ID(udto.getUser_id());
		codto.setCOMMENTS_CONTENT(commentsCon);
		codto.setCOMMU_NO(commuNo);
		service.commentsAdd(codto); // 대댓글 추가
		// 커뮤니티 번호, 모댓글 번호

		return "redirect:communityRetrieve?COMMU_NO=" + commuNo;
	}

	// 대댓글 등록
	@PostMapping("/replyadd") // 댓글,아이디,커뮤니티 넘버
	public  String replyadd(String rereply, int COMMENTS_NO, String TAGGED_USER, int COMMU_NO,
		String REPLY_CON, HttpSession session) {
		System.out.println("개빡치네");
		UserDTO udto=(UserDTO)session.getAttribute("login");
		CommentsDTO cdto=new CommentsDTO();
		cdto.setUSER_ID(udto.getUser_id()); // 대댓글 작성자
		cdto.setCOMMENTS_NO(COMMENTS_NO); // 모댓글 번호
		cdto.setCOMMU_NO(COMMU_NO); //커뮤니티 글 번호
		cdto.setCOMMENTS_CONTENT(REPLY_CON); // 대댓글 내용
		String rereply1 = rereply;
		//태그된 유저가 없는 대댓글
		if (rereply1.isEmpty()) {
			System.out.println("여긴데");
		cdto.setTAGGED_USER(TAGGED_USER); //태그된 유저
		System.out.println(cdto);
		   int n=service.replyadd(cdto);
			System.out.println(n);
		//태그된 유저가 있는 대댓글
		} else {
			System.out.println("0아님");
			cdto.setTAGGED_USER(rereply); //태그된 유저
			System.out.println(rereply);
			 int n=service.replyadd(cdto);
			System.out.println(cdto);
			System.out.println(n);
		}

		return "redirect:communityRetrieve?COMMU_NO=" + COMMU_NO;
	}
	//댓글 삭제(삭제된 댓글입니다. 띄우기)
	@PostMapping("/commentsdel")
	public@ResponseBody String commentsdel(int commentsNO) {
		System.out.println("넘어온 값"+commentsNO);
		int n=service.commentsdel(commentsNO);
		String success="삭제된 메세지 입니다.";
		return success;
	}
	//대댓글 삭제
	@PostMapping("/replydel")
	public@ResponseBody String replydel(int replyNO) {
		System.out.println("넘어온 값"+replyNO);
		int n=service.replydel(replyNO);
		String success="삭제된 메세지 입니다.";
		return success;
	}
}
