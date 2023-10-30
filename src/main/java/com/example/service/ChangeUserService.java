package com.example.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dto.UserDTO;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Service
public class ChangeUserService {
	
	@Autowired
	SqlSessionTemplate template;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	public Map<String, Object> getUserInfo(@RequestParam HashMap<String, Object> param) {
		Map<String, Object> getUserInfo = new HashMap<>();
		getUserInfo = template.selectOne("userInfo", param);
		return getUserInfo;
	}
	
	public Integer changeInfo(HttpSession session, @RequestParam HashMap<String, Object> param) {
		System.out.println("param : "+param);
		param.put("password1", passwordEncoder.encode(param.get("password1").toString()));
//		if(param.get("userNickname").equals("") || param.get("userNickname").equals(null)) {
//			UserDTO Udto = (UserDTO) session.getAttribute("login");
//			param.put("userNickname", Udto.getUser_nickname());
//		}
		int upDate = template.update("changeInfo", param);
		return upDate;
	}

}
