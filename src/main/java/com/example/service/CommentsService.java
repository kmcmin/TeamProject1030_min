package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CommentsDAO;
import com.example.dto.CommentsDTO;

@Service("CommentsService")
public class CommentsService {
	
	@Autowired
	CommentsDAO dao;

	public void commentsAdd(CommentsDTO codto) {
		dao.commentsAdd(codto);
	}

	public List<CommentsDTO> commentsList(int COMMU_NO) {
		List<CommentsDTO> list=dao.commentsList(COMMU_NO);
		return list;
	}

	public int replyadd(CommentsDTO cdto) {
		int n=dao.replyadd(cdto);
		return n;
	}

	public List<List<CommentsDTO>> replyList(HashMap<String, Object> map) {
		List<List<CommentsDTO>> list=dao.replyList(map);
		return list;
	}

	public int commentsdel(int commentsNO) {
		int n=dao.commentsdel(commentsNO);
		return n;
	}

	public int replydel(int replyNO) {
		int n=dao.replydel(replyNO);
		return n;
	}

}
