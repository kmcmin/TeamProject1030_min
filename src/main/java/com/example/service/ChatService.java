package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dao.ChatDAO;

@Service
public class ChatService {
	
	@Autowired
	ChatDAO dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	public List<Object> getSelectMyRoom(@RequestParam HashMap<Object, Object> param) {
		System.out.println("여기 서비스 "+param);
		List<Object> list = dao.getSelectMyRoom(param);
		return list;
	}
	
	public Integer insertChatingRoom(@RequestParam HashMap<Object, Object> param) {
		System.out.println("여기 서비스 "+param);
		int n = dao.insertChatingRoom(param);
		return n;
	}
	
	public Integer setChatingMsg(@RequestParam HashMap<Object, Object> param) {
		System.out.println("여기 서비스 "+param);
		int n = dao.setChatingMsg(param);
		return n;
	}
	
	public List<HashMap<String, Object>>getChatingMsg(@RequestParam HashMap<Object, Object> param) {
		System.out.println("여기 서비스 "+param);
		List<HashMap<String, Object>> list = dao.getChatingMsg(param);
		return list;
	}
	
}
