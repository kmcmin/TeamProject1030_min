package com.example.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.CommentsDTO;


@Repository
public class CommentsDAO {
	
	@Autowired
	SqlSessionTemplate session;

	public void commentsAdd(CommentsDTO codto) {
		System.out.println("디에이오"+codto);
		session.insert("commentsAdd",codto);
	}

	public List<CommentsDTO> commentsList(int COMMU_NO) {
		List<CommentsDTO> list=session.selectList("commentsList",COMMU_NO);
		return list;
	}

	public int replyadd(CommentsDTO cdto) {
		int n=session.insert("replyadd",cdto);
		return n;
	}

	public List<List<CommentsDTO>> replyList(HashMap<String, Object> map) {
		List<Integer> reList= (List<Integer>) map.get("COMMENTS_NO");
		System.out.println("dao리스트"+reList);
		List<List<CommentsDTO>> replyList= new ArrayList();
		int COMMU_NO=(Integer)map.get("COMMU_NO");
		System.out.println(COMMU_NO);
		
		for (Integer COMMENTS_NO : reList) {
		System.out.println("dao2"+COMMENTS_NO);
		HashMap<String,Integer> map2=new HashMap<String,Integer>();
		map2.put("COMMENTS_NO",COMMENTS_NO);
		map2.put("COMMU_NO",COMMU_NO);
		List<CommentsDTO> oneRelpy=session.selectList("replyList",map2);
		System.out.println(replyList);
		replyList.add(oneRelpy);
		}
		
		return replyList;
	}

	public int commentsdel(int commentsNO) {
		int n=session.update("commentsdel",commentsNO);
		return n;
	}

	public int replydel(int replyNO) {
		int n=session.update("replydel",replyNO);
		return n;
	}

}
