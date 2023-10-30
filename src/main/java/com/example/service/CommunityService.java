package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CommunityDAO;
import com.example.dto.CommunityDTO;

@Service("CommunityService")
public class CommunityService {
	@Autowired
	CommunityDAO dao;
	
	public int commuAdd(CommunityDTO dto) {
		int n=dao.commuAdd(dto);
		return n;
	}

	public int commNo(int user_no) {
		int comm_no=dao.commNo(user_no);
		return comm_no;
	}

	public List<CommunityDTO> commuList() {
		List<CommunityDTO> commus=dao.commuList();
		return commus;
	}

	public CommunityDTO oneCommu(Integer COMMU_NO) {
		CommunityDTO onecommu=dao.oneCommu(COMMU_NO);
		return onecommu;
		
	}


	
}
