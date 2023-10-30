package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.CartDTO;
import com.example.dto.PageDTO;
import com.example.dto.ProductDTO;

@Repository
public class ChatDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public List<Object> getSelectMyRoom(HashMap<Object, Object> param) {
		System.out.println("여기 다오 "+param);
		List<Object> list = template.selectList("getSelectMyRoom", param);
		return list;
	}
	
	public Integer insertChatingRoom(HashMap<Object, Object> param) {
		System.out.println("여기 다오 "+param);
		int n = template.insert("insertChatingRoom", param);
		return n;
	}
	
	public Integer setChatingMsg(HashMap<Object, Object> param) {
		System.out.println("여기 다오 "+param);
		int n = template.insert("setChatingMsg", param);
		return n;
	}
	
	public List<HashMap<String, Object>> getChatingMsg(HashMap<Object, Object> param) {
		System.out.println("여기 다오 "+param);
		List<HashMap<String, Object>> list = template.selectList("getChatingMsg", param);
		return list;
	}
}
