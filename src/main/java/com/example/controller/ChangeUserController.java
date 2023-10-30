package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.dto.UserDTO;
import com.example.service.ChangeUserService;

@Controller
public class ChangeUserController {

	@Autowired
	ChangeUserService service;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping("menu/changeUser")
	public String changeUser() {
		return "menu/changeUser";
	}
	
	@RequestMapping("menu/getUserInfo") 
	public @ResponseBody Map<String, Object> getUserInfo(HttpSession session, @RequestParam HashMap<String, Object> param){
		Map<String, Object> getUserInfo = new HashMap<>();
		UserDTO Udto = (UserDTO) session.getAttribute("login");
		if(Udto != null) {
			param.put("user_no", Udto.getUser_no());
			getUserInfo = service.getUserInfo(param);
		}
		return getUserInfo;
	}
	
	@RequestMapping("menu/changeInfo") 
	public @ResponseBody Map<String, Object> changeInfo(HttpSession session, @RequestParam HashMap<String, Object> param){
		Map<String, Object> getUserInfo = new HashMap<>();
		int upDate = 0;
		UserDTO Udto = (UserDTO) session.getAttribute("login");
		if(Udto != null) {
			param.put("user_no", Udto.getUser_no());
			upDate = service.changeInfo(session, param);
		}
		getUserInfo.put("upDate", upDate);
		return getUserInfo;
	}
	
	@RequestMapping("testtest")
	public ModelAndView testtest() {
		ModelAndView mav =  new ModelAndView();
		mav.setViewName("testtest");
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/dlfmaqusrudgkrl")
	public Object dlfmaqusrudgkrl(String chkpw,HttpSession session) {
		//로그인 되었는지 확인. 시큐리티에 있으면 뺴도 되는 부분
		Object match = false;
		
		if(session.getAttribute("login")!=null) {
			UserDTO dto = (UserDTO) session.getAttribute("login");
			String type = dto.getUser_type();
			//1. 로그인했는데 카카오 회원이라면
			if(type.equals("kakao")) {
				// "카카오로 가입된 회원입니다"; ?
				match = "카카오로 가입된 회원";
				//일단 비번은 상관없이 카카오니까 로그인 통과
				
			//2.유저타입이 관리자라면 	
			}else if(type.equals("admin")){
				//관리자 페이지로 이동?
				
			//3. 일반 회원일 경우 비번 비교
			}else if(type.equals("member")){
				String user_pw =  dto.getUser_pw();
				System.out.println(user_pw);
				//받은 비번을 dto의 암호화값과 비교
				
				//입력한 원본값(암호화 x)과 db에 저장된 암호화 값 비교
				match = passwordEncoder.matches(chkpw, user_pw);
			}//else if
		}else {//세션에 로그인 값 없을 때
			match ="세션에 로그인 x";
		}
		return match;
	}//method
	
}
